// Reaction Game Pod Enclosure
// Compatible with Anycubic slicers (export to STL)

$fn = 50; // smoothness

// --- Parameters ---
box_w = 120;
box_d = 80;
box_h = 45;
wall = 2.5;
lid_h = 5;

// --- Main box ---
difference() {
    cube([box_w, box_d, box_h], center=false);
    translate([wall, wall, wall])
        cube([box_w - 2*wall, box_d - 2*wall, box_h], center=false);
}

// --- Button holes (12mm) ---
translate([30, 20, box_h - 10])
    cylinder(h=20, d=12, center=true);

translate([90, 20, box_h - 10])
    cylinder(h=20, d=12, center=true);

// --- OLED screen cutout (27x11 mm) ---
translate([46.5, 65, box_h - 5])
    cube([27, 11, 10], center=false);

// --- LED holes (5mm each) ---
for (i = [0:3])
    translate([40 + i*10, 50, box_h - 8])
        cylinder(h=10, d=5, center=true);

// --- Speaker holes (grid of small holes) ---
for (x = [0:2])
    for (y = [0:2])
        translate([60 + x*4, 35 + y*4, box_h - 8])
            cylinder(h=10, d=2.5, center=true);

// --- USB cutout (back edge) ---
translate([box_w - 20, box_d - wall, 10])
    cube([12, wall + 1, 6], center=false);
