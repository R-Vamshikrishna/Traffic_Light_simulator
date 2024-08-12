`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2024 21:23:44
// Design Name: 
// Module Name: traffic_light_controller_tb
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


module traffic_light_controller_tb;
reg clk,reset;
wire [2:0]M1;
wire [2:0]M2;
wire [2:0]Mt;
wire [2:0]S;
traffic_light_controller TLC(M1,M2,Mt,S,clk,reset);
initial
begin
    clk=1'b0;
end
always
begin
#(5)clk=~clk;
end
initial
begin
    reset=0;
    #10;
    reset=1;
    #10;
    reset=0;
    #(1000) $finish;
    
end
endmodule
