`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2024 20:32:40
// Design Name: 
// Module Name: traffic_light_controller
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


module traffic_light_controller(
output M1,M2,Mt,S,
input clk,reset
 );
reg [2:0] M1,M2,Mt,S;
parameter S1=0,S2=1,S3=2,S4=3,S5=4,S6=5;
parameter Tm1=7,Ty=2,Tmt=5,Ts=4;
reg [2:0]present_state;
integer count;
always @(posedge clk or posedge reset)
if(reset==1)
    begin
    present_state<=S1;
    count<=0;
    end
else
    begin
    case(present_state)
        S1:if(count<Tm1)
            begin
            count<=count+1;
            end
           else
            begin
            present_state<=S2;
            count<=0;
            end
        S2:if(count<Ty)
            begin
            count<=count+1;
            end
           else
            begin
            present_state<=S3;
            count<=0;
            end
        S3:if(count<Tmt)
            begin
            count<=count+1;
            end
           else
            begin
            present_state<=S4;
            count<=0;
            end
        S4:if(count<Ty)
            begin
            count<=count+1;
            end
           else
            begin
            present_state<=S5;
            count<=0;
            end
        S5:if(count<Ts)
            begin
            count<=count+1;
            end
           else
            begin
            present_state<=S6;
            count<=0;
            end
        S6:if(count<Ty)
            begin
            count<=count+1;
            end
           else
            begin
            present_state<=S1;
            count<=0;
            end
        default:present_state<=S1;
    endcase
    end
always@(present_state)
begin
    case(present_state)
    S1:
    begin
        M1<=3'b100;
        M2<=3'b100;
        Mt<=3'b001;
        S <=3'b001;
    end
    S2:
    begin
        M1<=3'b100;
        M2<=3'b010;
        Mt<=3'b001;
        S <=3'b001;
    end
    S3:
    begin
        M1<=3'b100;
        M2<=3'b001;
        Mt<=3'b100;
        S <=3'b001;
    end
    S4:
    begin
        M1<=3'b010;
        M2<=3'b001;
        Mt<=3'b010;
        S <=3'b001;
    end
    S5:
    begin
        M1<=3'b001;
        M2<=3'b001;
        Mt<=3'b001;
        S <=3'b100;
    end
    S6:
    begin
        M1<=3'b001;
        M2<=3'b001;
        Mt<=3'b001;
        S <=3'b010;
    end
    endcase
end
endmodule
