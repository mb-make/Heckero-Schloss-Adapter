
include <model.scad>;


spacing = 2;


projection()
union() {
    model_bottom();

    translate([t+spacing, 0]) {
        model_middle();

        translate([t+spacing, 0]) {
            model_top();
        }
    }
}
