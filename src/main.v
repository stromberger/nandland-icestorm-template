module main
  (input i_Clk,
   input  i_Switch_1,
   input  i_Switch_2,
   input  i_Switch_3,
   input  i_Switch_4,
   output o_LED_1,
   output o_LED_2,
   output o_LED_3,
   output o_LED_4);

   Blinker blinker
     (.clock(i_Clk),
      .switch(o_LED_1));
          
endmodule
