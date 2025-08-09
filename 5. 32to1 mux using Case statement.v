////////////Design code/////////////////

module mux_32to1(out,a,sel); 
  input [31:0] a;
  input [4:0] sel;
  output reg out;

  always @(*) begin
//always @ (a or sel) begin
  case (sel)
    5'b00000 : out = a[0];
    5'b00001 : out = a[1];
    5'b00010 : out = a[2];
    5'b00011 : out = a[3];
            5'b00100: out = a[4];
            5'b00101: out = a[5];
            5'b00110: out = a[6];
            5'b00111: out = a[7];
            5'b01000: out = a[8];
            5'b01001: out = a[9];
            5'b01010: out = a[10];
            5'b01011: out = a[11];
            5'b01100: out = a[12];
            5'b01101: out = a[13];
            5'b01110: out = a[14];
            5'b01111: out = a[15];
            5'b10000: out = a[16];
            5'b10001: out = a[17];
            5'b10010: out = a[18];
            5'b10011: out = a[19];
            5'b10100: out = a[20];
            5'b10101: out = a[21];
            5'b10110: out = a[22];
            5'b10111: out = a[23];
            5'b11000: out = a[24];
            5'b11001: out = a[25];
            5'b11010: out = a[26];
            5'b11011: out = a[27];
            5'b11100: out = a[28];
            5'b11101: out = a[29];
            5'b11110: out = a[30];
    5'b11111 : out = a[31];
    default : out = 0;
  endcase
end

endmodule
//////////////////Testbench Code///////////////////


module tb_mux_32to1;
  reg [31:0] a;
  reg [4:0] sel;
  wire out;
  
  mux_32to1 mux32(out,a,sel);
  
  //always #5 clk = ~clk;
  
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