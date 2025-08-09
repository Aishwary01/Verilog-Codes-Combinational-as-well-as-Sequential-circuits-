/////////////////Design Code//////////

////////////Ring counter////////////////////
module ring_counter(dout,clk,start);
  input clk,start;
  output reg [1:0] dout;
  
  always@(posedge clk) begin
    if(start == 1'b0)
      dout <= 2'b10;
    else
      begin
        dout[1] <= dout[0];
        dout[0] <= dout[1];
      end
  end
endmodule

///////////////////Testbench code///////////////////////

module tb_ring_counter();
  reg clk,start;
  wire [1:0] dout;
  
  ring_counter dut(dout,clk,start);
  
  always #5 clk = ~clk;
  
  initial begin
   clk = 0;
    //rst = 0;
    @(posedge clk)
  #20  start = 1;
    @(posedge clk)
  #20  start = 0;
    @(posedge clk)
  #20 start = 1;  
  end
  
  initial begin
    $monitor($time,"\t clk = %0d, start = %0d, dout = %0d",clk,start,dout);
    #100 $finish();
  end
  
endmodule
  
  