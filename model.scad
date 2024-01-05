
$fn = 80;
nothing = 0.01;

// screw diameter (nominal)
s = 4;

// bottom edge
t = 15;

// bottom hole edge
l = 7 + 0.6;

// bottom height
h1 = 2;

// middle height
h2 = 1;

// top height
h3 = 3;

// top edge
e = 6;


module screw(x, y, height, diameter) {
  translate([x, y, -nothing])
  cylinder(
    d=diameter,
    h=height + 2*nothing
  );
}


module model_bottom(
        size_x=t,
        size_y=t,
        size_z=h1,
        hole_size_x=l,
        hole_size_y=l
) {
  difference() {
    cube([size_x, size_y, size_z]);

    // Hole
    translate([
        size_x/2 - hole_size_x/2,
        size_y/2 - hole_size_y/2,
        -nothing
    ])
    cube([
        hole_size_x,
        hole_size_y,
        size_z + 2*nothing
    ]);
  }
}


module model_middle(
        size_x=t,
        size_y=t,
        size_z=h2,
        screw_diameter=s
) {
  difference() {
    cube([size_x, size_y, size_z]);
    screw(
        x=size_x/2,
        y=size_y/2,
        height=size_z,
        diameter=screw_diameter
    );
  }
}


module model_top(
        size_x=e,
        size_y=e,
        size_z=h3,
        screw_diameter=s
) {
  difference() {
    cube([size_x, size_y, size_z]);
    screw(
        x=size_x/2,
        y=size_y/2,
        height=size_z,
        diameter=screw_diameter
    );
  }
}


module model() {
  difference() {
    union() {
        model_bottom();

        translate([0, 0, h1 - nothing])
        model_middle();

        translate([t/2-e/2, t/2-e/2, h1+h2 - 2*nothing])
        model_top();
    };

    screw(
        x=t/2,
        y=t/2,
        diameter=s,
        height=h1+h2+h3
    );
  }
}
