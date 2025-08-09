////////////////Design Code//////////////////

////////For 1011 Melay /////////////////
module seq_det_1011(y,A,clk,rst);
  input A,clk,rst;
  output reg y;
  
  parameter S0 = 2'b00;
            S1 = 2'b01;
            S2 = 2'b10;
            S3 = 2'b11;
  
  reg [1:0] state,next_state;
  
  //////////////Seq. block code/////////////
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
            next_state = S0;
          else
            next_state = S3;
        end
      
      S3:
        begin
          if(A == 0)
            next_state = S2;
          else
            next_state = S1;
        end
      
      default:
        begin
          next_state = S0;
        end
    endcase
  end
  
  ////////////Output block code////////////////
  
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
          y <= 1;
        
        default:
        y <= 0;
      endcase
  end
endmodule