module counter(count,clk,rst);
  input rst,clk;
  output reg [7:0] count;
  
  always@(posedge clk)
    if(!rst)
      count <= 1'b0;
  else
    count <= count +1;
  
endmodule


//////////////////////////////////Testbench Code//////////////////////

module tb;
  reg rst,clk;
  wire [7:0] count;
  
  counter dut(count,clk,rst);
  
  always #5 clk = ~clk;
  
  initial begin
    rst = 0;
    clk = 0;
    #50;
    rst = 1;
    #10;
    rst = 0;
    
  end
  
  initial begin
    $monitor($time," rst : %0d, clk : %0d, count : %0d",rst,clk,count);
    #100 $finish();
  end
  
endmodule