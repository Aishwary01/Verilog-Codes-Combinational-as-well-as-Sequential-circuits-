////////////Desgin Code/////////

module d_ff(q,d,rst,clk);
  output reg q;
  input d,clk,rst;
  
  always @(posedge clk) begin
    if (!rst)
      q <= 1'b0;
    else 
      q <= d;
  end 
endmodule


///////////Testbench Code///////////////////

module tb_d_ff;
  reg D,RST,CLK;
  wire Q;
  
  d_ff dff(.q(Q),.d(D),.rst(RST),.clk(CLK));
  
  always #5 CLK = ~CLK;
  
  initial begin
    $monitor($time, "CLK = %b, RST = %b, D = %b, Q = %b", CLK,RST,D,Q);
    
    CLK = 0;
    RST = 0;
    
    D = 1;
    #10 D = 0;
    #25 D = 1;
    #10 D = 0;
    #27 D = 1;
    
  end 
  initial 
    #150 $finish;
endmodule 