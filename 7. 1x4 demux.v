module demux1_to_4(y0,y1,y2,y3,d,s0,s1);

    input d,s0,s1;
    output y0,y1,y2,y3;
     
    wire w1,w2;
  
  not not1(w1,s1),(w2,s0);
  and and1(y0,d,w2,w1),(y1,d,s0,w1),(y2,d,w2,s1),(y3,d,s0,s1);
  
endmodule

module tb_demux1_to_4;
  
  reg d,s0,s1;
  wire  y0,y1,y2,y3;

    
  demux1_to_4 demux(y0,y1,y2,y3,d,s0,s1);

    
    initial begin
             d = 0;s0 = 0;s1 = 0;
        #10;d = 1;s0 = 1;s1 = 0;
        #10;d = 1;s0 = 0;s1 = 1;
        #10;d = 1;s0 = 1;s1 = 1;
    end 
  initial
        
    $monitor($time,"\t, d=%b, s0=%b, s1=%b,",d,s0,s1);
endmodule