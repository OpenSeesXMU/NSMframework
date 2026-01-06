
puts $lambda

set  loadCount 50
set  loadNum  [llength  $mainForce0]
set  tags  {65}
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
    set theForce "0.0 0.0 [expr [lindex $mainForce0 $i]-[lindex $subForce0 $i]] [expr [lindex $mainForce0 $i]-[lindex $subForce0 $i]]";
    
    timeSeries Path $loadCount -time $theTime -values $theForce
    pattern Plain $loadCount $loadCount {
        if {$tagCount == 4 || $tagCount == 5 || $tagCount == 6} {
        eval $loadCommand
        }
    }
    
    incr loadCount
    
    # puts $loadCommand        
}


set  loadNum  [llength  $mainForce2]
set  tags  {2}
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
    set theForce "0.0 0.0 [expr [lindex $mainForce2 $i]-[lindex $subForce2 $i]] [expr [lindex $mainForce2 $i]-[lindex $subForce2 $i]]";
    
    timeSeries Path $loadCount -time $theTime -values $theForce
    pattern Plain $loadCount $loadCount {
        if {$tagCount == 4 || $tagCount == 5 || $tagCount == 6} {
        eval $loadCommand
        }
    }
    
    incr loadCount
    
    # puts $loadCommand        
}

