44CON 2014 Badge
================

Based on the Dangerous Prototypes Bus Pirate V3c

Summary of changes:
-------------------
- changed PCB outline in dp_pcb.lbr
- added 44CON text in 44context.lbr
- added 1.8v LDO for using cpld without FTDI
- added LEDs and resistors on JP2 spare pins
- added 5x7mm Oscillator on pin 28
- added solder jumper near vtarget jumper

PCB Files
---------
* .sch and .brd: eagle schematic and board files 
* .lbr: eagle libraries for board outline and text items 
* .G* and .TXT: gerber files for fabricating board

CPLD Files
----------
* conled.v defines led flashing logic
* conled.v defines I/O pin assignments
* conled.jed xilinx bitstream file
* default.svf and default.xsvf bistream in generic format

Build options:
-------------
1. Generic USB Blaster for JTAG OCD, programming, and testing
1. Bare minimum CPLD build for flashing lights
1. Bare minimum CPLD build for cheap glitching

USB Blaster Build:
-----------------
see details on dangerous prototypes website:
http://dangerousprototypes.com/docs/Bus_Blaster_v3_design_overview

Flashy Light Build:
------------------

![cpld components](https://raw.githubusercontent.com/securelyfitz/44con/master/cpldparts.jpg)

parts:
------
* CR2032 battery
* xilinx xc2c32a CPLD
* lm3480 1.8v regulator (note pinout!!!)
* 3.3nF tantalum capacitor
* 0805 LED x5
* 0603 50 ohm resistor
* .1" header for programming
* 5x7mm 50mhz (ish) oscillator
* CR2032 holder

building:
--------
1. solder battery holder onto the back of the board between jp2 3.3v pin and a JTAG GND pin
1. solder over the solder jumper in the upper right corner of the board
1. solder lm3480 just below and in between the FTDI and CPLD chips
  * if you have an AP7313 the pinout is different, rotate it clockwise 120 degrees and solder it
1. solder the tantalum capacitor on C2 with + towards the top of the PCB
1. put the CR2032 in and test that you have 3ish  volts on the 3.3v pins and 1.8 volts on the right lead of the regulator
1. remove the CR2032
1. solder the oscillator in the bottom right. Pin1 is in the far bottom right
1. solder the CPLD in place. Pin1 goes up
1. solder the resistors in place between the 2014 on the bottom. Resistors go on the upper pads
1. solder the LEDs below the resistors. + is to the left, - to the right
1. put the CR2032 back in and test for output from pin 3 of the oscillator (top left) with a multemeter to make sure it's not 0v
1. using a jtag programmer - Xilinx cable, Bus blaster, or a bus pirate in SVF mode - configure your CPLD and watch lights flash!

troubleshooting:
---------------
* if you can't recognize/configure the CPLD or lights are very dim, it could be a power issue. double check the 1.8v regulator and that the capacior is in the right direction.
* if the LEDs go on but don't flash, check your oscillator

![cpld built](https://raw.githubusercontent.com/securelyfitz/44con/master/cpldbuilt.jpg)

Glitching build:
----------------
same as flashy light build, though LEDS are optional. WIP to use it for glitching arduinos and/or XBOX360s

