# Implementation of Physical Unclonable Function

This is a repository for SCU Senior Design 2020. In this project, we will be implementing two versions of a Ring Oscillator Physical Unclonable Function.

# Background

In recent years, chip manufacturing has been moved outside the United States, while IP design remains inside the US, thereby resulting in a huge increase in counterfeiting, IP piracy and overproduction. These fake chips are bad for both the industry and the consumer - the original designer loses money and credibility as the consumer attempts to use a chip with higher failure rates and a shorter lifespan. When a designer sends their schematic overseas, they should be cautious with their design. Did the foundry overproduce chips to reverse engineer and sell the design to competitors? Did they add in hardware Trojans to leak/destroy protected data? How can a designer ensure the chips are authentic? And if another individual purchases one of the ICs, how do they know they are receiving a genuine one and not a counterfeit chip? Designers need some mechanism to guarantee that their design remains authentic after production and unusable to counterfeiters.

A ring oscillator (RO) PUF is a delay-based PUF which uses frequency variations in inverter chains to generate unique IDs. ROs are made up of an odd numbers of inverters connected in a chain which oscillates at a specific frequency. Process variation introduced during IC manufacturing causes the frequencies in each RO to be slightly different. An RO PUF consists of identically-laid out ring oscillators fed into a two MUXs. The PUF challenge feeds into the MUX select lines and chooses which two ROs to compare. The MUX outputs are fed into a counter, each of which counts up to a preset value. If the top or the bottom counter reaches the preset value, the race arbiter will output a '1' or a '0' as the response depending which counter finishes first.

# Our Designs

We propose a two designs of an 8-bit->8-bit RO PUF.

1. A parallel scheme that we suggest be used as a benchmark for all PUF designs.
2. A new serial scheme that uses a non-linear scrambler to increase internal entropy (a good measure of randomness) in the system. This scheme also saves in hardware and power compared to the parallel variation.

![Schematic of Design](/images/puf_scheme.jpg "Schematic of Design") *This is the overall schematic of the serial scheme. Modules surrounded by yellow dotted line are included in the serial scheme. The schematic without these modules is one subblock of the parallel scheme.*

## Getting Started

You'll need to clone this repository with ssh or by some other means. Once you have the files. You're ready to start writing more modules that utilize the blocks currently implemented and testbenches. The way it is currently written, the blocks themselves are written in Verilog and the testbenches are in SystemVerilog, but this doesn't mean blocks can't be written in SystemVerilog (as it is still synthesizable).

Also note: Please work in your own branch!!! You can do this via: `git checkout -b MyNewBranch`. Once you are ready to merge the changes into master, create a Pull Request on this page, and we can review the code.

To behaviorally test the block that you are working with (assuming the testbench and rtl for the block are implemented), we are going to use Synopsys VCS. To compile:

```
vcs [TESTBENCH_FILE] [RTL_FILE] -sverilog -debug_access+all -full64
```

To actually run the simulation, you have two options:

1. `./simv` will run the sim in the existing terminal session outputting all monitor and display statements
2. `./simv -gui &` will bring up the GUI where you can take a look at the waveform.

## Using Vivado to Synthesize and Implement on Board

For our purpose, we use a Digilent S7, provided by Pat McGuire of Xilinx. The reference manual is located [here](https://reference.digilentinc.com/reference/programmable-logic/arty-s7/start)

### Design Placement

To simulate the PUF being manufactured on different ICs, we can place the PUF design on different areas of the die in the FPGA. There are a number of ways to do this, but you will most likely need the Master XDC Constraint File (these define the IOs of your board and tie the design to the board) of whichever board you are using as these directives will go into that file. Placer directives are tool settings that are set on a per-run basis. Timing and pblock constraints go into the XDC constraint file.

1. The first method is to use different placer directives leveraging different algorithms in the placer (set in the synthesis/implementation settings):
    1. Ex: place\_design -directive Explore
    2. Ex: place\_design -directive ExtraNetDelay_high
    3. Ex: place\_design -directive Quick
2. The second method is to use BEL/LOC attributes to force the location of a Look-up Table (LUT):
    1. Ex: `set_property BEL A5 [get_cells my_lut_name]`
    2. Ex: `set_property LOC SLICE_X0Y0 [get_cells my_lut_name]`
3. The third method is to create tighter timing constraints on timing path (most probably a clock):
    1. Ex: Add 50 ps of clock uncertainty to particular clock via `set_clock_uncertainty 0.05 -setup [get_clocks my_clock_name]`
    2. Ex: Set duty cycle of clock period to 99% instead of 100%. Tightening the constraint by a bit will change placement: `set_max_delay [expr [0.99 * $clk_period]] -from [get_cells start_cell_name] -to [get_cells destination_cell_name]`
4. The fourth method is to create a physical constraint block (pblock) to place the design on a particular spot (denoted by slices) on the die:
    1. Ex:
    ```
    create_pblock my_pblock
    resize_pblock  my_pblock -add SLICE_X0Y0:SLICE_X10Y10
    add_cells_to_pblock my_pblock [get_cells my_list_of_cells]
    ```

## Creators

* Abigail Aguirre
* Michael Hall
* Tim Lim
* Jonathan Trinh (owner of repo)

## Special Thanks To

* Dr. Sara Tehranipoor (Advisor and Hardware Security Expert) from SCU
* Pat McGuire (Sponsor) from Xilinx
* Professor Jim Lewis (Implementation Aid) from SCU
* Dr. Cary Yang (Senior Design Facilitator) from SCU
* Dr. Shoba Krishnan (EE Department Chair) from SCU
