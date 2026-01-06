set filename "./output/recordEachFrameCorrector/frame_$cframe.out" 
set file [open $filename w+ ]
puts $file " [getTime] $theForce "
close $file