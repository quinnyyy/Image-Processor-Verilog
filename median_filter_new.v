`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:07:48 12/11/2018 
// Design Name: 
// Module Name:    median_filter_new 
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
module median_filter_new(window,median);
	input [71:0] window;
	output [7:0] median;
	
	wire [7:0] max1, med1, min1, max2, med2, min2, max3, med3, min3, min_second, med_second, max_second;
	
	max_med_min one_one(.in0(window[71:64]),.in1(window[63:56]),.in2(window[55:48]),.max(max1),.med(med1),.min(min1));
	max_med_min two_one(.in0(window[47:40]),.in1(window[39:32]),.in2(window[31:24]),.max(max2),.med(med2),.min(min2));
	max_med_min three_one(.in0(window[23:16]),.in1(window[15:8]),.in2(window[7:0]),.max(max3),.med(med3),.min(min3));
	
	max_med_min one_two(.in0(max1),.in1(max2),.in2(max3),.min(max_second));
	max_med_min two_two(.in0(med1),.in1(med2),.in2(med3),.med(med_second));
	max_med_min three_two(.in0(min1),.in1(min2),.in2(min3),.max(min_second));
	
	max_med_min two_three(.in0(max_second),.in1(med_second),.in2(min_second),.med(median));

endmodule