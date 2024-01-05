
$fn = 30;
nothing = 0.01;

// Screw diameter
d = 4;
// Top edge
s = 6;
// Bottom height
h1 = 2;
// Middle height
h2 = 2;
// Top height
h3 = 2;
// Bottom edge
t = 15;
// Bottom hole edge
l = 7;

module screw() {
  translate([0, 0, -nothing])
  cylinder(h=h1+h2+h3+2*nothing, d=d);
}

module Schloss() {
  translate([t/2-l/2, t/2-l/2, -nothing])
  cube([l, l, h1+2*nothing]);
}

module base() {
  difference() {
    cube([t, t, h1]);
    Schloss();
  }
}

module Verbinder() {
  difference() {
    cube([t, t, h2+2*nothing]);
    translate([t/2, t/2])
    screw();
  }
}

module plug() {
  difference() {
    cube([s, s, h3]);
    translate([s/2, s/2])
    screw();
  }
}

union() {
  base();
  translate([0, 0, h1 - nothing])
  Verbinder();
  translate([t/2-s/2, t/2-s/2, h1+h2 - 2*nothing])
  plug();
}
