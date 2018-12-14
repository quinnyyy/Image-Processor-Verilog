`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:29:33 12/11/2018 
// Design Name: 
// Module Name:    write_7seg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module write_7seg(clock, w_enable, digit_select, write_this);
	input w_enable, clock;
	output reg[3:0] digit_select;
	output reg[6:0] write_this;
	
	always@(posedge clock) begin
		if (w_enable == 1) begin // change to 0
		digit_select <= 4'b1110;
		write_this <= 7'b0000000;
		end else begin
		digit_select <= 4'b1110;
		write_this <= 7'b1111111;
		end
	end

endmodule
