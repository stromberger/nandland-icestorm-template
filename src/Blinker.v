module Blinker
  (input clock,
   output switch);

   parameter limit = 25000000;

   reg [34:0] counter = 0;
   reg 	      state = 1'b0;

   always @(posedge clock)
     begin 
	if (counter < limit)
	  counter <= counter + 1;
	else
	  begin
	     state <= !state;
	     counter <= 0;
	  end
     end

   assign switch = state;
      
endmodule // Blinker
