# ---------定义截面材料----------------------------------------------------------------------------

#kent-park混凝土模型

uniaxialMaterial Concrete02 1 -34.47e3 -0.005 -24.13e3 -0.02  0.3 3.13e3 783.5e3
uniaxialMaterial Concrete02 2 -27.58e3 -0.002   0.0    -0.006 0.3 3.13e3 783.5e3

uniaxialMaterial Steel02 3 248.2e3 2.1e8 0.02 15 0.925 0.15

puts "Materials"
