# Half Deck - Mk 5

This is my fifth keyboard design.  This repo will be updated as I get around to
expanding the data here.

This is a split keyboard in two halves.  One half has a microcontroller that
implements USB and communicates with the other half using a two-wire bus
protocol known as I2C.

The other half has an IO expander component that is connected to the keyboard
matrix and that can be queried over I2C.

A TRRS (Tip-Ring-Ring-Sleeve) cable is used to connect the two halves; this is
a 4-wire cable that carries the power and I2C signals to the IO expander.

## Before you begin

The PCBs are double sided so that the same design can be used to build either
the RHS or the LHS of the keyboard.  Make sure you read through this doc and
understand where you're going to place the components before you cut or solder
anything, as it can be difficult to undo those actions.

If you are using a plate with your keyboard (eg: the top acrylic plate with the key
switch holes), keep in mind that you can't solder in any of the switches until
you have the plate as the switches effectively bolt the plate to the PCB.
If your plate material is thicker than ~1.6mm then it won't clip into the small
lugs on the switches and you may need to add some M3 spacers to raise the plate
up to the appropriate height; depending on how you flush you solder your diodes
that may not be required.

The labels for the controller and IO multiplexer are biased towards right
handed users, or rather, assume that the touchpad be located on the RHS.  If
you want to place it on the LHS you will need to swap the multiplexer and the
controller.  This should be straightforward, but will require attaching those
components upside-down.  Pay careful attention to the labels on the pins to
ensure that you have things placed correctly!

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

This image shows the jumpers for the LHS:
![LHS I2C jumper](images/jumper-header-lhs.jpg)

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

This image shows the jumpers for the HHS:
![LHS I2C jumper](images/jumper-header-rhs.jpg)

## Errata

The first batch of these boards have a minor issue with the `SCL` line; due to
a typo it isn't actually connected to the TRRS jack.  You will need to bridge
the misnamed `SDL` pads to the `SCL` pads on each side.

### Patching the RHS

![RHS jumper fix](images/jumper-fix-rhs.jpg)

### Patching the LHS

![RHS jumper fix](images/jumper-fix-lhs.jpg)

## Recommended Order of Assembly

1. Diodes
2. The TRRS connectors
3. Jumpers (I2C and the Errata section above)
4. Header strip for the controller/expander
5. Key switches

## Diodes

The diodes are directional; they allow current to flow in a single direction.
Their purpose in the circuit is to prevent ghosting.  If you attach one in
the wrong direction it can be hard to debug and isolate if you don't have
a multimeter, so take care to make sure you've placed them correctly.

The diodes have a black line at one end.  The black line must be aligned with
the thick white line in the diode outline on the PCB.  The solder pad on that
side is square, which is another visual cue; think *black, thick, square*.

Bend the legs of the diode so that you form a slender `n` shape, with the diode
body at the top of the `n`.  The goal is to have the diode body lay flush against
the PCB within the outline on the pcb, so you want the legs to bend and fit the
holes at either end of the outline.

![diode placement](images/diode-placement.jpg)

I'd suggest taking your time with the first one and perhaps solder that one
before placing the rest to make sure you understand how it will fit.  Make
sure that you have it oriented correctly before soldering!

To solder the diodes, the technique is important.  You're placing the diodes
on the side of the board facing up but you need to solder them on the back side
of the board.  I bend the legs to form a `V` shape to keep the diodes in place
when you flip the board over:

![diode back side](images/diode-backside.jpg)

Once you've placed the diodes, check again to make sure that you have them
facing the right direction (*black, thick, square*) and solder them in.  You
want enough solder that you fill the hole with a nice shiny blob, and you want
it to be very slightly convex.

Be careful with the diode legs: you can easily prick yourself on the legs and
the human reflex to suddenly move away from the prick can be dangerous if one
of your hands is holding a hot soldering iron!

After soldering, double check the orientation of the diodes again: it's not
super easy to correct at this point, but it will get much harder if you
discover a problem later because the next step is to snip off the diode legs.

Use your angle/flush cutters for this; lay the edge of the cutters flush with
the board and snip off the leg where it comes through the hole.  Ideally you
want to trim it such that you're just left with a small convex mound of solder
around the hole.  I recommend holding the leg with one hand while you snip; the
picture below doesn't show this because I was holding the camera to take the
picture.  The reason for holding the leg while snipping is that it can jump off
your work surface and land on the floor.  If you're not diligent at tracking
and picking up the legs from the floor, it is easy for someone to stub/stab a
toe with a diode leg.  While they're not super sharp, they're small enough that
they can jab in a few millimeters and draw blood.

![diode leg snip](images/diode-snip.jpg)

