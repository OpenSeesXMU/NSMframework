
proc addDisp {data} {
    global  dispHistory
    lappend  dispHistory  $data
}

proc addVel {data} {
    global  velHistory
    lappend  velHistory  $data
}

proc addAccel {data} {
    global  accelHistory
    lappend  accelHistory  $data
}


proc clearSeries {} {
    global  trialDispHistory
    global  dispHistory
    global  velHistory
    global  accelHistory
    set  trialDispHistory  []
    set  dispHistory  []
    set  velHistory  []
    set  accelHistory  []
}


proc trainModel {data} {

    global dtMax tol divideSteps cframe dispHistory  velHistory  accelHistory  sock0  sock1  sock2  debugMode

    source dispLoadg.tcl

    set  dtMax  0.1
    set  dt  $dtMax

    constraints Transformation;
    numberer Plain;
    system BandGeneral;
    test NormDispIncr $tol 30 0;
    algorithm Newton -initial;
    integrator LoadControl $dt
    analysis Static

if {$debugMode == 0} {
    source  addBoudaryInfoToNextLevel.tcl
}

    for {set jj 0} {$jj < 10} {incr jj} {
        analyze 1

if {$debugMode == 0} {
    source  addBoudaryInfoToNextLevel.tcl
}

    }

if {$debugMode == 0} { 
    
    puts $sock0 "trainModelGravity 10"
    puts $sock1 "trainModelGravity 10"
    puts $sock2 "trainModelGravity 10"
    gets $sock0
    gets $sock1
    gets $sock2
    
    puts $sock0 "clearSeries"
    puts $sock2 "clearSeries"
    gets $sock0
    gets $sock2

}

    set  dtMax  0.02
    set  dt  $dtMax

    wipeAnalysis
    loadConst -time 0.0
    
    source  TimeSeries.tcl
    source  LoadPattern_3.tcl

    constraints Transformation;
    numberer Plain;
    system BandGeneral;
    test NormDispIncr $tol 20 0;
    algorithm Newton;
    integrator Newmark  0.5  0.25   

    set  steps  $data
    puts "steps = $steps"
    
    source dispLoadt.tcl   
 
if {$debugMode == 0} { 
    source  addBoudaryInfoToNextLevel.tcl
}
 
    set subSteps 0
    for {set ii 0} {$ii < $steps} {incr ii} {
        for {set jj 0} {$jj < $divideSteps} {incr jj} {
            analysis Transient
            set ok [analyze 1 $dt]
            if {$ok != 0} {
                divideStepAnalysis $dt 1 $tol
            }

            source forceToLastLevel.tcl
            source recordSubForce.tcl
            
            incr cframe
            source recordEachFrameLocalForce.tcl
            source recordEachFrameNodeDispl.tcl
            source recordEachFrameSectionForce.tcl

        }

if {$debugMode == 0} { 
    source  addBoudaryInfoToNextLevel.tcl
}

    }

if {$debugMode == 0} { 

    puts $sock0 "trainModel $steps"
    puts $sock1 "trainModel $steps"
    puts $sock2 "trainModel $steps"
    gets $sock0
    gets $sock1
    gets $sock2
}
   
}

proc replaceModel {} {
    puts "replacing the model ..."

    global dtMax tol divideSteps count totalSubtituteSteps cframe dispHistory  velHistory  accelHistory  sock0  sock1  sock2  debugMode

    set  dt  $dtMax

    if {$count < $totalSubtituteSteps} {
        incr  count
    }
    set lambda [expr (1.0*$count)/$totalSubtituteSteps]


if {$debugMode == 0} { 

    set mainForce0 "[lrange [eleResponse 1 force] 0 5]"
    set mainForce2 "[lrange [eleResponse 2 force] 6 11]"

    puts $sock0 "getTrialForce"
    puts $sock2 "getTrialForce"
    set subForce0 [gets $sock0]
    set subForce2 [gets $sock2]

    set currentTime [getTime]

    puts $sock0 "clearSeries"
    puts $sock2 "clearSeries"
    gets $sock0
    gets $sock2
    source  addBoudaryInfoToNextLevel.tcl

    source correctorLoad.tcl
    source recordLambda.tcl
    source recordMainForce.tcl
    source recordSubForce.tcl
 
}

    source dispLoadr.tcl
 
    analysis Transient    
    for {set jj 0} {$jj < $divideSteps} {incr jj} {
        set ok [analyze 1 $dt]
        if {$ok != 0} {
            divideStepAnalysis $dt 1 $tol
        }

        incr cframe
        source recordEachFrameLocalForce.tcl
        source recordEachFrameNodeDispl.tcl
        source recordEachFrameSectionForce.tcl

    }
 
if {$debugMode == 0} { 
 
    set currentTime [getTime]
        
    source  addBoudaryInfoToNextLevel.tcl

    puts $sock0 "replaceModel"
    puts $sock1 "replaceModel"
    puts $sock2 "replaceModel"
    
    gets $sock0;
    gets $sock1;
    gets $sock2;
}

}
 
proc getTrialForce {} {
    global subForce
    source forceToLastLevel.tcl
}
 
proc accept {sock ip port} {
    fconfigure $sock -blocking 1 -buffering none ;#line
    fileevent $sock readable [list respond $sock]
}
 
proc respond {sock} {
    if {[eof $sock] || [catch {gets $sock data}]} {
        # end of file or abnormal connection drop
        close $sock
        puts "Close $sock" ;# $echo(addr,$sock)"
    } else {
        global  subForce  dispHistory  velHistory  accelHistory
        set subForce []
        # puts "$data"
        # safe calculator style evaluator
        set command [lindex [split $data] 0]
        if {$command == "trainModel" || $command == "replaceModel" || $command == "addDisp" || $command == "addVel" || $command == "addAccel" || $command == "clearSeries"} {
            eval $data
            puts $sock "finish"
        } elseif {$command == "getTrialForce"} {
            eval $data
            puts $sock $subForce
        }  else {
            puts "input = $data"
            puts "commands unknown, exit"
            exit
        } 
        
        flush $sock
    }
    
    # puts "dispHistory = $dispHistory"
    # puts "velHistory = $velHistory"
    # puts "accelHistory = $accelHistory"

    return
}

# ---- model ----------
set  dtMax  0.0
set  divideSteps 1
set  tol  1.0e-6
set  totalSubtituteSteps  100
set  count   0
set  cframe  0
source model.tcl

set dispHistory []; # each node: dispx, dispy, dispz, rotx, roty, rotz
set velHistory [];  #
set accelHistory [];  #

set subForce []

recorder Element -file stressStrain1.out -time -ele 1 section 1 fiber 202.5 202.5 stressStrain
recorder Element -file stressStrain2.out -time -ele 5 section 1 fiber 202.5 202.5 stressStrain
recorder Element -file stressStrain3.out -time -ele 10 section 1 fiber 202.5 202.5 stressStrain
recorder Element -file force1.out  -time -ele 1 section 1 force
recorder Element -file deform1.out -time -ele 1 section 1 deformation
recorder Element -file force2.out  -time -ele 5 section 3 force
recorder Element -file deform2.out -time -ele 5 section 3 deformation
recorder Element -file force3.out  -time -ele 10 section 5 force
recorder Element -file deform3.out -time -ele 10 section 5 deformation


set  debugMode  1

if {$debugMode == 0} { 
set sock0 [socket 192.168.0.100 8021]; 
fconfigure $sock0 -buffering none;
set sock1 [socket 192.168.0.100 8022]; 
fconfigure $sock1 -buffering none;
set sock2 [socket 192.168.0.100 8023]; 
fconfigure $sock2 -buffering none;
}

source divideStepAnalysis.tcl

socket -server accept 7901
vwait forever
