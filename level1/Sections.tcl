########### for columns ///////////////////////////////////////////////////////////////////////      
#截面编号 长边长度 短边长度 保护层厚度 保护层材料 核心区材料钢筋材料 长向划分数目 短向划分数目 沿z轴顶部钢筋直径 数目 沿z轴底部钢筋直径 数目
foreach {secID   h    b    c    coverMat coreMat rebarMat fineMesh looseMesh sdzT nszT sdzB  nszB  sdyT  nsyT   sdyB  nsyB} {
	       10   600. 600. 30.0     2        1       3        8        1    18.   3  18.   3   18.   1    18.   1
	} {
	RCRectSectionOne $secID $h $b $c $coverMat $coreMat $rebarMat $fineMesh $looseMesh $sdzT $nszT $sdzB $nszB $sdyT $nsyT $sdyB $nsyB
}


#set GJ 10000000000.0
set GJ 721250000000000

# 10^3kg * m/s^2   10^3 Pa  10^3 N*m^2   10^9 N mm^2
# ---------------定义线弹性扭转特性-------------------------------

uniaxialMaterial Elastic  23      $GJ
# ---------------把扭转特性并入混凝土截面---------------------------

#---------定义非弹性柱截面   截面号 扭转特性材料号          钢筋混凝土截面号
section	Aggregator	1	23	T	-section	10     


puts "Sections" 
