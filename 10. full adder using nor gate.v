module full_adder_nor(sum,cout,a, b, cin);
  input a, b, cin;
  output sum, cout;
  
  wire w1, w2, w3;

  nor n1(w1, a, b);
  nor n2(w2, cin, w1);
  nor n3(w3, w1, w2);
  nor n4(sum, w3, w3);
  nor n5(cout, w1, w2);
  
endmodule


module tb_full_adder_nor;
  
  reg a,b,cin;
  wire  sum,cout;

  full_adder_nor fa(sum,cout,a,b,cin);

    
    initial begin
            a = 0;b = 0;cin = 0;
        #10;a = 0;b = 1;cin = 0;
        #10;a = 1;b = 0;cin = 1;
        #10;a = 1;b = 1;cin = 1;
    end 
  initial
        
    $monitor($time,"\t, a=%b, b=%b, cin=%b,",a,b,cin);
endmodule