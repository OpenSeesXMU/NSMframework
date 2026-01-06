
set dispToCore1 " [getTime] [nodeDisp 1 1] [nodeDisp 1 2] [nodeDisp 1 3] [nodeDisp 1 4] [nodeDisp 1 5] [nodeDisp 1 6] [nodeDisp 5 1] [nodeDisp 5 2] [nodeDisp 5 3] [nodeDisp 5 4] [nodeDisp 5 5] [nodeDisp 5 6] "; 
puts $sock1 "addDisp {$dispToCore1}"
gets $sock1


set velToCore1 " [getTime] [nodeVel 1 1] [nodeVel 1 2] [nodeVel 1 3] [nodeVel 1 4] [nodeVel 1 5] [nodeVel 1 6] [nodeVel 5 1] [nodeVel 5 2] [nodeVel 5 3] [nodeVel 5 4] [nodeVel 5 5] [nodeVel 5 6] "
puts $sock1 "addVel {$velToCore1}"
gets $sock1



set accelToCore1 " [getTime] [nodeAccel 1 1] [nodeAccel 1 2] [nodeAccel 1 3] [nodeAccel 1 4] [nodeAccel 1 5] [nodeAccel 1 6] [nodeAccel 5 1] [nodeAccel 5 2] [nodeAccel 5 3] [nodeAccel 5 4] [nodeAccel 5 5] [nodeAccel 5 6] "
puts $sock1 "addAccel {$accelToCore1}"
gets $sock1
