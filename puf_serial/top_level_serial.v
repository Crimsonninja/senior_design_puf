`timescale 1ns / 1ps

/*
* Company: Santa Clara University
* Engineer: Jonathan Trinh
*
* Create Date: 03/29/2020 09:14:40 PM
* Design Name:
* Module Name: top_level_serial
* Project Name: Delay-based Physical Unclonable Function Implementation
* Target Devices: Digilent S7-25, S7-50 (Xilinx Spartan 7)
* Tool Versions:
* Description: Top Level that ties the puf_serial module to the Digilent S7 board.
*              Inputs and outputs are defined in the XDC Master Constraint File
*              provided by Xilinx.
*
* Dependencies:
*
* Revision:
* Revision 0.01 - File Created
* Additional Comments:
*
*/

module top_level_serial(
    input enable,
    input ck_io26,
    input ck_io27,
    input ck_io28,
    input ck_io29,
    input ck_io30,
    input ck_io31,
    input ck_io32,
    input ck_io33,
    output ck_io34,
    output ck_io35,
    output ck_io36,
    output ck_io37,
    output ck_io38,
    output ck_io39,
    output ck_io40,
    output ck_io41,
    input clk,
    input orred,
    input ck_io0,
    output ck_io8
    );

    (* dont_touch = "yes" *) wire [7:0] challenge;
    (* dont_touch = "yes" *) wire [7:0] response;
    (* dont_touch = "yes" *) wire [31:0] enables;
    (* dont_touch = "yes" *) wire done;

    assign challenge = {ck_io26, ck_io27, ck_io28, ck_io29, ck_io30, ck_io31, ck_io32, ck_io33};
    assign response = {ck_io34, ck_io35, ck_io36, ck_io37, ck_io38, ck_io39, ck_io40, ck_io41};
    assign enables = {32{enable}};
    assign ck_io8 = orred | done;

    (* dont_touch = "yes" *) puf_serial serial_scheme(enables, challenge, response, done, clk, ck_io0);    // ck_io0 is computer_ack for reset
endmodule
