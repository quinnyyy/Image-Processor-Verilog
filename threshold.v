`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:04 12/05/2018 
// Design Name: 
// Module Name:    threshold 
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
module threshold(
    input [7:0] data_in,
	 input [7:0] threshold,
    output reg [7:0] data_out,
	 input ready
    );
	
	always@(*)begin
		if (ready == 0) begin
			if(data_in > threshold) begin
				data_out = 8'b11111111;
			end else begin
				data_out = 8'b00000000;
			end
		end
	end //always

endmodule

