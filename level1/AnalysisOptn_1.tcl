# AnalysisOptn_1.tcl 

constraints Transformation
integrator LoadControl 0.1
test NormDispIncr 1.0e-6  6  0
algorithm  Newton 
numberer RCM
system BandGeneral
analysis  Static 
analyze 10
