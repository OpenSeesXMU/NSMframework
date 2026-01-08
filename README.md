The released code explicitly includes the procedures for automatic identification of damaged elements, triggering of the twin substructure refinement, initialization of the refined substructure, and smooth force transition at the global–local interface, thereby ensuring full transparency and practical reproducibility of the proposed non-intrusive framework.

Next, we will briefly introduce the usage descriptions, core processes, and key functions/scripts of the main structure and substructure codes:

Level-1 (MSM driver): Runs the global dynamic analysis, decides when to train/replace, exchanges boundary histories and interface forces with Level-2 over a socket.

Level-2 (aggregator/server): Builds and solves the fine submodel(s), collects reactions at interface nodes, optionally relays boundary data to deeper cores.

Table 1. Consolidated files and roles (Level-1 and Level-2)

| File | Role | File | Role |
| :--- | :--- | :--- | :--- |
| AnalysisOptn_2.tcl | Global transient solve and state machine | LoadPattern_3.tcl | Uniform excitation |
| addBoudaryInfoToNextLevel.tcl | Push boundary kinematics | Elements.tcl | Element assembly |
| server.tcl | Command server and controller | GeoTran.tcl | Geometric transforms |
| model.tcl | Fine model build and setup | Sections.tcl | RC fiber sections, torsion aggregator |
| correctorLoad.tcl | Apply corrector loads | Materials.tcl | Concrete02 and Steel02 |
| dispLoadg.tcl | Gravity imposed motions | SPConstraint.tcl | Boundary constraints |
| dispLoadt.tcl | Transient imposed motions (full history) | NodeCoord.tcl | Nodes |
| dispLoadr.tcl | Refresh imposed motions in replacement | NodeMass.tcl | Nodal mass (template) |
| forceToLastLevel.tcl | Collect interface reactions | RayleighDamping.tcl | Damping |
| divideStepAnalysis.tcl | Robust substepping | Recorders (record*.tcl) | Output |
| TimeSeries.tcl | Earthquake time series | | |

After each analysis step, Level-1 reads the current time and the six-DOF displacement, velocity, and acceleration at its interface nodes, then sends addDisp, addVel, and addAccel in order over sock1 to Level-2, waiting for an acknowledgment after each send.

Level-2 appends these lines to its histories and, when debugMode=0, forwards the same data for node 65 over sock0 and node 2 over sock2 to downstream cores, again with per-message acks.

The receivers turn these time–DOF histories into Path/Linear time series and MultipleSupport prescribed motions, keeping boundary kinematics synchronized across all model levels.

Table 2. Training and replacement flows

| Phase | Level-1 (MSM) | Level-2 (TSM) | Data exchanged |
| :--- | :--- | :--- | :--- |
| Gravity training | Standard static/transient until trigger; continuously pushes kinematics | trainModel: dispLoadg.tcl → static analyze 10; optional downstream “trainModelGravity”; clearSeries | addDisp/addVel/addAccel; trainModelGravity/finish acks |
| Dynamic training | When toUpdate=1: puts sock1 "trainModel $steps" then switch toUpdate=2 | Newmark transient with steps=$data; dispLoadt.tcl; per substep record and forceToLastLevel | finish ack; subForce recorded per step |
| Replacement (per step) | Compute lambda, request “getTrialForce”; clearSeries; push kinematics; apply corrector; analyze; “replaceModel” | Compute mainForce0/2; request subForce0/2 from sock0/sock2; clearSeries; push kinematics; correctorLoad.tcl; dispLoadr.tcl; analyze; downstream “replaceModel” | subForce line (12 comps); finish acks for clearSeries/replaceModel |

Table 3. Interface forces and correctors

| Item | Nodes | Source/Use | Details |
| :--- | :--- | :--- | :--- |
| Upstream reactions (to L1) | L2 nodes 65 and 165 | forceToLastLevel.tcl | subForce0 = [nodeReaction 65] (6 DOFs), subForce2 = [nodeReaction 165] (6 DOFs); subForce concatenated (12 comps) |
| Corrector loads (L2) | Nodes 65 and 2 | correctorLoad.tcl | For each DOF i: timeSeries Path with times "0. t t+dt 1000." and values "0 0 ΔF ΔF", ΔF = mainForce − subForce; apply via Plain pattern and load command. DOF mapping modulo 6; tag advancement per 6 DOFs |
| Imposed motions (L2) | Nodes {65, 165} | dispLoadg/t/r.tcl | MultipleSupport patterns with groundMotion Plain: gravity uses Linear factors; transient uses Path from full histories; replacement refreshes short paths |
