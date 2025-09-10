// Name: Caiya Coggshall
// Email: caiyacoggshall@gmail.com
// Date: 9/6/25
// Summary of Purpose: This is the test bench for my lab2_cc.sv module and tests the combinational LED logic using a for loop.

`timescale 1ns/1ns // 5 ns with 1 ns precision on waveform

module lab2_cc_testbench();
	logic clk, reset;
	logic [6:0] seg;
	logic [1:0] enable;
	logic [4:0] led;
	logic [7:0] scounttop;

	
	//instantiating device under test (DUT) , input: counter as s2 , output: led & seg
	lab2_cc dut(reset, scounttop, seg, enable, led);

	// //Generate clk
	always
		begin
			clk = 1; #5;
			clk = 0; #5;
		end

	// //initial only used in TB simulation
	initial
		begin	
			 // Pulse reset for 22 time units(2.2 cycles) so the reset
			  // signal falls after a clk edge.
			reset = 0; #22;
			reset = 1;
			  //we have a low reset so flipped from previous e85 TB's		
			
			for (scounttop=0; scounttop <'d255; scounttop++) #200000; // the #200000 allows us to see the enable switching
				begin
				assert (led == scounttop[3:0] + scounttop[7:4]) else $error("Combinational LED logic is wrong!"); #20;
			end
		end


endmodule
			