`timescale 1ns / 1ps

/*
* Company: Santa Clara University
* Engineer: Jonathan Trinh
*
* Create Date: 02/13/2020 11:09:41 PM
* Design Name:
* Module Name: smart_buffer
* Project Name: Delay-based Physical Unclonable Function Implementation
* Target Devices: Digilent S7-25, S7-50 (Xilinx Spartan 7)
* Tool Versions:
* Description: This buffer stores each bit from each race. It is also in
*              charge of reset logic.
*
* Dependencies:
*
* Revision:
* Revision 0.01 - File Created
* Additional Comments:
*
*/

module smart_buffer(
    clock,
    dataIn,
    bit_done,
    dataOut,
    count,
    full,
    empty,
    computer_ack_reset,
    scrambler_reset,
    arbiter_reset,
    counter_reset,
    ready_to_read
    );

    input clock, dataIn, bit_done, computer_ack_reset;
    output full;
    output empty;
    output counter_reset;
    output arbiter_reset;
    output scrambler_reset;

    output reg ready_to_read;
    output [7:0] dataOut;

    output reg [3:0] count = 0;
    assign full  = (count==8)? 1'b1 : 1'b0;
    assign empty = (count==0)? 1'b1 : 1'b0;

    reg [7:0] tmp;  // the internal buffer/memory. dataOut has full access to this
    reg reset_r, bit_done_on, bit_done_r1;
    wire reset_out= computer_ack_reset|reset_r;
    assign {counter_reset, arbiter_reset, scrambler_reset} = {3{reset_out}};
    assign dataOut = tmp;

    // Since "dataIn" and "bit_done" are two signals that come from the race arbiter (an asynchronous module)
    // and this module is clocked, we need to use a FIFO to make sure the buffer successfully captures these signals.

    // sync dataIn and bit_done
    reg [3:0] sync_din_r, sync_done_r;  // instantiating two FIFOs each four registers long

    // First always block to define FIFO logic. Either reset or otherwise, shift into FIFO (on MSB side) on each clock cycle.
    always @(posedge clock or posedge computer_ack_reset) begin
      if (computer_ack_reset) begin
        sync_din_r  <= 4'h0;
        sync_done_r <= 4'h0;
        bit_done_on <= 1'b0;
      end
      else begin
        sync_din_r  <= {dataIn, sync_din_r[3:1]};
        sync_done_r <= {bit_done, sync_done_r[3:1]};
	    bit_done_on <= sync_done_r[1] & ~sync_done_r[0];   // bit_done_on is negative-edge triggered
      end
    end

    // Second always block to define reset_r (local reset) logic. We want to make sure that reset_r asserts at
    // least two clock cycles from the time bit_done_on is asserted to ensure sufficient time to store the bit from data FIFO
    always @(posedge clock or posedge computer_ack_reset) begin
      if (computer_ack_reset)
        {reset_r,bit_done_r1} <= 2'b00;
      else
        {reset_r,bit_done_r1} <= {bit_done_r1,bit_done_on};     // delay reset_r =  2 cycles from bit_done_on
    end

    // Third always block to define internal storage behavior.
    always @(posedge clock or posedge computer_ack_reset) begin
        if (computer_ack_reset)
            tmp <= 8'bXXXXXXXX;
        else if (bit_done_on)
            tmp <= {tmp[6:0],sync_din_r[0]};    // read in from FIFO (on LSB) side
    end

    // Fourth always block to define when the response is "ready_to_read"
    always @(posedge clock or posedge computer_ack_reset) begin
        if (computer_ack_reset) begin
            ready_to_read <= 1'b0;
            count <= 0;
        end
        else if (bit_done_on) begin
            //tmp <= {tmp[6:0],dataIn};
            count <= count + 1;
            if (count == 7) ready_to_read <= 1'b1;
        end
    end

endmodule
