set filename "./output/location.out" 
set file [open $filename w+ ]
set allNodeTags  [getNodeTags]
foreach tag $allNodeTags {
    puts $file   " $tag [nodeCoord $tag 1] [nodeCoord $tag 2] [nodeCoord $tag 3] "
}
close $file
