# Implementation of Physical Unclonable Function

This is a repository for SCU Senior Design 2020. In this project, we will be implementing a version Ring Oscillator Physical Unclonable Function.

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
