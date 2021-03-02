//cubeの基本部分
module cube_basic(tx, ty, tz, cx, cy, cz){
	translate([tx, ty, tz]){
		cube(size=[cx, cy, cz], center=true);
	}	
}

//土台部分
difference(){
	cube_basic(0, 0, 0, 3.5, 6.5, 2);
	cube_basic(0, 0, 1, 3, 6, 1.5);
}

//フィン部分
for(y=[-3:1:3]){
	cube_basic(0, y, 0, 3, 0.2, 2);
}