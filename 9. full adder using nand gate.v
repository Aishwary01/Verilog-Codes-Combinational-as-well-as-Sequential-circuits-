module full_adder_nand(sum,cout,a,b,cin);
    input a,b,cin;
   output sum,cout;
  
  wire w1, w2, w3;
 
  nand n1(w1, a, b);
  nand n2(w2, a, cin);
  nand n3(w3, b, cin);
  nand n4(s, w1, w2);
  nand n5(cout, w1, w3);
  
endmodule

module tb_full_adder_nand;
  
  reg a,b,cin;
  wire  sum,cout;

  full_adder_nand fa(sum,cout,a,b,cin);

    
    initial begin
            a = 0;b = 0;cin = 0;
        #10;a = 0;b = 1;cin = 0;
        #10;a = 1;b = 0;cin = 1;
        #10;a = 1;b = 1;cin = 1;
    end 
  initial
        
    $monitor($time,"\t, a=%b, b=%b, cin=%b,",a,b,cin);
endmodule