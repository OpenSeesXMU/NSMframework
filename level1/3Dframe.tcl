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
# source  NodeMass.tcl 

# Define Single Point Constraints 
# ------------------------------- 
source  SPConstraint.tcl 

# Define Multi Point Constraints 
# ------------------------------ 
# source  MPConstraint.tcl 

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

# ### Analysis: Gravity 
# ## +++++++++++++++++ 
# #
source  recordInitNodeCoord.tcl
file mkdir "./output/recordEachFrameLocalForce/"
file mkdir "./output/recordEachFrameNodeDispl/"
file mkdir "./output/recordEachFrameSectionForce/"
file mkdir "./output/recordEachFrameCorrector/"

# Define load pattern 
# ------------------- 
source  LoadPattern_2.tcl 

puts "Gravity analysis"
# Define analysis options 
# ----------------------- 
source  AnalysisOptn_1.tcl 

puts "Gravity analysis Completed"

# ## Analysis: Dynamic 
# ## +++++++++++++++++ 
# #

set startT [clock seconds]

wipeAnalysis
loadConst -time 0.0 

# # RayleighDamping
source  RayleighDamping.tcl

# Define load pattern 
# ------------------- 
source  TimeSeries.tcl 

# Define load pattern 
# ------------------ 
source  LoadPattern_3.tcl 

# Define recorder(s) 
# -------------------- 
# source  AnalysisOptn_2_Recorder.tcl

puts "Earthquake analysis"

# Define analysis options 
# ----------------------- 

source  AnalysisOptn_2.tcl 

puts "Earthquake analysis Completed"

set endT [clock seconds]
puts "Time: [expr $endT-$startT] seconds."

# wipe