set filename "./output/recordEachFrameNodeDispl/frame_$cframe.out" 
set file [open $filename w+ ]
set allNodeTags  [getNodeTags]
foreach tag $allNodeTags {
    puts $file   " $tag [nodeDisp $tag 1] [nodeDisp $tag 2] [nodeDisp $tag 3] [nodeDisp $tag 4] [nodeDisp $tag 5] [nodeDisp $tag 6] "
}
close  $file