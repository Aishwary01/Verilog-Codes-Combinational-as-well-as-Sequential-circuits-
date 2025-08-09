module seq_det_1000(y,A,clk,rst);
  input A,clk,rst;
  output reg y;
  
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;
  parameter S4 = 2'b00;
  
  reg [1:0] state, next_state;
  
  ///////////Seq. block code////////
  always@(posedge clk) begin
    if(!rst)
      state <= S0;
    else
      state <= next_state;
  end
  
  ////////////Comb. block code////////////////
  always@(A or state) begin
    case(state)
      S0:
        begin
          if(A == 0)
            next_state = S0;
          else
            next_state = S1;
        end
      
      S1:
        begin
          if(A == 0)
            next_state = S2;
          else
            next_state = S1;
        end
      
      S2:
        begin
          if(A == 0)
            next_state = S3;
          else
            next_state = S1;
        end
      
      S3:
        begin
          if(A == 0)
            next_state = S4;
          else
            next_state = S1;
        end
      
      S4:
        begin
          if(A == 0)
            next_state = S0;
          else
            next_state = S1;
        end
      
      default:
        begin
          next_state = S0;
        end
    endcase
  end
  
  ////////////////Output block code///////////////
  always@(posedge clk) begin
    if(!rst)
      y <= 0;
    else
      case(state)
        S0:
          y <= 0;
        S1:
          y <= 0;
        S2:
          y <= 0;
        S3:
          y <= 0;
        S4:
          y <= 1;
   default:
          y <= 0;
      endcase
  end
endmodule

////////////////////Testbench Code?/////////////

module tb_seq_det_1000();
  reg A,clk,rst;
  wire y;
  
  seq_det_1000 dut(y,A,clk,rst);
  
  always #5 clk = ~clk;
  
  initial begin
    A = 0;
    clk = 0;
    rst = 0;
    #20
    rst = 1;
    clk = 0;
    @(posedge clk)
    A = 0;
    @(posedge clk)
    A = 1;
    @(posedge clk)
    A = 0;
    @(posedge clk)
    A = 1;
  end
  
  initial begin
    $monitor($time,"\t A = %0d, clk = %0d, rst = %0d",A,clk,rst);
    #100;
    $finish();
  end
  
endmodule