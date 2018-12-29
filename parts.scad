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
    cube([80,20,20]);
}
module camera() {
    cube([10,10,2]);
}
rpi();
//motor();
//camera();
