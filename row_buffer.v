`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:50:18 12/11/2018 
// Design Name: 
// Module Name:    row_buffer 
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
module row_buffer(pixel_in,three_out,clk, reset);
	// Fifo queue 3 pixels wide
	input[7:0] pixel_in;
	input clk, reset;
	output reg [23:0] three_out;
	reg [23:0] row_next;
	reg [7:0] hold_pixel_out;
	
	always@(posedge clk or posedge reset) begin
		if (reset) begin
			row_next <= 0;
		end else begin
			row_next[23:16] <= three_out[15:8];
			row_next[15:8] <= three_out[7:0];
			row_next[7:0] <= pixel_in;
		end
	end
	
	always@(*) begin
		three_out <= row_next;
	end
	
endmodule
