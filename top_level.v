`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/10/2020 05:18:15 PM
// Design Name:
// Module Name: top_level
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module top_level(
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

    //reg [24:0] count = 0;

    (* dont_touch = "yes" *) wire [7:0] challenge;
    (* dont_touch = "yes" *) wire [7:0] response;
    (* dont_touch = "yes" *) wire [31:0] enables;
    (* dont_touch = "yes" *) wire done;

    assign challenge = {ck_io26, ck_io27, ck_io28, ck_io29, ck_io30, ck_io31, ck_io32, ck_io33};
    assign response = {ck_io34, ck_io35, ck_io36, ck_io37, ck_io38, ck_io39, ck_io40, ck_io41};
    assign enables = {32{enable}};
    assign ck_io8 = orred | done;

    //always @ (posedge(clk)) count <= count + 1;
    //assign ck_io7 = count[24];
    //assign response = challenge;
    (* dont_touch = "yes" *) puf_parallel parallel_scheme(enables, challenge, response, done, clk, ck_io0);    // ck_io0 is computer_ack for reset

endmodule
