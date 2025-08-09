////////////////////4X1 mux using Data flow////////////////

module mux_4x1(y,I,sel);
    input [3:0] I;
    input [1:0] sel;
    output y;

assign y = I[sel];

endmodule

//////////////////////4x1 mux using behavioral ////////////////////////////

module mux_4x1(y,I,sel);
  input [3:0] I;
  input [1:0] sel;
  output reg y;
  
  always@(*)
    case(sel)
      2'd0 : y = I[0];
      2'd1 : y = I[1];
      2'd2 : y = I[2];
      2'd3 : y = I[3];
      default : $display("error");
    endcase
endmodule