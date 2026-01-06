 
source divideStepAnalysis.tcl

set sock1 [socket localhost 7901]; 
fconfigure $sock1 -buffering none;

constraints  Transformation 
test EnergyIncr 1.0e-5 10  0
integrator Newmark   0.5 0.25
algorithm KrylovNewton
numberer RCM
system BandGeneral
analysis  Transient

set toUpdate 0;
set totalSubtituteSteps 100;
set currentStep 0;
set trainSteps 0;

set dt 0.02
set tol 1.0e-6
set currentTime [getTime]
set steps 0
set count 0

recorder Node -file disp.out -time -node 5 -disp

recorder Element -file stressStrain.out -time -ele 1 section 1 fiber 202.5 202.5 stressStrain
recorder Element -file force.out  -time -ele 1 section 1 force
recorder Element -file deform.out -time -ele 1 section 1 deformation
recorder Element -file energy1.out -time -ele 1 section energy
recorder Element -file energy2.out -time -ele 2 section energy
recorder Element -file energy3.out -time -ele 3 section energy
recorder Element -file energy4.out -time -ele 4 section energy
recorder Element -file energy5.out -time -ele 5 section energy
recorder Element -file energy6.out -time -ele 6 section energy
recorder Element -file energy7.out -time -ele 7 section energy
recorder Element -file energy8.out -time -ele 8 section energy
recorder Element -file energy9.out -time -ele 9 section energy
recorder Element -file energy10.out -time -ele 10 section energy
recorder Element -file energy11.out -time -ele 11 section energy
recorder Element -file energy12.out -time -ele 12 section energy
recorder Element -file energy13.out -time -ele 13 section energy
recorder Element -file energy14.out -time -ele 14 section energy
recorder Element -file energy15.out -time -ele 15 section energy
recorder Element -file energy16.out -time -ele 16 section energy
recorder Element -file energy17.out -time -ele 17 section energy
recorder Element -file energy18.out -time -ele 18 section energy
recorder Element -file energy19.out -time -ele 19 section energy
recorder Element -file energy20.out -time -ele 20 section energy
recorder Element -file energy21.out -time -ele 21 section energy
recorder Element -file energy22.out -time -ele 22 section energy
recorder Element -file energy23.out -time -ele 23 section energy
recorder Element -file energy24.out -time -ele 24 section energy
# recorder Element -file gforce.out  -time -ele 1 globalForce


set mainForce1 "[eleResponse 1 dynamicForce]"

set  loadCount 5
set  loadNum  [llength  $mainForce1]
for {set i 0} {$i < $loadNum} {incr i} { 
    timeSeries Linear $loadCount
    pattern Plain $loadCount $loadCount {
    }
    incr loadCount
}

set  cframe  0

source  addBoudaryInfoToNextLevel.tcl

while {$currentTime < 23. } { 
    if {$toUpdate != 2} {
        puts "currentTime: [getTime]"
        set ok [analyze 1 $dt]
        if {$ok != 0} {
            divideStepAnalysis  $dt  10
        } else {
            # exit
            # source recorder.tcl
        }

        source recordMainForce.tcl

        incr cframe
        source recordEachFrameLocalForce.tcl
        source recordEachFrameNodeDispl.tcl
        source recordEachFrameSectionForce.tcl

        set currentTime [getTime]

        incr steps
        source  addBoudaryInfoToNextLevel.tcl     
        if {$currentTime > 5.5 && $toUpdate == 0} {
            set toUpdate 1
        }
    }
    if {$toUpdate == 1} {

        puts $sock1 "trainModel $steps"
        gets $sock1

        global  toUpdate
        set  toUpdate 2
        
    } elseif {$toUpdate == 2} {
        puts "replacing fine model ......"

        if {$currentTime < 16.0} {
            if {$count < $totalSubtituteSteps} {
                incr  count
            }
            set lambda [expr (1.0*$count)/$totalSubtituteSteps]
        } else {
            if {$count > 0} {            
                incr count -1
            }
            set lambda [expr (1.0*$count)/$totalSubtituteSteps]
        }
        set lambda [expr (1.0*$count)/$totalSubtituteSteps]


        set mainForce1 "[eleResponse 1 dynamicForce]"
        puts $sock1 "getTrialForce"
        set subForce1 [gets $sock1]
        puts $sock1 "clearSeries"
        gets $sock1

        source  addBoudaryInfoToNextLevel.tcl
        
        source correctorLoad.tcl
        source recordLambda.tcl
        source recordMainForce.tcl
        source recordSubForce.tcl

        puts "currentTime: [getTime]"
        set ok [analyze 1 $dt]
        if {$ok != 0} {
            divideStepAnalysis  $dt  10
        } else {
            # exit
            # source recorder.tcl
        }

        incr cframe
        source recordEachFrameLocalForce.tcl
        source recordEachFrameNodeDispl.tcl
        source recordEachFrameSectionForce.tcl
        source recordEachFrameCorrector.tcl

        set currentTime [getTime]

        source  addBoudaryInfoToNextLevel.tcl

        puts $sock1 "replaceModel"
        gets $sock1;
    }
}


close $sock1