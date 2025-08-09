//////////////Desing Code/////////////

module mux_32to1(out,a,sel); 
  input [31:0] a;
  input [4:0] sel;
  output reg out;

  always @ (*) begin
    if (sel == 5'b00000) out = a[0];
    else if (sel == 5'b00001) out = a[1];
    else if (sel == 5'b00010) out = a[2];
    else if (sel == 5'b00011) out = a[3];
    // ... and so on for the remaining cases
    else if (sel == 5'b11110) out = a[30];
    else if (sel == 5'b11111) out = a[31];
    else out = 1'bx; 
  end
endmodule

///////////Testbench Code////////////////

module tb_mux_32to1;
  reg [31:0] a;
  reg [4:0] sel;
  wire out;
  
  mux_32to1 mux32(out,a,sel);
  
  
  initial begin
    a[0] = 32'haaaaaa;
    a[1] = 32'hbbbbbb;
    a[31] = 32'hcccccc; 
    ///////
    sel = 5'b00000;
    sel = 5'b00001;
    sel = 5'b10001;
    sel = 5'b11111;
    
    $monitor( "out = %h, sel = %b, a = %b", out,sel,a);
    
  end 
  initial 
    #50 $finish;
  
endmodule 