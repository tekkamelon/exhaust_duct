px=3; //横幅のx軸の座標
cube_basic_x=px+0.5; //ダクト内部の厚み
cube_basic_y=10; //全長
py=cube_basic_y/2; //横幅のy軸の頂点
px2=2; //縦幅のx軸の頂点
py2=py+2; //縦幅のy軸の頂点
fy=py-1; //フィン部分のy軸座標

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
		cube_basic(0, 0, 3, cube_basic_x, cube_basic_y, 0.05);
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
		cube_basic(0, y, 2.5, px, 0.25, 0.5);
		cube_basic(0, y, 1.0, px, 0.65, 0.5);
	}
}