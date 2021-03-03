$fn = 100;

arch_w = 2;
arch_d = 0.1;
arch_t = 0.1;

arch_sweep_radius = 14;
arch_sweep_angle = 45;
arch_base_sep = -4.967*2;

module arch_half(){
    translate([arch_base_sep,0,0]){
        rotate_extrude(angle = arch_sweep_angle){
            translate([arch_sweep_radius,0,0]){
                square([arch_t, arch_d], center=true);
            }
        }
    }
}

module arch(){
    rotate([0,-45,0]){
        rotate([0,0,-90]){
            arch_half();
            mirror([-1,0,0]){
                arch_half();
            }
        }
    }
}

//arch();


num_petals = 5;
flower_radius = 10;
module flower(){
    for(i=[0:1:num_petals]){
        rotate([0,0,i*360/num_petals]){
            translate([flower_radius,0,0]){
                arch();
            }
        }
    }
}

union(){
    flower();

//breaks when rendering for some reason
    /*scale([0.016,0.016,0.016]){
        import ("Mannequin_FULL.stl", convexity = 4);
    }*/
}