/////////Design code////////////////////

module T_ff(q,qb,t,rst,clk);
  output reg q;
  output qb;
  input t,rst,clk;
  
  always @(posedge clk) begin
    if(!rst)
      q <= 1'b0;
    else
      q <= t;
  end 
      assign qb = ~q;
endmodule

/////////Testbench code////////////////////

module tb_T_ff;
  reg t,rst,clk;
  wire q,qb;
  
  T_ff Tff(q,qb,t,rst,clk);
  
  always #5 clk = ~clk;
  
  initial begin
    $monitor($time, ", clk = %b, t = %b, rst = %b, q = %b, qb = %b", clk,t,rst,q,qb);
    
    clk = 0;
    rst = 0;
    
    t = 0;  // no change 
    #10 t = 1;  // reset
    #20 t = 0;  // set
    #30 t = 1;  // toggle
    
  //  $monitor($time, "CLK = %b, RST = %b, D = %b, Q = %b", CLK,RST,D,Q);
    
  end 
  initial 
    #80 $finish;
  
endmodule 