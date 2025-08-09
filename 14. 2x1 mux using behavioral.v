//////////////////////////////Design Code//////////////////////

module mux_2x1(y,a,b,sel);
    input a,b sel;
    output reg y;

always@(a or b or sel)
   if(sel)
     a  = 1'b0;
   else
     b = 1'b1;

endmodule



//////////////////////////////////////////////////////////////////

module mux_2x1(y,a,b,sel);
   input a,b,sel;
   output reg y;
   
   always@(*) begin
   if(sel == 1)
       y = a;
    else
	   y = b;
   end
   
endmodule