module mux2_1_nor (Y, D0, D1, S);
  output Y;
  input D0, D1, S;
  
  wire w1, w2,w3;
  
  and a1(w1, D1, S);
  and a2(w2, D0, w3);
  not n1(w3, S);
  or o1(Y, w1, w2);
  
endmodule


module tb_mux2_1_nor;
  
  reg D0,D1,S;
  wire  Y;

  mux2_1_nor mux(Y,D0,D1,S);

    
    initial begin
            D0 = 0;D1 = 0;S = 0;
        #10;D0 = 0;D1 = 1;S = 0;
        #10;D0 = 1;D1 = 0;S = 1;
        #10;D0 = 1;D1 = 1;S = 1;
    end 
  initial
        
    $monitor($time,"\t, D0=%b, D1=%b, S=%b,",D0,D1,S);
endmodule