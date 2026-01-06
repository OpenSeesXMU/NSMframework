set filename "./output/mainForce.out" 
set file [open $filename a+ ]
puts $file   " $mainForce0 $mainForce2 "
close $file
