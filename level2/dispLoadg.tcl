
set  nodeTagForReplacingLastLevel  {65 165}

set  dispCount1  1
set  dispCount2  1 
foreach tag $nodeTagForReplacingLastLevel {

    timeSeries Linear [expr $dispCount1+0] -factor [lindex $dispHistory 0 [expr $dispCount2+0]]
    timeSeries Linear [expr $dispCount1+1] -factor [lindex $dispHistory 0 [expr $dispCount2+1]]
    timeSeries Linear [expr $dispCount1+2] -factor [lindex $dispHistory 0 [expr $dispCount2+2]]
    timeSeries Linear [expr $dispCount1+3] -factor [lindex $dispHistory 0 [expr $dispCount2+3]]
    timeSeries Linear [expr $dispCount1+4] -factor [lindex $dispHistory 0 [expr $dispCount2+4]]
    timeSeries Linear [expr $dispCount1+5] -factor [lindex $dispHistory 0 [expr $dispCount2+5]]
    timeSeries Linear [expr $dispCount1+6]
    timeSeries Linear [expr $dispCount1+7] 
    timeSeries Linear [expr $dispCount1+8] 
    timeSeries Linear [expr $dispCount1+9] 
    timeSeries Linear [expr $dispCount1+10]
    timeSeries Linear [expr $dispCount1+11]
    timeSeries Linear [expr $dispCount1+12]
    timeSeries Linear [expr $dispCount1+13]
    timeSeries Linear [expr $dispCount1+14]
    timeSeries Linear [expr $dispCount1+15]
    timeSeries Linear [expr $dispCount1+16]
    timeSeries Linear [expr $dispCount1+17]
    
    pattern MultipleSupport [expr $dispCount1+0] {
        groundMotion 1 Plain -disp [expr $dispCount1+0]
        imposedMotion $tag  1  1 
    }

    pattern MultipleSupport [expr $dispCount1+1] {
        groundMotion 2 Plain -disp [expr $dispCount1+1]
        imposedMotion $tag  2  2
    }

    pattern MultipleSupport [expr $dispCount1+2] {
        groundMotion 3 Plain -disp [expr $dispCount1+2]
        imposedMotion $tag  3  3
    }

    pattern MultipleSupport [expr $dispCount1+3] {
        groundMotion 4 Plain -disp [expr $dispCount1+3]
        imposedMotion $tag  4  4
    }

    pattern MultipleSupport [expr $dispCount1+4] {
        groundMotion 5 Plain -disp [expr $dispCount1+4]
        imposedMotion $tag  5  5
    }

    pattern MultipleSupport [expr $dispCount1+5] {
        groundMotion 6 Plain -disp [expr $dispCount1+5]
        imposedMotion $tag  6  6
    }

    incr dispCount1 18
    incr dispCount2 6
}
