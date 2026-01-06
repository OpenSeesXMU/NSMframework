
set factor 9800
set dt 0.02

timeSeries Path 101 -filePath tabasFN.txt -dt 0.02 -factor [expr 0.4*$factor]
timeSeries Path 102 -filePath tabasFN.txt -dt 0.02 -factor [expr 0.3*$factor]
