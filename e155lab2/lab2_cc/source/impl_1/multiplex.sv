// Name: Caiya Coggshall
// Email: caiyacoggshall@gmail.com
// Date: 9/5/25
// Summary of Purpose: This is the multiplexer module that determines the enable pin logic based on the clock i.e. when the left and right displays on the dual seven 
// segment display is being powered. A mux is also established in the counter to determine whether the input pins for the left or the right display get sent to the
// seven_seg_display.sv code. 

module multiplex(input logic reset,
				 input 	 logic clk,
			    input	 logic [7:0] s2,
				output  logic [3:0] s,
			    output logic [1:0] enable
				 );  
	
   logic [31:0] counter;

	// Counter
   always_ff @(posedge clk, negedge reset) begin
		if (reset == 0) begin
			counter <= 0;
			// So that the when reset is pressed the display shows "0" and not whatever number the input pins are on
			s = 0;
		end
		else begin
			// a mux to choose the first 4 bits or last 4 bits of s2 based on the switching speed of counter bit 17 (18 works too)
			// I also ~ my s2 values so that the DIP switches turn on when they are at ON instead of the other way around
			s = counter[17] ? s2[7:4] : s2[3:0];
		    counter <= counter + 1;
		end
	end
   
   // Telling the enable GPIO pin which gate to power
   // When one display is on, the other one shouldn't be which is why it's ~ the same bit
   assign enable[1] = counter[17];
   assign enable[0] = ~counter[17];
   
 endmodule
   