module bcd_adder(Sum, A, B, Cin);
    input [7:0] A, B;
    input Cin;
    output [7:0] Sum;
  
    wire [3:0] C1, C2, C3, C4;
    wire [7:0] S1, S2, S3;

and G1(S1[0], A[0], B[0]);
and G2(S1[1], A[1], B[1]);
and G3(S1[2], A[2], B[2]);
and G4(S1[3], A[3], B[3]);
and G5(S1[4], A[4], B[4]);
and G6(S1[5], A[5], B[5]);
and G7(S1[6], A[6], B[6]);
and G8(S1[7], A[7], B[7]);

xor X1(S2[0], S1[0], Cin);
xor X2(S2[1], S1[1], C1[0]);
xor X3(S2[2], S1[2], C2[0]);
xor X4(S2[3], S1[3], C3[0]);
xor X5(S2[4], S1[4], C4[0]);
xor X6(S2[5], S1[5], C1[1]);
xor X7(S2[6], S1[6], C2[1]);
xor X8(S2[7], S1[7], C3[1]);

and G9(C4[0], S1[0], Cin);
and G10(C4[1], S1[4], C1[0]);
and G11(C4[2], S1[5], C2[0]);
and G12(C4[3], S1[6], C3[0]);

and G13(C3[0], S1[3], C4);
and G14(C3[1], S1[7]);

  and G15(C2[0], S1[2], C4[0]);
  and G16(C1[1], S1[8], C3[0]);

  or O(Sum, S2, C4);

endmodule

module test_bcd_adder;
    reg [7:0] A, B, Cin;
    wire [7:0] Sum;

    
  bcd_adder BCD_Adder(Sum,A,B,Cin);

    
    initial begin
        A = 8'b01100100;  // BCD representation of 100
        B = 8'b00010001;  // BCD representation of 17
    end 
  initial
        
    $monitor("A=%d, B=%d", A, B);
endmodule