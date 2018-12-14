`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:34:22 12/10/2018
// Design Name:   top_direct_send
// Module Name:   X:/EC311/uart_test/top_direct_send_test.v
// Project Name:  uart_test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_direct_send
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_direct_send_test;

	// Inputs
	reg clk;
	reg rst;
	reg RsRx;

	// Outputs
	wire [7:0] Rx_data;
	wire RsTx;

	// Instantiate the Unit Under Test (UUT)
	top_direct_send uut (
		.clk(clk), 
		.rst(rst), 
		.RsRx(RsRx), 
		.Rx_data(Rx_data), 
		.RsTx(RsTx)
	);

	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		RsRx = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
		RsRx = 8'b10101010;
		
		#1000;
		RsRx = 8'b11000011;
		#1000;
		
        
		
		// Add stimulus here

	end
      
endmodule

