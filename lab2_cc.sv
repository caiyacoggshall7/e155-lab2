// Name: Caiya Coggshall
// Email: caiyacoggshall@gmail.com
// Date: 9/5/25
// Summary of Purpose: This is the top level module for lab 2: time-multiplexed 7-segment display. So this is where it calls on the multiplex.sv file to choose which DIP switch
// input to send and then the seven_seg_display.sv file to actually display that input. This is also where I define the Combinational LED logic to add the two DIP switch inputs together.


module lab2_cc( input logic reset, 
				input	 logic [7:0] s2,
			    output  logic [6:0] seg,
			    output logic [1:0] enable,
				output logic [4:0] led
				 );
   // Defining Internal Variables
   logic clk;
   logic [3:0] s;
  
   // Internal high-speed oscillator
   HSOSC #(.CLKHF_DIV(2'b01)) 
         hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk));
  
	// Now to call on my multiplex file
	multiplex mp(reset, clk, s2, s, enable);
   
   // Now to call on seven segment display from Lab 1
   seven_seg_display ssd(s, seg);
  
   // Combinational LED logic to add the two display numbers together in binary for the led variable
   assign led[4:0] = s2[7:4] + s2[3:0];

  
endmodule
		
		