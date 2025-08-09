////////Design Code /////////////////////

module JK_ff(q,qb,j,k,clk);
  output reg q;
  output qb;
  input j,k,clk;
  
  always @(posedge clk) begin
    if (j == 0 && k == 1)
      q <= 1'b0;
    else if (j == 1 && k == 0)
      q <= 1'b1;
    else if (j == 1 && k == 1)
      q <= ~q;
  end 
      assign qb = ~q;
endmodule

//////////////Testbench Code//////////////////////

module tb_JK_ff;
  reg j,k,clk;
  wire q,qb;
  
  JK_ff JKff(q,qb,j,k,clk);
  
  always #5 clk = ~clk;
  
  initial begin
    $monitor($time, ", clk = %b, j = %b, k = %b, q = %b, qb = %b", clk,j,k,q,qb);
    
    clk = 0;
    
    j = 0;k = 0;  // no change 
    #10 j = 0;k = 1;  // reset
    #10 j = 1;k = 0;  // set
    #10 j = 1;k = 1;  // toggle
    
  //  $monitor($time, "CLK = %b, RST = %b, D = %b, Q = %b", CLK,RST,D,Q);
    
  end 
  initial 
    #150 $finish;
  
endmodule 