set  minDt  5.e-2

proc divideStepAnalysis {DT  divideNum} {
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
				set ok [divideStepAnalysis $dt $divideNum]
			}
		}
	} else {
        puts "Failed !!!"
        exit
        #---------------------------------------------#
		# test NormDispIncr $tol  4  5
		# algorithm ModifiedNewton -initial
		# integrator LoadControl $dt
        #---------------------------------------------#
		for {set i 0} {$i < $divideNum} {incr i} {
            print integrator
            print algorithm
			analysis Transient	
			set ok [analyze 1 $dt]
			if {$ok != 0} {
				set ok [divideStepAnalysis $dt $divideNum]
			}
		}
        #---------------------------------------------#
		# test NormDispIncr $tol  4  5
		# algorithm ModifiedNewton -initial
		# integrator LoadControl $dt
        #---------------------------------------------#
	}
	return $ok
}