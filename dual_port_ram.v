`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2025 21:00:27
// Design Name: 
// Module Name: dual_port_ram
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


module dual_port_ram(
    input wire clk,
    input wire we_a,
    input wire [7:0] addr_a,
    input wire [7:0] din_a,
    output reg [7:0] dout_a,
    input wire we_b,
    input wire [7:0] addr_b,
    input wire [7:0] din_b,
    output reg [7:0] dout_b
);

    reg [7:0] mem [0:255];

    always @(posedge clk) begin //Port A
        if (we_a) begin
            mem[addr_a] <= din_a;
        end
        dout_a <= mem[addr_a];
    end

    always @(posedge clk) begin //Port B
        if (we_b) begin
            mem[addr_b] <= din_b;
        end
        dout_b <= mem[addr_b];
    end

endmodule

