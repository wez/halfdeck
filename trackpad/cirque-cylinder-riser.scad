/* Defines a mounting assembly for a Cirque
circular trackpad:
https://www.cirque.com/glidepoint-circle-trackpads

This is designed for the TM040040 device which
has a 40mm diameter.
*/

// 6mm is just within the vertical travel range
// of a cherry mx keyswitch.  Any taller and we
// risk the "M" and SPC key caps being obstructed
// by this mount when pressed.
// If you are using the 35mm trackpad you
// can affort to make this taller.
height = 6;

union(){
    translate([0,0,2]) {
        union() {
            difference() {
                // outer cylinder
                cylinder(height, 24.5, 24.5);
                union() {
                    // shelve / lip
                    translate([0,0,height-1]) {
                        cylinder(2, 23.5, 23.5);
                    }
                    // the inner cylinder
                    cylinder(height, 20, 20);
                }
            }
            // lug
            translate([-22,-1,height-1.4]) {
                cube(2);
            }
            
            // subtract the inside: left mounting rect
            translate([-21,-7,0]) {
                cube([3,13.5,1.6]);
            }
            
            // subtract the inside: right mounting rect
            translate([18,-7,0]) {
                cube([3,13.5,1.6]);
            }
        }
    }
    // left mounting rectangle
    translate([-19,-7,0]) {
        difference() {
            cube([8.25,13.75,3.6]);
            translate([1, 1.75, 0]) {
                cube([6,10,3.6]);
            }
        }
    }
    // right mounting rectangle
    translate([11,-7,0]) {
        difference() {
            cube([8.25,13.75,3.6]);
            translate([1, 1.75, 0]) {
                cube([6,10,3.6]);
            }
        }
    }
}