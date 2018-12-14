`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:57:53 12/10/2018 
// Design Name: 
// Module Name:    storage_new 
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
module storage_new(row, col, out_row, out_col, clk, w_enable, pixel_in, pixel_out, rx_ready, flag, reset, three_rows);
	input clk, w_enable, rx_ready, reset;
	input [5:0] row, col;
	input [7:0] pixel_in;
	
	output reg flag;
	reg [7:0] memory [4095:0]; //64 * 64
	output reg [7:0] pixel_out;
	output reg [5:0] out_row, out_col;
	output reg [23:0] three_rows;
	
	always@(posedge clk) begin
		//if (rx_ready && w_enable) begin
//		if (reset) begin
//			flag <= 0; //same as w_enable
//		end else if (row == 2) begin
//			memory[row*64 + col - 1] <= pixel_in;
//			pixel_out <= memory[row * 64 + col - 1];
//			flag <= 1;
//		end else begin
//			memory[row*64 + col - 1] <= pixel_in;
//			pixel_out <= memory[row * 64 + col - 1];
//			flag <= flag;
//		end
		if (reset || row == 0) begin
			flag <= 0;
		end else if (row == 2) begin
			flag <= 1;
		end else if (row == 63) begin
			flag <= 0;
		end else begin
			flag <= flag;
		end
		memory[row * 64 + col - 1] <= pixel_in;
		pixel_out <= memory[row * 64 + col - 1];
		
		three_rows[7:0] <= memory[(row - 2) * 64 + col - 1];
		three_rows[15:8] <= memory[(row - 1) * 64 + col - 1];
		three_rows[23:16] <= memory[(row) * 64 + col - 1];

//		cluster_out[71:64] <= memory[(row + 1) * 64 + col + 1 - 1];
//		cluster_out[63:56] <= memory[(row + 1) * 64 + col - 1];
//		cluster_out[55:48] <= memory[(row + 1) * 64 + col - 1- 1];
//		cluster_out[47:40] <= memory[(row) * 64 + col + 1 - 1];
//		cluster_out[39:32] <= memory[(row) * 64 + col - 1];
//		cluster_out[31:24] <= memory[(row) * 64 + col - 1 - 1];
//		cluster_out[23:16] <= memory[(row - 1) * 64 + col + 1- 1];
//		cluster_out[15:8] <= memory[(row - 1) * 64 + col - 1];
//		cluster_out[7:0] <= memory[(row - 1) * 64 + col - 1 - 1];

		
		//if (w_enable == 1) begin
		
		
		//end else begin
//		memory[row*64 + col - 1] <= pixel_in;
		//end 
		
		//end
	end
	

endmodule
