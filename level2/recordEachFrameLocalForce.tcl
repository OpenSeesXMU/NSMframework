set filename "./output/recordEachFrameLocalForce/frame_$cframe.out" 
set file [open $filename w+ ]
set allEleTags  [getEleTags]
foreach tag $allEleTags {
    puts $file   " $tag [eleNodes $tag] [eleResponse $tag localForce] "
}
close $file