module xor_using_nand (z,x,y);
    input x,y;
    output z;
  
    wire w1, w2, w3;
  
    nand nand1(w1, x, y);
    nand nand2(w2, x, w1);
    nand nand3(w3, y, w1);
    nand nand4(z, w2, w3);
  
endmodule

module tb_xor_using_nand;
  
  reg x,y;
  wire  z;

    
  xor_using_nand xn(z,x,y);

    
    initial begin
            x = 0;y = 0;
        #10;x = 0;y = 1;
        #10;x = 1;y = 0;
        #10;x = 1;y = 1;
    end 
  initial
        
    $monitor($time,"\t, x=%b, y=%b,",x,y);
endmodule