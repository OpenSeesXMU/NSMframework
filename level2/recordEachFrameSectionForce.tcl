set filename "./output/recordEachFrameSectionForce/frame_$cframe.out" 
set file [open $filename w+ ]
set allEleTags  [getEleTags]
foreach tag $allEleTags {
    puts $file   " $tag [eleNodes $tag] [eleResponse $tag section forces] "
}
close $file