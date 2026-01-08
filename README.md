# NSMframework

**Non-intrusive Numerical Substructure Method (NSM) Framework for OpenSees**

## Overview
his repository contains the source code for a non-intrusive framework capable of **automatic identification of damaged elements**, triggering of **twin substructure (TSM) refinement**, initialization of the refined substructure, and smooth force transition at the global–local interface.

The framework ensures full transparency and practical reproducibility by using standard socket communication to link global analysis models with fine-scale submodels.

## Repository Structure & Roles

Based on the multi-level architecture, the folders are organized as follows:

### 📂 `level1/` (MSM Driver)
**Role: Global Dynamic Analysis & Controller** 
* Acts as the **Main Structure Model (MSM)** driver.
* Runs the global dynamic analysis.
* Decides when to train or replace the model.
* Exchanges boundary histories (displacement/velocity/acceleration) and interface forces with Level-2 via sockets.

### 📂 `level2/` (TSM Server)
**Role: Fine Submodel Aggregator** 
* Acts as the **Twin Substructure Model (TSM)** server.
* Builds and solves the fine-scale submodel(s).
* Collects reactions at interface nodes (e.g., nodes 65 and 165).
* Optionally relays boundary data to deeper cores (if debugMode=0).

### 📂 `lib/`
**Role: Shared Resources**
Contains common scripts for element assembly, material definitions, and geometric transformations used by both levels.

---

## Key Files Description

[cite_start]The following table outlines the core scripts and their specific functions in the framework:

| Category | Filename | Role |
| :--- | :--- | :--- |
| **Control & Solve** | `AnalysisOptn_2.tcl` | Global transient solve and state machine |
| | `server.tcl` | Command server and controller |
| | `divideStepAnalysis.tcl`| Robust substepping algorithm |
| **Communication** | `addBoudaryInfoToNextLevel.tcl` | Pushes boundary kinematics to the next level |
| | `forceToLastLevel.tcl` | Collects interface reactions to send back to MSM |
| **Modeling** | `model.tcl` | Fine model build and setup |
| | `Elements.tcl` | Element assembly |
| | `Materials.tcl` | Material definitions (Concrete02, Steel02) |
| **Loading** | `correctorLoad.tcl` | Applies corrector loads (Force transition) |
| | `dispLoadg.tcl` | Gravity imposed motions |
| | `dispLoadt.tcl` | Transient imposed motions (full history) |

## Workflow Summary

The analysis proceeds through three main phases:

1.  **Gravity Training**: Standard static analysis. Level-1 continuously pushes kinematics; Level-2 performs static analysis.
2.  **Dynamic Training**: Triggered when `toUpdate=1`. Level-1 instructs Level-2 to train for `$steps`. Level-2 performs Newmark transient analysis and records sub-forces.
3.  **Replacement**: The system computes forces, requests `getTrialForce`, clears series, pushes kinematics, applies corrector loads (`correctorLoad.tcl`), and executes the replacement analysis to ensure smooth transition.

## Usage

1.  **Prerequisites**: Ensure you have a version of OpenSees installed that supports Socket commands.
2.  **Execution**:
    * Run the **`run.bat`** script to start the analysis.
    * The script will automatically launch the MSM driver (Level-1) and the necessary TSM servers (Level-2).

---

## Detailed Documentation
For a comprehensive explanation of the theory, interface forces, and step-by-step instructions, please refer to the project description:

📄 **[View Full Project Description](Description.docx)**
