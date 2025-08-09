module mux_8x1(out,D0, D1, D2, D3, D4, D5, D6, D7, S0, S1, S2);
    input D0, D1, D2, D3, D4, D5, D6, D7, S0, S1, S2;
    output out;
  
    wire T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11;
  
    not not1(T1, S0);
    not not2(T2, S1);
    not not3(T3, S2);
    and and1(T4, D0, T1, T2, T3), (T5, D1, S0, T2, T3);
    and and2(T6, D2, T1, S1, T3), (T7, D3, S0, S1, T3);
    and and3(T8, D4, T1, T2, S2), (T9, D5, S0, T2, S2);
    and and4(T10, D6, T1, S1, S2), (T11, D7, S0, S1, S2);
    or or1(out, T4, T5, T6, T7, T8, T9, T10, T11);
  
endmodule

module tb_mux_8x1;
  reg [7:0] D0, D1, D2, D3, D4, D5, D6, D7, S0, S1, S2;
  wire [7:0] out;

    
  mux_8x1 mux(out,D0, D1, D2, D3, D4, D5, D6, D7, S0, S1, S2);

    
    initial begin
        D0 = 8'b00000001;
        D1 = 8'b00000010;
        D2 = 8'b00000100;
        D3 = 8'b00001000;
        D4 = 8'b00010000;
        D5 = 8'b00100000;
        D6 = 8'b01000000;
        D7 = 8'b10000000;
    end 
  initial
        
    $monitor("\t D0=%d, D1=%d, D2=%d, D3=%d, D4=%d, D5=%d, D6=%d, D7=%d", D0,D1,D2,D3,D4,D5,D6,D7);
endmodule