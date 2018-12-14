`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:12:40 12/10/2018 
// Design Name: 
// Module Name:    locater 
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
module locater(clk, receiver_enable, tx_ready, reset, row, col, row_lag, col_lag, w_enable);
	input clk, receiver_enable, reset, tx_ready;
	output reg [5:0] row, col;
	output reg w_enable;
	
	reg w_enable_next;
	reg[5:0] row_next, col_next;
	output reg[5:0] row_lag, col_lag;
	
//	always@(posedge reset) begin
//		row_next <= 0;
//		col_next <= 0;
//		w_enable_next <= 1;
//	end
//	
//	always@(posedge receiver_enable) begin
//		if (row == 63 && col == 63) begin
//			row_next <= 0;
//			col_next <= 0;
//			w_enable_next <= 0;
//		end else if (col == 63) begin
//			row_next <= row_next + 1;
//			col_next <= 0;
//			w_enable_next <= w_enable_next;
//		end else begin
//			row_next <= row_next;
//			col_next <= col_next + 1;
//			w_enable_next <= w_enable_next;
//		end
//	end
//		
//	always@(*) begin
//		row <= row_next;
//		col <= col_next;
//		w_enable <= w_enable_next;
//	end
	always@(posedge receiver_enable) begin
		if (reset) begin
			row <= 0;
			col <= 0;
			w_enable <= 0;
		end else begin
			if (row == 63 && col == 63) begin // 63 63
				row <= 0;
				col <= 0;
				w_enable <= 1;
			end else if (col == 63) begin
				row <= row + 1;
				col <= 0;
				w_enable <= w_enable;
			end else begin
				row <= row;
				col <= col + 1;
				w_enable <= w_enable;
			end
//		end else begin
//			row <= row;
//			col <= col;
//			w_enable <= w_enable; // Change this back to w_enable <= w_enable. Just testing
		end
	end

endmodule
