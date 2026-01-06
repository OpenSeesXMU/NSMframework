
set filename "mainDeform.out" 
set file [open $filename a+ ]
# set result "[getTime] [eleResponse 1 forces]"

# set tags [eleNodes 710] 
# set tag1 [lindex $tags 0]
# set tag2 [lindex $tags 1]

# set result "[getTime] $tag1 $tag2 [nodeCoord $tag1 1] [nodeCoord $tag1 2] [nodeCoord $tag1 3] [nodeCoord $tag2 1] [nodeCoord $tag2 2] [nodeCoord $tag2 3] [nodeDisp $tag1 1] [nodeDisp $tag1 2] [nodeDisp $tag1 3] [nodeDisp $tag2 1] [nodeDisp $tag2 2] [nodeDisp $tag2 3] [nodeVel $tag1 1] [nodeVel $tag1 2] [nodeVel $tag1 3] [nodeVel $tag2 1] [nodeVel $tag2 2] [nodeVel $tag2 3] [nodeAccel $tag1 1] [nodeAccel $tag1 2] [nodeAccel $tag1 3] [nodeAccel $tag2 1] [nodeAccel $tag2 2] [nodeAccel $tag2 3]"


set  result  "[eleResponse 100001  section deformation]"



puts $file $result
close $file


set filename "mainForce.out" 
set file [open $filename a+ ]
# set result "[getTime] [eleResponse 1 forces]"

# set tags [eleNodes 710] 
# set tag1 [lindex $tags 0]
# set tag2 [lindex $tags 1]

# set result "[getTime] $tag1 $tag2 [nodeCoord $tag1 1] [nodeCoord $tag1 2] [nodeCoord $tag1 3] [nodeCoord $tag2 1] [nodeCoord $tag2 2] [nodeCoord $tag2 3] [nodeDisp $tag1 1] [nodeDisp $tag1 2] [nodeDisp $tag1 3] [nodeDisp $tag2 1] [nodeDisp $tag2 2] [nodeDisp $tag2 3] [nodeVel $tag1 1] [nodeVel $tag1 2] [nodeVel $tag1 3] [nodeVel $tag2 1] [nodeVel $tag2 2] [nodeVel $tag2 3] [nodeAccel $tag1 1] [nodeAccel $tag1 2] [nodeAccel $tag1 3] [nodeAccel $tag2 1] [nodeAccel $tag2 2] [nodeAccel $tag2 3]"


set  result  "[eleResponse 100001  section force]"



puts $file $result
close $file
