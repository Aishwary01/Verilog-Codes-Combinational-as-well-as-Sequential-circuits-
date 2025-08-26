module mod_10_counter(count,clk,rst);
  input rst,clk;
  output reg [3:0] count;
  
  always@(posedge clk)
    if(!rst || count == 9)
      count <= 4'b0000;
  else
    count <= count +1;
  
endmodule


////////////////////////////////Testbench Code///////////////

module tb;
  reg rst,clk;
  wire [3:0] count;
  
  mod_10_counter dut(count,clk,rst);
  
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
