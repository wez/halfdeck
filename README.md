# Half Deck - Mk 5

This is my fifth keyboard design.  This repo will be updated as I get around to expanding
the data here.

I literally just submitted the first order of a small batch of PCBs so the correctness
of these designs is yet to be proven.

## Assembly - Left Hand

The top of the PCB faces up for the Left Hand.  You'll know you've got it facing the
correct direction because it has a graphic showing a left hand in the bottom left
corner, as well as some version information down there.

You will place the key switches on this side of the board for the left hand but
solder them in on the other side.

If you are right handed and also want to connect a touch pad, you will connect
the SX1509 on this half.

If you are left handed and also want to connect a touch pad, you will connect
the controller and the touch pad on this half.

### I2C Jumper configuration

On the top edge of the PCB there is a little notch where the TRRS connector
will be fitted.  To the right of that area is a pair of solder jumpers labelled
`JP1` and `JP2`.  These are present to allow setting up the same PCB for either
left or right handed usage and control which pins of the TRRS connector are
connected to the power and ground lines.

Each jumper consists of three rectangles.  The middle of the three needs to
be bridged to *either* the left or the right pad using either excess solder
or a short section snipped off of one of the diode legs.  Controlling excess
solder can be difficult, so I would suggest using a diode leg trimmed to size.

* `JP1` must be bridged to `3V3`
* `JP2` must be bridged to `GND`

It's not the end of the world if you mix this up, so long as each jumper either
goes to `GND` or `3V3`.  They must not both be set to the same thing or you
risk damaging your electronics.

## Assembly - Right Hand

The bottom of the PCB faces up for the Right Hand.  You'll see a graphic
showing a right hand in the bottom right corner of the PCB.

You will place the key switches on this side of the board for the right hand
but solder them in on the other side.

If you are right handed and also want to connect a touch pad, you will connect
the controller and the touch pad on this half.

If you are left handed and also want to connect a touch pad, you will connect
the SX1509 on this half.

### I2C Jumper configuration

Similar to the note on the Left Hand, but the Right Hand absolutely must have
the opposite settings to the Left Hand!

* `JP1` must be bridged to `GND`
* `JP2` must be bridged to `3V3`

While the PCB is mostly reversible, the jumper blocks are only present on
one side of the board, so you need to flip it over to configure them.

