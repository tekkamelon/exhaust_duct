//cubeの基本部分
module cube_basic(tx, ty, tz, cx, cy, cz){
	translate([tx, ty, tz]){
		cube(size=[cx, cy, cz], center=true);
	}	
}

difference(){
	//土台部分
	hull(){
		cube_basic(0, 0, 2, 3.5, 10, 0.05);
	    linear_extrude(0.25){
			polygon(points=[[-3, 6], [3, 6], [3, -6], [-3, -6]]); //時計回り
		}
	}
	//空洞部分
	cube_basic(0, 0, 2, 3, 9.5, 1.5);
}

//フィン部分
for(y=[-4:1:4]){
	cube_basic(0, y, 1, 3, 0.25, 2.05);
}
