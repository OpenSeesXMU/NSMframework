
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

    set theTime "0. [lindex $dispHistory 0 0] [lindex $dispHistory 1 0] 1000.";
    
    set theDisp1 "[lindex $dispHistory 0 [expr $dispCount2+0]] [lindex $dispHistory 0 [expr $dispCount2+0]] [lindex $dispHistory 1 [expr $dispCount2+0]] [lindex $dispHistory 1 [expr $dispCount2+0]]";
    set theDisp2 "[lindex $dispHistory 0 [expr $dispCount2+1]] [lindex $dispHistory 0 [expr $dispCount2+1]] [lindex $dispHistory 1 [expr $dispCount2+1]] [lindex $dispHistory 1 [expr $dispCount2+1]]";
    set theDisp3 "[lindex $dispHistory 0 [expr $dispCount2+2]] [lindex $dispHistory 0 [expr $dispCount2+2]] [lindex $dispHistory 1 [expr $dispCount2+2]] [lindex $dispHistory 1 [expr $dispCount2+2]]";
    set theDisp4 "[lindex $dispHistory 0 [expr $dispCount2+3]] [lindex $dispHistory 0 [expr $dispCount2+3]] [lindex $dispHistory 1 [expr $dispCount2+3]] [lindex $dispHistory 1 [expr $dispCount2+3]]";
    set theDisp5 "[lindex $dispHistory 0 [expr $dispCount2+4]] [lindex $dispHistory 0 [expr $dispCount2+4]] [lindex $dispHistory 1 [expr $dispCount2+4]] [lindex $dispHistory 1 [expr $dispCount2+4]]";
    set theDisp6 "[lindex $dispHistory 0 [expr $dispCount2+5]] [lindex $dispHistory 0 [expr $dispCount2+5]] [lindex $dispHistory 1 [expr $dispCount2+5]] [lindex $dispHistory 1 [expr $dispCount2+5]]";
    
    set theVel1 "[lindex $velHistory 0 [expr $dispCount2+0]] [lindex $velHistory 0 [expr $dispCount2+0]] [lindex $velHistory 1 [expr $dispCount2+0]] [lindex $velHistory 1 [expr $dispCount2+0]]";
    set theVel2 "[lindex $velHistory 0 [expr $dispCount2+1]] [lindex $velHistory 0 [expr $dispCount2+1]] [lindex $velHistory 1 [expr $dispCount2+1]] [lindex $velHistory 1 [expr $dispCount2+1]]";
    set theVel3 "[lindex $velHistory 0 [expr $dispCount2+2]] [lindex $velHistory 0 [expr $dispCount2+2]] [lindex $velHistory 1 [expr $dispCount2+2]] [lindex $velHistory 1 [expr $dispCount2+2]]";
    set theVel4 "[lindex $velHistory 0 [expr $dispCount2+3]] [lindex $velHistory 0 [expr $dispCount2+3]] [lindex $velHistory 1 [expr $dispCount2+3]] [lindex $velHistory 1 [expr $dispCount2+3]]";
    set theVel5 "[lindex $velHistory 0 [expr $dispCount2+4]] [lindex $velHistory 0 [expr $dispCount2+4]] [lindex $velHistory 1 [expr $dispCount2+4]] [lindex $velHistory 1 [expr $dispCount2+4]]";
    set theVel6 "[lindex $velHistory 0 [expr $dispCount2+5]] [lindex $velHistory 0 [expr $dispCount2+5]] [lindex $velHistory 1 [expr $dispCount2+5]] [lindex $velHistory 1 [expr $dispCount2+5]]";
    
    set theAccel1 "[lindex $accelHistory 0 [expr $dispCount2+0]] [lindex $accelHistory 0 [expr $dispCount2+0]] [lindex $accelHistory 1 [expr $dispCount2+0]] [lindex $accelHistory 1 [expr $dispCount2+0]]";
    set theAccel2 "[lindex $accelHistory 0 [expr $dispCount2+1]] [lindex $accelHistory 0 [expr $dispCount2+1]] [lindex $accelHistory 1 [expr $dispCount2+1]] [lindex $accelHistory 1 [expr $dispCount2+1]]";
    set theAccel3 "[lindex $accelHistory 0 [expr $dispCount2+2]] [lindex $accelHistory 0 [expr $dispCount2+2]] [lindex $accelHistory 1 [expr $dispCount2+2]] [lindex $accelHistory 1 [expr $dispCount2+2]]";
    set theAccel4 "[lindex $accelHistory 0 [expr $dispCount2+3]] [lindex $accelHistory 0 [expr $dispCount2+3]] [lindex $accelHistory 1 [expr $dispCount2+3]] [lindex $accelHistory 1 [expr $dispCount2+3]]";
    set theAccel5 "[lindex $accelHistory 0 [expr $dispCount2+4]] [lindex $accelHistory 0 [expr $dispCount2+4]] [lindex $accelHistory 1 [expr $dispCount2+4]] [lindex $accelHistory 1 [expr $dispCount2+4]]";
    set theAccel6 "[lindex $accelHistory 0 [expr $dispCount2+5]] [lindex $accelHistory 0 [expr $dispCount2+5]] [lindex $accelHistory 1 [expr $dispCount2+5]] [lindex $accelHistory 1 [expr $dispCount2+5]]";
    
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
