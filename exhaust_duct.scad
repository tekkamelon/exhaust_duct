//土台部分
module cube_basic(tx, ty, tz, cx, cy, cz){
	translate([tx, ty, tz]){
		cube(size=[cx, cy, cz], center=true);
	}	
}

difference(){
	cube_basic(0, 0, 0, 3.5, 6, 2);
	cube_basic(0, 0, 1, 3, 5.5, 1.5);
}
