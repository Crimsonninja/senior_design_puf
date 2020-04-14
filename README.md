# Implementation of Physical Unclonable Function

This is a repository for SCU Senior Design 2020. In this project, we will be implementing two versions of a Ring Oscillator Physical Unclonable Function.

# Background

In recent years, chip manufacturing has been moved outside the United States, while IP design remains inside the US, thereby resulting in a huge increase in counterfeiting, IP piracy and overproduction. These fake chips are bad for both the industry and the consumer - the original designer loses money and credibility as the consumer attempts to use a chip with higher failure rates and a shorter lifespan. When a designer sends their schematic overseas, they should be cautious with their design. Did the foundry overproduce chips to reverse engineer and sell the design to competitors? Did they add in hardware Trojans to leak/destroy protected data? How can a designer ensure the chips are authentic? And if another individual purchases one of the ICs, how do they know they are receiving a genuine one and not a counterfeit chip? Designers need some mechanism to guarantee that their design remains authentic after production and unusable to counterfeiters.

A ring oscillator (RO) PUF is a delay-based PUF which uses frequency variations in inverter chains to generate unique IDs. ROs are made up of an odd numbers of inverters connected in a chain which oscillates at a specific frequency. Process variation introduced during IC manufacturing causes the frequencies in each RO to be slightly different. A RO PUF consists of identically-laid out ring oscillators fed into a two MUXs. The PUF challenge feeds into the MUX select lines and chooses which two ROs to compare. The MUX outputs are fed into a counter, each of which counts up to a preset value. If the top or the bottom counter reaches the preset value, the race arbiter will output a '1' or a '0' as the response depending which counter finishes first.

# Our Designs

We propose a two designs of an 8-bit->8-bit RO PUF. The first is a parallel design that we suggest be used as a benchmark for all PUF designs. The second is a new serial scheme that uses a non-linear scrambler to increase internal entropy (a good measure of randomness) in the system.

![Schematic of Design](/images/puf_scheme.jpg "Schematic of Design") *Modules surrounded by yellow dotted line are included in the serial scheme. The schematic without these modules is one subblock of the parallel scheme.*

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


## Creators

* Abigail Aguirre
* Michael Hall
* Tim Lim
* Jonathan Trinh (owner of repo)

## Special Thanks To

* Dr. Sara Tehranipoor (Advisor)
* Professor Jim Lewis
* Pat McGuire
* Dr. Cary Yang (2020 EE Senior Design Facilitator)
