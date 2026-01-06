# 3Dframe.tcl 
# Units: mm, sec, N, kg
# ######################## 
# # Analysis-Sequence  1 #
# ######################## 
# Rayleigh Damping is accepted

logFile screen.out

# Define of sections
source  RCRectSection.tcl

# Start of model generation 
# ========================= 

# Create ModelBuilder 
# ------------------- 
wipe
model  BasicBuilder  -ndm  3  -ndf  6 

# Define geometry 
# --------------- 
source  NodeCoord.tcl 

# --------------- 
source  NodeMass.tcl 

# Define Single Point Constraints 
# ------------------------------- 
source  SPConstraint.tcl 

# Define material(s) 
# ------------------ 
source  Materials.tcl 

# Define section(s) 
# ----------------- 
source  Sections.tcl 

# Define geometric transformation(s) 
# ---------------------------------- 
source  GeoTran.tcl 

# Define element(s) 
# ----------------- 
source  Elements.tcl 

# Define dampint(s) 
# ----------------- 
source  RayleighDamping.tcl


set mainForce0 "[lrange [eleResponse 1 force] 0 5]"
set mainForce6 "[lrange [eleResponse 10 force] 6 11]"

set  loadCount 50
set  loadNum  [llength  $mainForce0]
for {set i 0} {$i < $loadNum} {incr i} { 
    timeSeries Linear $loadCount
    pattern Plain $loadCount $loadCount {
    }
    incr loadCount
}

set  loadNum  [llength  $mainForce6]
for {set i 0} {$i < $loadNum} {incr i} { 
    timeSeries Linear $loadCount
    pattern Plain $loadCount $loadCount {
    }
    incr loadCount
}

source  recordInitNodeCoord.tcl
file mkdir "./output/recordEachFrameLocalForce/"
file mkdir "./output/recordEachFrameNodeDispl/"
file mkdir "./output/recordEachFrameSectionForce/"