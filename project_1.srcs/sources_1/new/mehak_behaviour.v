`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2026 20:13:45
// Design Name: 
// Module Name: mehak_behaviour
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


module mehak_behaviour(
    input [7:0] D,
    input [2:0] S,
    output reg W_n
    );
     always @(*) begin
        case (S)
            3'd0 : W_n = ~D[0];
            3'd1 : W_n = ~D[1];
            3'd2 : W_n = ~D[2];
            3'd3 : W_n = ~D[3];
            3'd4 : W_n = ~D[4];
            3'd5 : W_n = ~D[5];
            3'd6 : W_n = ~D[6];
            3'd7 : W_n = ~D[7];
            default: W_n = 1'bx; 
            endcase
    end
endmodule
