use <left-case.scad>


module quarter(x, y, z, y_cut_delta=0, x_cut_delta=0, offset=[0,0,0], piece) {
    tongue_size = 2.8;
    displacement = 12;
    // tolerance on the groove side
    kerf = 0.25;

    y_cut = (y / 2) + y_cut_delta;
    x_cut = (x / 2) + x_cut_delta;
    total_z = z * 2;

    module cutout(kerf=0) {
        rotate([90, 0, 0])
        cylinder(h=kerf + max(y + abs(y_cut_delta),
                              x + abs(x_cut_delta))/2,
                 r=tongue_size, $fn=4);
    }

    module tongue() {
        cutout();
    }

    module groove() {
        cutout(kerf);
    }

    module top_left_quadrant() {
        cube([x_cut, y_cut, total_z]);
    }

    module offset_top_right() {
        translate([x_cut, 0, 0]) children();
    }

    module top_right_quadrant() {
        offset_top_right()
        cube([x - x_cut, y_cut, total_z]);
    }

    module offset_bottom_left() {
        translate([0, y_cut, 0]) children();
    }

    module bottom_left_quadrant() {
        offset_bottom_left()
        cube([x_cut, y - y_cut, total_z]);
    }

    module offset_bottom_right() {
        translate([x_cut, y_cut, 0]) children();
    }

    module bottom_right_quadrant() {
        offset_bottom_right()
        cube([x - x_cut, y - y_cut, total_z]);
    }

    module offset_top_left_lr() {
      offset_top_right()
      translate([0, y_cut, z/2])
      children();
    }

    module offset_bottom_left_lr() {
      offset_bottom_left()
      translate([x - x_cut, y - y_cut, z/2])
      children();
    }

    module offset_top_left_ud() {
      translate([0, y_cut, z/2])
      rotate([0, 0, 90])
      children();
    }

    module offset_top_right_ud() {
      offset_bottom_right()
      translate([0, 0, z/2])
      rotate([0, 0, 90])
      children();
    }

    // top left quadrant
    if (piece == undef || piece == 0)
    translate([-displacement, -displacement, 0]) {
      intersection() {
        translate(offset) {
          difference() {
            union() {
              top_left_quadrant();
              // RHS tongue
              intersection() {
                top_right_quadrant();
                offset_top_left_lr() tongue();
              }
            }
            // bottom groove
            offset_top_left_ud() groove();
          }
        }
        children(0);
      }
    }

    // top right quadrant
    if (piece == undef || piece == 1)
    translate([displacement, -displacement, 0]) {
      intersection() {
        translate(offset) {
          difference() {
            union() {
              top_right_quadrant();
              // bottom tongue
              intersection() {
                bottom_right_quadrant();
                offset_top_right_ud() tongue();
              }
            }
            // LHS groove
            offset_top_left_lr() groove();
          }
        }
        children(0);
      }
    }

    // bottom right quadrant
    if (piece == undef || piece == 2)
    translate([displacement, displacement, 0]) {
      intersection() {
        translate(offset) {
          difference() {
            union() {
              bottom_right_quadrant();
              // LHS tongue
              intersection() {
                bottom_left_quadrant();
                offset_bottom_left_lr() tongue();
              }
            }
            // top groove
            offset_top_right_ud() groove();
          }
        }
        children(0);
      }
    }

    // bottom left quadrant
    if (piece == undef || piece == 3)
    translate([-displacement, displacement, 0]) {
      intersection() {
        translate(offset) {
          difference() {
            union() {
              bottom_left_quadrant();
              // top tongue
              intersection() {
                top_left_quadrant();
                offset_top_left_ud() tongue();
              }
            }
            // RHS groove
            offset_bottom_left_lr() groove();
          }
        }
        children(0);
      }
    }
}


mirror([0, 1, 0]) {

mirror(v=[1, 0, 0]) {
translate(v=[-79.00000000000001, -62.971638365903445]) {
sliced_case_top() {
}
}
}
}
