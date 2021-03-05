px=3;
cube_basic_y=10;
py=cube_basic_y/2;
px2=2;
py2=py+2;
fy=py-1;

//cubeの基本部分
module cube_basic(tx, ty, tz, cx, cy, cz){
	translate([tx, ty, tz]){
		cube(size=[cx, cy, cz], center=true);
	}	
}

//本体
difference(){
	//土台部分
	hull(){
		cube_basic(0, 0, 3, 3.5, cube_basic_y, 0.05);
	    linear_extrude(0.25){
			polygon(points=[[-px, py], [-px2, py2], [px2, py2], [px, py], [px, -py], [px2, -py2], [-px2, -py2], [-px, -py]]); //時計回り
		}
	}
	//空洞部分
	cube_basic(0, 0, 3, px, cube_basic_y-0.5, 3.5);
}

//フィン部分
for(y=[-fy:1:fy]){
	hull(){
		cube_basic(0, y, 2.5, 3, 0.25, 0.5);
		cube_basic(0, y, 1.0, 3, 0.65, 0.5);
	}
}
