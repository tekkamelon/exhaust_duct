//cubeの基本部分
module cube_basic(tx, ty, tz, cx, cy, cz){
	translate([tx, ty, tz]){
		cube(size=[cx, cy, cz], center=true);
	}	
}

px=3;
py=5;
difference(){
	//土台部分
	hull(){
		cube_basic(0, 0, 3, 3.5, 10, 0.05);
	    linear_extrude(0.5){
			polygon(points=[[-px, py], [-2, 7], [2, 7], [px, py], [px, -py], [2, -7], [-2, -7], [-px, -py]]); //時計回り
		}
	}
	//空洞部分
	cube_basic(0, 0, 3.5, 3, 9.5, 3.5);
}

//フィン部分
for(y=[-4:1:4]){
	cube_basic(0, y, 1.5, 3, 0.25, 2.5);
}
