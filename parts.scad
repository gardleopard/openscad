module rpi() {
    pi_width=58.5;
    pi_height=14.8;
    pi_length=87.1;
    hole_height=15;
    hole_radius=1.3;
    pi_hole_edge_distance=3.5;
    pi_hole_length_distance=58;
    pi_hole_width_distance=49;
    difference() {
        cube([pi_length,pi_width,pi_height]);
        union() {
            translate([pi_hole_edge_distance,pi_width-pi_hole_edge_distance,-0.1]) 
                cylinder(h=hole_height, r=hole_radius);
            translate([pi_hole_edge_distance+pi_hole_length_distance,pi_width-pi_hole_edge_distance,-0.1]) 
                cylinder(h=hole_height, r=hole_radius);
            
            translate([pi_hole_edge_distance,pi_width-pi_hole_edge_distance-pi_hole_width_distance,-0.1]) 
                cylinder(h=hole_height, r=hole_radius);
            translate([pi_hole_edge_distance+pi_hole_length_distance,pi_width-pi_hole_edge_distance-pi_hole_width_distance,-0.1]) 
                cylinder(h=hole_height, r=hole_radius);
        }
        
    }
    
}

module motor() {
    cube([70,22,18]);
}
module wheel() {
    cylinder(r=40,h=20);
}
module camera() {
    cube([10,10,2]);
}
module battery() {
    cylinder(r=7, h=50);
}
module motorWheel() {
    motor();
    translate([12,11,20])
        wheel();
}

module l298nSmall() {
    cube([24.7, 21, 7]);
}
module imu() {
    cube([15,10,3]);
}
module piCam() {
    cube([24,25,2.4]);
    translate([12,12.5, 2.4])cylinder(r=4,h=5.9);
}

module chassis() {
    cube([108.4,45,120]);
}


module internals() {
    translate([5,10,0])rotate([0,270,270])rpi();
    translate([0,-11,-10])rotate([0,270,0])motorWheel();
    translate([70,11,-10])rotate([180,270,0])motorWheel();
    translate([20,0,40])battery();
    translate([50,0,40])battery();
    translate([5,0,10])rotate([90,0,0])l298nSmall();
    translate([45,0,10])rotate([90,0,0])imu();
    translate([25,-8,60])rotate([90,0,0])piCam();

//camera();
}

module space() {
        translate([2,0,-5])cube([66,10,100]);
    
}
module mainPart() {
    difference(){
        translate([-19.2,-20,-12])chassis();
        translate([0,0,0])internals();
    }
}

color("blue",0.4) translate([-19.2,-80,-12])chassis();
color("yellow",0.4) space();
color("red",0.6)translate([0,0,0])internals();