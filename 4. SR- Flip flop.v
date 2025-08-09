///////////Design code///////////////////////////////////

module SR_ff(q,qb,s,r,clk);
  output reg q,qb;
  //output qb;
  input s,r,clk;
  
  always @(posedge clk) begin
    if(s == 1)
      begin
      q <= 1'b1;
      qb <= 0;
      end
    else if (r == 1)
      begin
      q <= 1'b0;
      qb <= 1;
      end
    else if (s == 0 & r == 0)
      begin
        q <= q;
        qb <= qb;
      end
  end 
      //assign qb = ~q;
endmodule

/////////////////////////
///////////////Testbench Code//////////////////////////

module tb_SR_ff;
  reg s,r,clk;
  wire q,qb;
  
  SR_ff SRff(q,qb,s,r,clk);
  
  always #5 clk = ~clk;
  
  initial begin
    $monitor($time, ", clk = %b, s = %b, r = %b, q = %b, qb = %b", clk,s,r,q,qb);
    
    clk = 0;
    //rst = 0;
    
    s = 0;r = 0;  // no change 
    #10 s = 0;r = 1;  // reset
    #15 s = 1;r = 0;  // set
    #20 s = 1;r = 1;  // toggle
    
  //  $monitor($time, "CLK = %b, RST = %b, D = %b, Q = %b", CLK,RST,D,Q);
    
  end 
  initial 
    #50 $finish;
  
endmodule 