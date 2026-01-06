#######DampingRatio
puts "DampingRatio"
set j $numModes
set i 1
while { $i <= $j } {
    set CircularFrequency [expr sqrt([lindex $lambda [expr $i-1]])]
    #写入输出文件
    set outfile [open "CircularFrequency.out" a]				;#得到文件标识符
    seek $outfile 0 start                    ;#定位到文件头
    puts $outfile "$CircularFrequency" 
    close $outfile
    set DampingRatio [expr $alphaM/(2*$CircularFrequency)+$betaKcurr*$CircularFrequency/2]
    set outfile [open "DampingRatio.out" a]				;#得到文件标识符
    seek $outfile 0 start                    ;#定位到文件头
    puts $outfile "$DampingRatio" 
    close $outfile
    wipe
    incr i 1
}


#set j 10
#set i 1
#while { $i <= $j } {
#    set CircularFrequency [expr sqrt($OM$m)]
#    set DampingRatio$i [expr $alphaM/(2*$CircularFrequency$m)+$betaKcurr*$CircularFrequency$m/2]
#    #写入输出文件
#    set outfile [open "DampingRatio.out" a]				;#得到文件标识符
#    seek $outfile 0 start                    ;#定位到文件头
#    puts $outfile "$DampingRatio$m" 
#    close $outfile
#    wipe
#    incr i 1
#}