# Define of sections
# RC rectanguler section (y: short; z: long) -Every time to check!!
# secID: section ID
# h, b, c: Long, short lengths, and cover thickness of the sections
# coverMat, coreMat, rebarMat: material types of cover concrete, core concrete, and longitudinal rebars
# fineMesh, looseMesh: Divisions along the long and short branches of a rectangular patch
# sdzT nszT: Diameter of steel rebars, Number of steel rebars along z direction at the top
# sdzB nszB: Diameter of steel rebars, Number of steel rebars along z direction at the bottom
# sdyT nsyT: Diameter of steel rebars, Number of steel rebars along y direction at the top
# sdyB nsyB: Diameter of steel rebars, Number of steel rebars along y direction at the bottom
# bf hf: flange width, height
# fineMeshf, looseMeshf: Divisions along the long and short branches of flange
# 截面编号 长边长度 短边长度 保护层厚度 保护层材料 核心区材料钢筋材料 长向划分数目 短向划分数目 沿z轴顶部钢筋直径 数目 沿z轴底部钢筋直径 数目
########### for columns ///////////////////////////////////////////////////////////////////////   
proc RCRectSectionOne {secID h b c coverMat coreMat rebarMat fineMesh looseMesh sdzT nszT sdzB nszB sdyT nsyT sdyB nsyB} {
	set y1 [expr -$b/2]
	set y2 [expr -$b/2+$c]
	set y3 [expr $b/2-$c]
	set y4 [expr $b/2]
	set z1 [expr -$h/2]
	set z2 [expr -$h/2+$c]
	set z3 [expr $h/2-$c]
	set z4 [expr $h/2]
	set PI 3.1415926
	section Fiber $secID -GJ 0.0 {
            ## Concrete cover
		patch quad $coverMat  $fineMesh  $looseMesh $y1 $z1 $y4 $z1 $y4 $z2 $y1 $z2
		patch quad $coverMat  $fineMesh  $looseMesh $y1 $z3 $y4 $z3 $y4 $z4 $y1 $z4
		patch quad $coverMat  $looseMesh  $fineMesh $y1 $z2 $y2 $z2 $y2 $z3 $y1 $z3
		patch quad $coverMat  $looseMesh  $fineMesh $y3 $z2 $y4 $z2 $y4 $z3 $y3 $z3
		## Concrete core
		patch quad $coreMat $fineMesh $fineMesh $y2 $z2 $y3 $z2 $y3 $z3 $y2 $z3
		## Steel bars
		layer straight $rebarMat $nszT [expr $sdzT*$sdzT*$PI/4] $y3 $z2 $y3 $z3
		layer straight $rebarMat $nszB [expr $sdzB*$sdzB*$PI/4] $y2 $z2 $y2 $z3
		layer straight $rebarMat $nsyT [expr $sdyT*$sdyT*$PI/4] [expr $y2+($y3-$y2)/($nsyT+1)] $z3 [expr $y3-($y3-$y2)/($nsyT+1)] $z3
		layer straight $rebarMat $nsyB [expr $sdyB*$sdyB*$PI/4] [expr $y2+($y3-$y2)/($nsyT+1)] $z2 [expr $y3-($y3-$y2)/($nsyT+1)] $z2
	}
}
########### for beams ///////////////////////////////////////////////////////////////////////
#T型梁
#钢筋为一排分布  
proc RCRectSectionBeamOne {secID h b c coverMat coreMat rebarMat fineMesh looseMesh sdzT nszT sdzB nszB sdyT nsyT sdyB nsyB bf hf fineMeshf looseMeshf} {
	set y1 [expr -$b/2]
	set y2 [expr -$b/2+$c]
	set y3 [expr $b/2-$c]
	set y4 [expr $b/2]
	set z1 [expr -$h/2]
	set z2 [expr -$h/2+$c]
	set z3 [expr $h/2-$c]
	set z4 [expr $h/2]
	set PI 3.1415926
	section Fiber $secID -GJ 0.0 {
            ## Concrete flange
#            patch quad $coverMat  $fineMeshf  $looseMeshf [expr -$bf/2] $z4 [expr $bf/2] $z4 [expr $bf/2] [expr $z4+$hf] [expr -$bf/2] [expr $z4+$hf]
            patch quad $coverMat  $fineMeshf  $looseMeshf [expr -$bf/2] [expr $z4-$hf] [expr $bf/2] [expr $z4-$hf] [expr $bf/2] $z4 [expr -$bf/2] $z4
	 	## Concrete cover
		patch quad $coverMat  $fineMesh  $looseMesh $y1 $z1 $y4 $z1 $y4 $z2 $y1 $z2
		patch quad $coverMat  $fineMesh  $looseMesh $y1 $z3 $y4 $z3 $y4 $z4 $y1 $z4
		patch quad $coverMat  $looseMesh  $fineMesh $y1 $z2 $y2 $z2 $y2 $z3 $y1 $z3
		patch quad $coverMat  $looseMesh  $fineMesh $y3 $z2 $y4 $z2 $y4 $z3 $y3 $z3
		## Concrete core
		patch quad $coreMat $fineMesh $fineMesh $y2 $z2 $y3 $z2 $y3 $z3 $y2 $z3
		## Steel bars
		layer straight $rebarMat $nszT [expr $sdzT*$sdzT*$PI/4] $y3 $z2 $y3 $z3
		layer straight $rebarMat $nszB [expr $sdzB*$sdzB*$PI/4] $y2 $z2 $y2 $z3
		layer straight $rebarMat $nsyT [expr $sdyT*$sdyT*$PI/4] [expr $y2+($y3-$y2)/($nsyT+1)] $z3 [expr $y3-($y3-$y2)/($nsyT+1)] $z3
		layer straight $rebarMat $nsyB [expr $sdyB*$sdyB*$PI/4] [expr $y2+($y3-$y2)/($nsyT+1)] $z2 [expr $y3-($y3-$y2)/($nsyT+1)] $z2
	}
}


#钢筋为两排分布
proc RCRectSectionBeamTwo {secID h b c coverMat coreMat rebarMat fineMesh looseMesh sdzT nszT sdzB nszB sdyT nsyT1 nsyT2 sdyB nsyB bf hf fineMeshf looseMeshf} {
    set y1 [expr -$b/2]
	set y2 [expr -$b/2+$c]
	set y3 [expr $b/2-$c]
	set y4 [expr $b/2]
	set z1 [expr -$h/2]
	set z2 [expr -$h/2+$c]
	set z3 [expr $h/2-$c]
	set z4 [expr $h/2]
	set PI 3.1415926
	section Fiber $secID -GJ 0.0 {
            ## Concrete flange
#            patch quad $coverMat  $fineMeshf  $looseMeshf [expr -$bf/2] $z4 [expr $bf/2] $z4 [expr $bf/2] [expr $z4+$hf] [expr -$bf/2] [expr $z4+$hf]
            patch quad $coverMat  $fineMeshf  $looseMeshf [expr -$bf/2] [expr $z4-$hf] [expr $bf/2] [expr $z4-$hf] [expr $bf/2] $z4 [expr -$bf/2] $z4
	 	## Concrete cover
		patch quad $coverMat  $fineMesh  $looseMesh $y1 $z1 $y4 $z1 $y4 $z2 $y1 $z2
		patch quad $coverMat  $fineMesh  $looseMesh $y1 $z3 $y4 $z3 $y4 $z4 $y1 $z4
		patch quad $coverMat  $looseMesh  $fineMesh $y1 $z2 $y2 $z2 $y2 $z3 $y1 $z3
		patch quad $coverMat  $looseMesh  $fineMesh $y3 $z2 $y4 $z2 $y4 $z3 $y3 $z3
		## Concrete core
		patch quad $coreMat $fineMesh $fineMesh $y2 $z2 $y3 $z2 $y3 $z3 $y2 $z3
		## Steel bars
		layer straight $rebarMat $nszT [expr $sdzT*$sdzT*$PI/4] $y3 [expr $z2+($z3-$c-$z2)/($nszT+1)] $y3 [expr $z3-$c-($z3-$c-$z2)/($nszT+1)]
		layer straight $rebarMat $nszB [expr $sdzB*$sdzB*$PI/4] $y2 [expr $z2+($z3-$c-$z2)/($nszT+1)] $y2 [expr $z3-$c-($z3-$c-$z2)/($nszT+1)]
            layer straight $rebarMat $nsyT1 [expr $sdyT*$sdyT*$PI/4] $y2 $z3 $y3 $z3
		layer straight $rebarMat $nsyT2 [expr $sdyT*$sdyT*$PI/4] $y2 [expr $z3-$c] $y3 [expr $z3-$c]
		layer straight $rebarMat $nsyB [expr $sdyB*$sdyB*$PI/4] $y2 $z2 $y3 $z2
	}
}
#倒L型梁
#钢筋为一排分布  
proc RCRectSectionBeamThree {secID h b c coverMat coreMat rebarMat fineMesh looseMesh sdzT nszT sdzB nszB sdyT nsyT sdyB nsyB bf hf fineMeshf looseMeshf} {
	set y1 [expr -$b/2]
	set y2 [expr -$b/2+$c]
	set y3 [expr $b/2-$c]
	set y4 [expr $b/2]
	set z1 [expr -$h/2]
	set z2 [expr -$h/2+$c]
	set z3 [expr $h/2-$c]
	set z4 [expr $h/2]
	set PI 3.1415926
	section Fiber $secID -GJ 0.0 {
            ## Concrete flange
            patch quad $coverMat  $fineMeshf  $looseMeshf $y1 $z4 [expr $bf-$y4] $z4 [expr $bf-$y4] [expr $z4+$hf] $y1 [expr $z4+$hf]
#            patch quad $coverMat  $fineMeshf  $looseMeshf $y1 [expr $z4-$hf] [expr $bf-$y4] [expr $z4-$hf] [expr $bf-$y4] $z4 $y1 $z4
	 	## Concrete cover
		patch quad $coverMat  $fineMesh  $looseMesh $y1 $z1 $y4 $z1 $y4 $z2 $y1 $z2
		patch quad $coverMat  $fineMesh  $looseMesh $y1 $z3 $y4 $z3 $y4 $z4 $y1 $z4
		patch quad $coverMat  $looseMesh  $fineMesh $y1 $z2 $y2 $z2 $y2 $z3 $y1 $z3
		patch quad $coverMat  $looseMesh  $fineMesh $y3 $z2 $y4 $z2 $y4 $z3 $y3 $z3
		## Concrete core
		patch quad $coreMat $fineMesh $fineMesh $y2 $z2 $y3 $z2 $y3 $z3 $y2 $z3
		## Steel bars
		layer straight $rebarMat $nszT [expr $sdzT*$sdzT*$PI/4] $y3 $z2 $y3 $z3
		layer straight $rebarMat $nszB [expr $sdzB*$sdzB*$PI/4] $y2 $z2 $y2 $z3
		layer straight $rebarMat $nsyT [expr $sdyT*$sdyT*$PI/4] [expr $y2+($y3-$y2)/($nsyT+1)] $z3 [expr $y3-($y3-$y2)/($nsyT+1)] $z3
		layer straight $rebarMat $nsyB [expr $sdyB*$sdyB*$PI/4] [expr $y2+($y3-$y2)/($nsyT+1)] $z2 [expr $y3-($y3-$y2)/($nsyT+1)] $z2
	}
}


#钢筋为两排分布
proc RCRectSectionBeamFour {secID h b c coverMat coreMat rebarMat fineMesh looseMesh sdzT nszT sdzB nszB sdyT nsyT1 nsyT2 sdyB nsyB bf hf fineMeshf looseMeshf} {
    set y1 [expr -$b/2]
	set y2 [expr -$b/2+$c]
	set y3 [expr $b/2-$c]
	set y4 [expr $b/2]
	set z1 [expr -$h/2]
	set z2 [expr -$h/2+$c]
	set z3 [expr $h/2-$c]
	set z4 [expr $h/2]
	set PI 3.1415926
	section Fiber $secID -GJ 0.0 {
            ## Concrete flange
            patch quad $coverMat  $fineMeshf  $looseMeshf $y1 $z4 [expr $bf-$y4] $z4 [expr $bf-$y4] [expr $z4+$hf] $y1 [expr $z4+$hf]
#            patch quad $coverMat  $fineMeshf  $looseMeshf $y1 [expr $z4-$hf] [expr $bf-$y4] [expr $z4-$hf] [expr $bf-$y4] $z4 $y1 $z4
	 	## Concrete cover
		patch quad $coverMat  $fineMesh  $looseMesh $y1 $z1 $y4 $z1 $y4 $z2 $y1 $z2
		patch quad $coverMat  $fineMesh  $looseMesh $y1 $z3 $y4 $z3 $y4 $z4 $y1 $z4
		patch quad $coverMat  $looseMesh  $fineMesh $y1 $z2 $y2 $z2 $y2 $z3 $y1 $z3
		patch quad $coverMat  $looseMesh  $fineMesh $y3 $z2 $y4 $z2 $y4 $z3 $y3 $z3
		## Concrete core
		patch quad $coreMat $fineMesh $fineMesh $y2 $z2 $y3 $z2 $y3 $z3 $y2 $z3
		## Steel bars
		layer straight $rebarMat $nszT [expr $sdzT*$sdzT*$PI/4] $y3 [expr $z2+($z3-$c-$z2)/($nszT+1)] $y3 [expr $z3-$c-($z3-$c-$z2)/($nszT+1)]
		layer straight $rebarMat $nszB [expr $sdzB*$sdzB*$PI/4] $y2 [expr $z2+($z3-$c-$z2)/($nszT+1)] $y2 [expr $z3-$c-($z3-$c-$z2)/($nszT+1)]
            layer straight $rebarMat $nsyT1 [expr $sdyT*$sdyT*$PI/4] $y2 $z3 $y3 $z3
		layer straight $rebarMat $nsyT2 [expr $sdyT*$sdyT*$PI/4] $y2 [expr $z3-$c] $y3 [expr $z3-$c]
		layer straight $rebarMat $nsyB [expr $sdyB*$sdyB*$PI/4] $y2 $z2 $y3 $z2
	}
}