module full_subtractor(Difference,BorrowOut,A,B,Borrow);
    input A, B, Borrow;
    output Difference, BorrowOut;
  
    wire w1,w2,w3;
  
  xor xor1(w1,A,B);
  xor xor2(Difference,w1,Borrow);
  and and1(w2,A,B);
  and and2(w3,w1,Borrow);
  or   or1(BorrowOut,w2,w3);
  
endmodule

module tb_full_subtractor;
    reg A, B, Borrow;
    wire Difference, BorrowOut;

  full_subtractor FS(Difference,BorrowOut,A,B,Borrow);
    
    initial begin
          A = 1;B = 0;Borrow = 0;
     #5   A = 0;B = 1;Borrow = 1;
     #5   A = 1;B = 1;Borrow = 0;
    end
    
  initial 
      $monitor($time,"\t, A=%b, B=%b, Borrow=%b, Difference=%b, BorrowOut=%b", A, B, Borrow, Difference, BorrowOut);
   
endmodule
