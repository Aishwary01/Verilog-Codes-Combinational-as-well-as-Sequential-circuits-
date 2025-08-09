module half_subtractor(Borrow,Difference,A,B);
  input A,B;
  output Difference,Borrow;
  
  xor xor1(Difference, A, B);
  and and1(Borrow, A, B);
  
endmodule

module tb_half_subtractor;
    reg A, B;
    wire Difference, Borrow;

  half_subtractor HS(Difference,Borrow,A,B);
    
    initial begin
          A = 0;B = 0;
     #5   A = 0;B = 1;
     #5   A = 1;B = 0;
     #5   A = 1;B = 1;
    end
    
  initial 
      $monitor($time,"\t, A=%b, B=%b, Difference=%b, Borrow=%b", A, B, Difference, Borrow);
   
endmodule
