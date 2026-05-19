`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2026 20:15:01
// Design Name: 
// Module Name: mehak_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mehak_testbench(

    );reg [7:0] D;
    reg [2:0] S;
    wire      W_n;
 
    mehak_behaviour M1 (
        .D  (D),
        .S  (S),
        .W_n(W_n)
    );
 
    initial begin
 
        D = 8'b10110100;  
 
        S = 3'b000; #100;
        S = 3'b001; #100;
        S = 3'b010; #100;
        S = 3'b011; #100;
        S = 3'b100; #100;
        S = 3'b101; #100;
        S = 3'b110; #100;
        S = 3'b111; #100;
 
        $finish;
    end
endmodule
