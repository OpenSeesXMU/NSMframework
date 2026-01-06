
set dispToCore0 " [getTime] [nodeDisp 65 1] [nodeDisp 65 2] [nodeDisp 65 3] [nodeDisp 65 4] [nodeDisp 65 5] [nodeDisp 65 6] "
set dispToCore2 " [getTime] [nodeDisp 2 1] [nodeDisp 2 2] [nodeDisp 2 3] [nodeDisp 2 4] [nodeDisp 2 5] [nodeDisp 2 6] "

puts $sock0 "addDisp {$dispToCore0}"
puts $sock2 "addDisp {$dispToCore2}"
gets $sock0 
gets $sock2 

set velToCore0 " [getTime] [nodeVel 65 1] [nodeVel 65 2] [nodeVel 65 3] [nodeVel 65 4] [nodeVel 65 5] [nodeVel 65 6] "
set velToCore2 " [getTime] [nodeVel 2 1] [nodeVel 2 2] [nodeVel 2 3] [nodeVel 2 4] [nodeVel 2 5] [nodeVel 2 6] "

puts $sock0 "addVel {$velToCore0}"
puts $sock2 "addVel {$velToCore2}"
gets $sock0
gets $sock2 

set  accelToCore0 " [getTime] [nodeAccel 65 1] [nodeAccel 65 2] [nodeAccel 65 3] [nodeAccel 65 4] [nodeAccel 65 5] [nodeAccel 65 6] "
set  accelToCore2 " [getTime] [nodeAccel 2 1] [nodeAccel 2 2] [nodeAccel 2 3] [nodeAccel 2 4] [nodeAccel 2 5] [nodeAccel 2 6] "

puts $sock0 "addAccel {$accelToCore0}"
puts $sock2 "addAccel {$accelToCore2}"
gets $sock0
gets $sock2 

