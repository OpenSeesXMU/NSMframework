
set  nodeTagForReplacingLastLevel  {65 165}

set  dispCount1  1
set  dispCount2  1
foreach tag $nodeTagForReplacingLastLevel {

    remove timeSeries [expr $dispCount1+0]
    remove timeSeries [expr $dispCount1+1]
    remove timeSeries [expr $dispCount1+2]
    remove timeSeries [expr $dispCount1+3]
    remove timeSeries [expr $dispCount1+4]
    remove timeSeries [expr $dispCount1+5]
    remove timeSeries [expr $dispCount1+6]
    remove timeSeries [expr $dispCount1+7]
    remove timeSeries [expr $dispCount1+8]
    remove timeSeries [expr $dispCount1+9]
    remove timeSeries [expr $dispCount1+10]
    remove timeSeries [expr $dispCount1+11]
    remove timeSeries [expr $dispCount1+12]
    remove timeSeries [expr $dispCount1+13]
    remove timeSeries [expr $dispCount1+14]
    remove timeSeries [expr $dispCount1+15]
    remove timeSeries [expr $dispCount1+16]
    remove timeSeries [expr $dispCount1+17]
    remove loadPattern [expr $dispCount1+0]
    remove loadPattern [expr $dispCount1+1]
    remove loadPattern [expr $dispCount1+2]
    remove loadPattern [expr $dispCount1+3]
    remove loadPattern [expr $dispCount1+4]
    remove loadPattern [expr $dispCount1+5]
    
    set theTime {};
    set theDisp1 {};
    set theDisp2 {};
    set theDisp3 {};
    set theDisp4 {};
    set theDisp5 {};
    set theDisp6 {};
    set theVel1 {};
    set theVel2 {};
    set theVel3 {};
    set theVel4 {};
    set theVel5 {};
    set theVel6 {};
    set theAccel1 {};
    set theAccel2 {};
    set theAccel3 {};
    set theAccel4 {};
    set theAccel5 {};
    set theAccel6 {};
    
    for {set k 0} {$k < [expr $steps+1]} {incr k} {
        lappend theTime [lindex $dispHistory  $k 0]
        lappend theDisp1 [lindex $dispHistory  $k [expr $dispCount2+0]]
        lappend theDisp2 [lindex $dispHistory  $k [expr $dispCount2+1]]
        lappend theDisp3 [lindex $dispHistory  $k [expr $dispCount2+2]]
        lappend theDisp4 [lindex $dispHistory  $k [expr $dispCount2+3]]
        lappend theDisp5 [lindex $dispHistory  $k [expr $dispCount2+4]]
        lappend theDisp6 [lindex $dispHistory  $k [expr $dispCount2+5]]
        lappend theVel1 [lindex $velHistory   $k [expr $dispCount2+0]]
        lappend theVel2 [lindex $velHistory   $k [expr $dispCount2+1]]
        lappend theVel3 [lindex $velHistory   $k [expr $dispCount2+2]]
        lappend theVel4 [lindex $velHistory   $k [expr $dispCount2+3]]
        lappend theVel5 [lindex $velHistory   $k [expr $dispCount2+4]]
        lappend theVel6 [lindex $velHistory   $k [expr $dispCount2+5]]
        lappend theAccel1 [lindex $accelHistory $k [expr $dispCount2+0]]
        lappend theAccel2 [lindex $accelHistory $k [expr $dispCount2+1]]
        lappend theAccel3 [lindex $accelHistory $k [expr $dispCount2+2]]
        lappend theAccel4 [lindex $accelHistory $k [expr $dispCount2+3]]
        lappend theAccel5 [lindex $accelHistory $k [expr $dispCount2+4]]
        lappend theAccel6 [lindex $accelHistory $k [expr $dispCount2+5]]
    }
   
    lappend theTime  1000.
    lappend theDisp1 [lindex $dispHistory  $steps [expr $dispCount2+0]]
    lappend theDisp2 [lindex $dispHistory  $steps [expr $dispCount2+1]]
    lappend theDisp3 [lindex $dispHistory  $steps [expr $dispCount2+2]]
    lappend theDisp4 [lindex $dispHistory  $steps [expr $dispCount2+3]]
    lappend theDisp5 [lindex $dispHistory  $steps [expr $dispCount2+4]]
    lappend theDisp6 [lindex $dispHistory  $steps [expr $dispCount2+5]]
    lappend theVel1 [lindex $velHistory   $steps [expr $dispCount2+0]]
    lappend theVel2 [lindex $velHistory   $steps [expr $dispCount2+1]]
    lappend theVel3 [lindex $velHistory   $steps [expr $dispCount2+2]]
    lappend theVel4 [lindex $velHistory   $steps [expr $dispCount2+3]]
    lappend theVel5 [lindex $velHistory   $steps [expr $dispCount2+4]]
    lappend theVel6 [lindex $velHistory   $steps [expr $dispCount2+5]]
    lappend theAccel1 [lindex $accelHistory $steps [expr $dispCount2+0]]
    lappend theAccel2 [lindex $accelHistory $steps [expr $dispCount2+1]]
    lappend theAccel3 [lindex $accelHistory $steps [expr $dispCount2+2]]
    lappend theAccel4 [lindex $accelHistory $steps [expr $dispCount2+3]]
    lappend theAccel5 [lindex $accelHistory $steps [expr $dispCount2+4]]
    lappend theAccel6 [lindex $accelHistory $steps [expr $dispCount2+5]]
    
    timeSeries Path [expr $dispCount1+0] -time $theTime -values $theDisp1
    timeSeries Path [expr $dispCount1+1] -time $theTime -values $theDisp2
    timeSeries Path [expr $dispCount1+2] -time $theTime -values $theDisp3
    timeSeries Path [expr $dispCount1+3] -time $theTime -values $theDisp4
    timeSeries Path [expr $dispCount1+4] -time $theTime -values $theDisp5
    timeSeries Path [expr $dispCount1+5] -time $theTime -values $theDisp6
    timeSeries Path [expr $dispCount1+6] -time $theTime -values $theVel1
    timeSeries Path [expr $dispCount1+7] -time $theTime -values $theVel2
    timeSeries Path [expr $dispCount1+8] -time $theTime -values $theVel3
    timeSeries Path [expr $dispCount1+9] -time $theTime -values $theVel4
    timeSeries Path [expr $dispCount1+10] -time $theTime -values $theVel5
    timeSeries Path [expr $dispCount1+11] -time $theTime -values $theVel6
    timeSeries Path [expr $dispCount1+12] -time $theTime -values $theAccel1
    timeSeries Path [expr $dispCount1+13] -time $theTime -values $theAccel2
    timeSeries Path [expr $dispCount1+14] -time $theTime -values $theAccel3
    timeSeries Path [expr $dispCount1+15] -time $theTime -values $theAccel4
    timeSeries Path [expr $dispCount1+16] -time $theTime -values $theAccel5
    timeSeries Path [expr $dispCount1+17] -time $theTime -values $theAccel6    
    
    pattern MultipleSupport [expr $dispCount1+0] {
        groundMotion 1 Plain -disp [expr $dispCount1+0] -vel [expr $dispCount1+6] -accel [expr $dispCount1+12]
        imposedMotion $tag  1  1
    }
    
    pattern MultipleSupport [expr $dispCount1+1] {
        groundMotion 2 Plain -disp [expr $dispCount1+1] -vel [expr $dispCount1+7] -accel [expr $dispCount1+13]
        imposedMotion $tag  2  2
    }
    
    pattern MultipleSupport [expr $dispCount1+2] {
        groundMotion 3 Plain -disp [expr $dispCount1+2] -vel [expr $dispCount1+8] -accel [expr $dispCount1+14]
        imposedMotion $tag  3  3
    }

    pattern MultipleSupport [expr $dispCount1+3] {
        groundMotion 4 Plain -disp [expr $dispCount1+3] -vel [expr $dispCount1+9] -accel [expr $dispCount1+15]
        imposedMotion $tag  4  4
    }
    
    pattern MultipleSupport [expr $dispCount1+4] {
        groundMotion 5 Plain -disp [expr $dispCount1+4] -vel [expr $dispCount1+10] -accel [expr $dispCount1+16]
        imposedMotion $tag  5  5
    }
    
    pattern MultipleSupport [expr $dispCount1+5] {
        groundMotion 6 Plain -disp [expr $dispCount1+5] -vel [expr $dispCount1+11] -accel [expr $dispCount1+17]
        imposedMotion $tag  6  6
    }
    
    incr dispCount1 18
    incr dispCount2 6
    
}
