/////////////////////////Design Code//////////////////////////

module mux_2x1(y,a,b,sel);
   input a,b,sel;
   output y;

assign y = sel ? a : b;

endmodule