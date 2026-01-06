#Define Rayleigh Damping

# set eigenValues [eigen -fullGenLapack 10];

# set freq {};
# for {set i 0} {$i < 10} {incr i} {
    # set tmp [lindex $eigenValues $i]
    # lappend freq [expr sqrt($tmp)/2/3.1415926]
# }

# puts "first 10th frequencies are : $freq"

# set ksi 0.05;
# set omegaI [expr sqrt([lindex $eigenValues 0])]; 
# set omegaJ [expr sqrt([lindex $eigenValues 9])];
# set alphaM [expr $ksi*(2*$omegaI*$omegaJ)/($omegaI+$omegaJ)]; 
# set betaKInit [expr 2.*$ksi/($omegaI+$omegaJ)];   

# puts "alphaM = $alphaM"
# puts "betaKInit  = $betaKInit"

# exit

# alphaM = 0.39057711402619816
# betaKInit  = 0.0028706854907928248
set   alphaM      0.39057711402619816
set   betaKInit   0.0028706854907928248

rayleigh $alphaM 0. $betaKInit 0.


puts "Rayleigh Damping"