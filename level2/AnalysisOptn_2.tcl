 
source divideStepAnalysis.tcl

set sock1 [socket localhost 7901]; 
fconfigure $sock1 -buffering none;

constraints  Transformation 
test EnergyIncr 1.0e-5 10  1
integrator Newmark   0.5 0.25
algorithm KrylovNewton
numberer ParallelPlain
system Mumps -ICNTL14 500
analysis  Transient

set toUpdate 0;
set totalSubtituteSteps 100;
set currentStep 0;
set trainSteps 0;

set dt 0.02
set tol 1.0e3
set currentTime [getTime]
set steps 0
set count 0

set mainForce1 "[eleResponse 5 dynamicForce]"

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

        if {$count < $totalSubtituteSteps} {
            incr  count
        }
        set lambda [expr (1.0*$count)/$totalSubtituteSteps]


        set mainForce1 "[eleResponse 40 dynamicForce]"
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

        set currentTime [getTime]

        source  addBoudaryInfoToNextLevel.tcl

        puts $sock1 "replaceModel"
        gets $sock1;
    }
}


close $sock1