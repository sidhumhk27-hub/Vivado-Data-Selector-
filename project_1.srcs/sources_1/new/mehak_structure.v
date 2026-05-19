`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2026 20:16:56
// Design Name: 
// Module Name: mehak_structure
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


module mehak_structural(
    input  D0, D1, D2, D3,
    input  D4, D5, D6, D7,
    input  A, B, C,
    output W_n
    );
 
    (* KEEP = "TRUE" *) wire A_inv, B_inv, C_inv;
    (* KEEP = "TRUE" *) wire y0, y1, y2, y3, y4, y5, y6, y7;
 
    // Stage 1: Invert select lines
    not (A_inv, A);
    not (B_inv, B);
    not (C_inv, C);
 
    // Stage 2+3: AND each data input with its minterm
    and (y0, D0, C_inv, B_inv, A_inv);  // S=000
    and (y1, D1, C_inv, B_inv, A);      // S=001
    and (y2, D2, C_inv, B,     A_inv);  // S=010
    and (y3, D3, C_inv, B,     A);      // S=011
    and (y4, D4, C,     B_inv, A_inv);  // S=100
    and (y5, D5, C,     B_inv, A);      // S=101
    and (y6, D6, C,     B,     A_inv);  // S=110
    and (y7, D7, C,     B,     A);      // S=111
 
    // Stage 4+5: NOR = OR then invert = inverting output W_n
    nor (W_n, y0, y1, y2, y3, y4, y5, y6, y7);
 
endmodule