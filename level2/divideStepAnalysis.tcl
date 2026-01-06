set  minDt  1.0

proc divideStepAnalysis {DT  divideNum  tol} {
	puts "function is called..."

	global minDt pid
    set  dt  [ expr   $DT/$divideNum ]
	if {abs($dt) > abs($minDt)} {
		for {set i 0} {$i < $divideNum} {incr i} {
            print integrator
            print algorithm
			analysis Transient	
			set ok [analyze 1 $dt]
			if {$ok != 0} {
				set ok [divideStepAnalysis $dt $divideNum $tol]
			}
		}
	} else {
        #---------------------------------------------#
		test NormDispIncr $tol  50  2
		algorithm ModifiedNewton -initial
        #---------------------------------------------#
		for {set i 0} {$i < $divideNum} {incr i} {
            print integrator
            print algorithm
			analysis Transient	
			set ok [analyze 1 $dt]
			if {$ok != 0} {
				puts "Analyze Failed !!!!!!!!!!!!!!!!!!!!!!!"
                exit
			}
		}
        #---------------------------------------------#
		test NormDispIncr $tol  20  2
		algorithm Newton
        #---------------------------------------------#
	}
	return $ok
}