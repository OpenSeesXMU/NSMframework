
# AnalysisOptn "Dynamic": Type: Transient 
# --------------------------------------- 
# Constraint Handler 
constraints  Transformation 
test EnergyIncr 1.0e-6 10  0
integrator Newmark   0.5 0.25
algorithm  KrylovNewton 
numberer RCM
system BandGeneral
analysis Transient


file mkdir "./output/recordEachFrameLocalForce/"
file mkdir "./output/recordEachFrameNodeDispl/"
file mkdir "./output/recordEachFrameSectionForce/"

set cframe 1
source recordInitNodeCoord.tcl
source recordEachFrameLocalForce.tcl
source recordEachFrameNodeDispl.tcl
source recordEachFrameSectionForce.tcl

recorder Node -file disp1.out -time -node   5  -dof 1 2 3 4 5 6 disp;
recorder Element -file stressStrain1.out -time -ele 1 section 1 fiber 202.5 0. stressStrain
recorder Element -file stressStrain2.out -time -ele 1 section 1 fiber 230. 0. stressStrain
recorder Element -file force.out  -time -ele 1 section 1 force
recorder Element -file deform.out -time -ele 1 section 1 deformation
recorder Element -file energy1.out -time -ele 1 section energy

set dt 0.01
set currentTime [getTime]
while {$currentTime < 23.0} { 
	set ok [analyze 1 $dt]

    source recordEachFrameLocalForce.tcl
    source recordEachFrameNodeDispl.tcl
    source recordEachFrameSectionForce.tcl

	set currentTime [getTime]
    incr cframe
}
