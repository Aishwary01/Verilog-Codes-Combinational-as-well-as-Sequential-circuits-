/////////////Design Code//////////////////////////////

//////////  For 1010 /////////////////////
module seq_det_1010(y,A,clk,rst);
  input A,clk,rst;
  output reg y;
  
  parameter S0 = 2'b00;
            S1 = 2'b01;
            S2 = 2'b10;
            S3 = 2'b11;
  
  
  reg [1:0] state,next_state;
  
  ////////////Seq. block code////////////
  always@( posedge clk) begin
    if(!rst)
      state <= S0;
    else
      state <= next_state;
  end
  
  ////////////Comb. block code///////////
  always@( A or state) begin
    case(state)
      S0:
        begin
          if (A == 0)
            next_state = S0;
          else
            next_state = S1;
        end
      
      S1:
        begin
          if (A == 0)
            next_state = S2;
          else
            next_state = S1;
        end
      
      S2:
        begin
          if(A == 0)
            next_state = S0;
          else
            next_state = S3;
        end
      
      S3:
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
  
  ////////////Output block Code///////////////////
  
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
          begin
            // if (A == 0)
          y <= 1;
         // else
            // y <= 0;
          end
        
        default:
           y <= 0;
      endcase
  end
endmodule


//////////////////////Testbench Code///////////////////

module tb_seq_det_1010;
  reg A,clk,rst;
  wire y;
  
  seq_det_1010 dut(.y(y), .A(A), .clk(clk), .rst(rst));
  
  always #5 clk = ~clk;
  
  initial begin
    $monitor($time," \t A = %b,y = %b",A,y);
    
    A = 0;
    rst = 0;
    clk = 0;
    
    #50 rst = 1;
    @(posedge clk);
       A = 1;
     @(posedge clk);
       A = 0;
     @(posedge clk);
       A = 1;
     @(posedge clk);
       A = 0;
     @(posedge clk);
       A = 1;
     @(posedge clk);
       A = 0;
     @(posedge clk);
       A = 1;
     @(posedge clk);
       A = 0;
     @(posedge clk);
       A = 1;
     @(posedge clk);
       A = 0;
  end
  
  initial begin
    if(y == 1)
      $display($time,"Pattern Detected");
  end
  
  initial
    #200 $finish();
  
  
endmodule