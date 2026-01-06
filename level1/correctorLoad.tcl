
set  loadCount 5
set  loadNum  [llength  $mainForce1]
set  tags  {1  5}
set  tagCount  0

for {set i 0} {$i < $loadNum} {incr i} {

    remove timeSeries $loadCount
    remove loadPattern $loadCount

    set tag [lindex $tags $tagCount] 
    set loadCommand {}
    lappend loadCommand  "load"
    lappend loadCommand  "$tag"
    
    set  dofNum  [expr {$i % 6}]
    for {set j 0} {$j < 6} {incr j} {
        
        if {$j == $dofNum} {
            lappend loadCommand 1.0   
        } else {
            lappend loadCommand 0.0
        }
    }
    if {$dofNum == 5} {
        incr tagCount    
    }
    
    set theTime "0. [getTime] [expr  [getTime]+$dt] 1000.";
    set theForce "0.0 0.0 [expr [lindex $mainForce1 $i]-[lindex $subForce1 $i]] [expr [lindex $mainForce1 $i]-[lindex $subForce1 $i]]";
    
    timeSeries Path $loadCount -time $theTime -values $theForce
    pattern Plain $loadCount $loadCount {
        # puts "$loadCommand"
        eval $loadCommand
    }
    
    incr loadCount
    
    # puts $loadCommand        
}

