set a       [eigen 10]
set OM1     [lindex $a 0]
set OM2     [lindex $a 1]
set OM3     [lindex $a 2]
set OM4     [lindex $a 3]
set OM5     [lindex $a 4]
set OM6     [lindex $a 5]
set OM7     [lindex $a 6]
set OM8     [lindex $a 7]
set OM9     [lindex $a 8]
set OM10     [lindex $a 9]

set Period1 [expr 2*3.1415926/sqrt($OM1)]
set Period2 [expr 2*3.1415926/sqrt($OM2)]
set Period3 [expr 2*3.1415926/sqrt($OM3)]
set Period4 [expr 2*3.1415926/sqrt($OM4)]
set Period5 [expr 2*3.1415926/sqrt($OM5)]
set Period6 [expr 2*3.1415926/sqrt($OM6)]
set Period7 [expr 2*3.1415926/sqrt($OM7)]
set Period8 [expr 2*3.1415926/sqrt($OM8)]
set Period9 [expr 2*3.1415926/sqrt($OM9)]
set Period10 [expr 2*3.1415926/sqrt($OM10)]

puts "Periods are: "
puts "$Period1"
puts "$Period2"
puts "$Period3"
puts "$Period4"
puts "$Period5"
puts "$Period6"
puts "$Period7"
puts "$Period8"
puts "$Period9"
puts "$Period10"


#puts "Periods are: "
#set numModes 10
#set lambda [eigen  $numModes];
#set j $numModes
#set i 1
#while { $i <= $j } {
#     set Period [expr 2*3.1415926/sqrt([lindex $lambda [expr $i-1]])]
#     puts "$Period"
#     wipe
#     incr i 1
#}
#


##------------------------------------------------------------------------------------------------------------------
##Eigenvalue analysis
#
#set numModes 10
#set lambda [eigen  $numModes];
#
## calculate frequencies and periods of the structure ---------------------------------------------------
#set omega {}
#set f {}
#set T {}
#set pi 3.141593
#
#foreach lam $lambda {
#	lappend omega [expr sqrt($lam)]
#	lappend f [expr sqrt($lam)/(2*$pi)]
#	lappend T [expr (2*$pi)/sqrt($lam)]
#}
#
#puts "periods are $T"