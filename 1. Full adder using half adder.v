module half_adder(sum,carry,A,B);
    input A, B;
    output sum, carry;

    assign sum = A ^ B;
    assign carry = A & B;
endmodule

module full_adder(sum,Cout,A,B,Cin);
    input A, B, Cin;
    output sum, Cout;

    wire w1, w2, w3;

  half_adder HA1(A,B,w1,w2);
  half_adder HA2(w1,Cin,sum,w3);

    assign Cout = w1 | w2;
endmodule

module test_full_adder;
    reg A, B, Cin;
    wire sum, Cout;
  
  full_adder FA(sum,Cout,A,B,Cin);
    
    initial begin
         A = 0;B = 0;Cin = 0;
      #5 A = 0;B = 1;Cin = 0;
      #5  A = 1;B = 0;Cin = 1;
      #5 A = 1;B = 1;Cin = 1;
    end
  initial
    $monitor($time,"\t, A=%b, B=%b, Cin=%b", A, B, Cin);
endmodule
