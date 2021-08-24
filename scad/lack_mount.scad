
include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <BOSL/shapes.scad>

module lack_hook()
{
    move([18,100,-3]) {
        difference() {
            lugx = -20;
            union() { 
                cuboid([66,52,4], chamfer = 1.5, edges=EDGES_ALL-EDGE_TOP_LF-EDGE_TOP_RT);
            }

            // Screw shaft holes
            move([lugx,0,1]) cyl(h=10, d=5.5);
            move([lugx+40,0,1]) cyl(h=10, d=5.5);
        }
    }



}

module wall_bracket()
{
    move([29.5,3.5,-6.5]) {
        difference() {
            lugx = -26.1;
            union() {
                move([3,35,0]) cuboid([66,85,4], chamfer = 1.5, edges=EDGES_ALL-EDGE_TOP_LF-EDGE_TOP_RT);

                // Mounting lugs
                move([lugx,0,1 + 1.4]) cyl(h=4, d=7.8);
                move([lugx,49,1 + 1.4]) cyl(h=4, d=7.8);
                move([lugx + 58,0,1 + 1.4]) cyl(h=4, d=7.8);
                move([lugx + 58,49,1 + 1.4]) cyl(h=4, d=7.8);
            }

            // Screw shaft holes
            move([lugx,0,1]) cyl(h=10, d=2.8);
            move([lugx,49,1]) cyl(h=10, d=2.8);
            move([lugx + 58,0,1]) cyl(h=10, d=2.8);
            move([lugx + 58,49,1]) cyl(h=10, d=2.8);

            // Screw head recess holes
            move([lugx,0,-12 + 8.5]) cyl(h=14, d=5);
            move([lugx,49,-12 + 8.5]) cyl(h=14, d=5);
            move([lugx + 58,0,-12 + 8.5]) cyl(h=14, d=5);
            move([lugx + 58,49,-12 + 8.5]) cyl(h=14, d=5);

            move([lugx - 2,0,-14 + 8]) cuboid([10, 5, 14]);
            move([lugx - 2,49,-14 + 8]) cuboid([10, 5, 14]);
            move([lugx + 58 + 2,0,-14 + 8]) cuboid([10, 5, 14]);
            move([lugx + 58 + 2,49,-14 + 8]) cuboid([10, 5, 14]);
        }
    }
}


module lack_mount_bracket()
{
    move([14.5,23,45]) rotate([-40,0,0]) lack_hook();
    wall_bracket();
}