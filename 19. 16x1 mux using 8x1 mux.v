//Verilog Code of 16:1 Mux using 8:1 Mux

module mux2to1(Y,A,B,S);
  input A,B,S;
  output Y;
  
  wire w1,w2,w3;

  not n1(w1,S);         // Invert select line S
  and a1(w2,A,w1);  // A AND ~S
  and a2(w3,B,S);    // B AND S
  or  o1(Y,w2,w3); // Y = (A AND ~S) OR (B AND S)
endmodule

module mux4to1(Y,A,B,C,D,S0,S1);
   input A,B,C,D;
   input S0,S1;
   output Y;
  
   wire Y0, Y1;

    // First 2:1 MUX for A and B
    mux2to1 mx1(Y0, A, B, S0);
    
    // Second 2:1 MUX for C and D
    mux2to1 mx2(Y1, C, D, S0);

    // Final 2:1 MUX to select between Y0 and Y1
    mux2to1 mx3(Y, Y0, Y1, S1);
endmodule

module mux8to1(Y,A,B,C,D,E,F,G,H,S0,S1,S2);
  input A,B,C,D,E,F,G,H;
  input S0,S1,S2;
  output Y;
  
  wire Y0, Y1;

    // First 4:1 MUX for A, B, C, D
    mux4to1 MUX1(Y0, A, B, C, D, S0, S1);

    // Second 4:1 MUX for E, F, G, H
    mux4to1 MUX2(Y1, E, F, G, H, S0, S1);

    // Final 2:1 MUX to select between Y0 and Y1
    mux2to1 MUX3(Y, Y0, Y1, S2);
endmodule

module mux16to1(Y,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,S0,S1,S2,S3);
  input A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P;
  input S0,S1,S2,S3;
  output Y;
  
  wire Y0, Y1;

    // First 8:1 MUX for A to H
    mux8to1 MUX1(Y0, A, B, C, D, E, F, G, H, S0, S1, S2);

    // Second 8:1 MUX for I to P
    mux8to1 MUX2(Y1, I, J, K, L, M, N, O, P, S0, S1, S2);

    // Final 2:1 MUX to select between Y0 and Y1
    mux2to1 MUX3(Y, Y0, Y1, S3);
endmodule


///////////////////////////////////Testbench Code/////////////////////////////////

module tb();
  reg A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P;
  reg S0,S1,S2,S3;
  wire Y;
  
  mux16to1 dut(Y,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,S0,S1,S2,S3);
  
  initial begin
    $display("S3 S2 S1 S0 | Y");
    $monitor(" %b %b %b %b | %b", S3, S2, S1, S0, Y);
     {A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P} = 16'b0000000000000001;
       S3 = 0; S2 = 0; S1 = 0; S0 = 0;
   #10 S3 = 0; S2 = 0; S1 = 0; S0 = 1;
   #10 S3 = 0; S2 = 0; S1 = 1; S0 = 0;
   #10 S3 = 0; S2 = 0; S1 = 1; S0 = 1;
   #10 S3 = 0; S2 = 1; S1 = 0; S0 = 0;
   #10 S3 = 0; S2 = 1; S1 = 0; S0 = 1;
   #10 S3 = 0; S2 = 1; S1 = 1; S0 = 0;
   #10 S3 = 0; S2 = 1; S1 = 1; S0 = 1;
   #10 S3 = 1; S2 = 0; S1 = 0; S0 = 0;
   #10 S3 = 1; S2 = 1; S1 = 1; S0 = 1;
   #200 $finish();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(2);
  end
  
endmodule