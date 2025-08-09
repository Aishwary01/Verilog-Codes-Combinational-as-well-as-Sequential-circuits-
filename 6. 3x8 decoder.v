module decoder3_to_8(d0,d1,d2,d3,d4,d5,d6,d7,x,y,z);
    input x,y,z;
    output d0,d1,d2,d3,d4,d5,d6,d7;
    
    wire xn,yn,zn;
  
    and and1(d0,xn,yn,zn),(d1,xn,yn,z),(d2,xn,y,zn),(d3,xn,y,z),(d4,x,yn,zn),                  (d5,x,yn,z),(d6,x,y,zn),(d7,x,y,z);
    not not1(xn,x),(yn,y),(zn,z);
  
endmodule

module tb_decoder3_to_8;
  
  reg x,y,z;
  wire [7:0] d0,d1,d2,d3,d4,d5,d6,d7;

    
  decoder3_to_8 decoder(d0,d1,d2,d3,d4,d5,d6,d7,x,y,z);

    
    initial begin
            x = 0;y = 0;z = 0;
        #10;x = 0;y = 0;z = 1;
        #10;x = 0;y = 1;z = 0;
        #10;x = 0;y = 1;z = 1;
        #10;x = 1;y = 0;z = 0;
        #10;x = 1;y = 0;z = 1;
        #10;x = 1;y = 1;z = 0;
        #10;x = 1;y = 1;z = 1;
    end 
  initial
        
    $monitor($time,"\t, x=%b, b=%b, z=%b,",x,y,z);
endmodule