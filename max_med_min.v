`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:21:05 12/11/2018 
// Design Name: 
// Module Name:    max_med_min 
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
module max_med_min(in0, in1, in2, max, med, min);
	input [7:0] in0, in1, in2;
	output reg[7:0] max, med, min;
	always@(*) begin
	if (in0 > in1 && in0 > in2) begin
		 max = in0;
		if (in1 > in2) begin
			 med = in1;
			 min = in2;
		end else begin
			 med = in2;
			 min = in1;
		end
	end else if (in1 > in2) begin
		 max = in1;
		if (in0 > in2) begin
			 med = in0;
			 min = in2;
		end else begin
			 med = in2;
			 min = in0;
		end
	end else begin
		 max = in2;
		if (in0 > in1) begin
			 med = in0;
			 min = in1;
		end else begin
			 med = in1;
			 min = in0;
		end
	end
	end

endmodule

