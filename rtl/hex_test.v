`timescale 1ns / 1ps


// объ€вл€ем модуль hex_test
module hex_test(
input [9:0] sw, // 10-ти разр€дный вход
output [9:0] led, // 10-ти разр€дный вход
output reg [6:0] hex, // 7-ми сегментник
output [7:0] hex_on // включенные табло
);

wire [3:0] dc1;
wire [3:0] dc2;
wire[1:0] multi;


reg [3:0] dc1_out;
reg [3:0] dc2_out;
reg [3:0] func_out;
reg [3:0] dc_dec;

assign hex_on = 8'b1111_1110; // непрерывное присваивание
assign led = sw; // присваивание лампочкам вкл/выкл
assign dc1 = sw[3:0];
assign dc2 = sw[7:4];
assign multi = sw[9:8];


// DC1
always @(*) begin
dc1_out=!sw[0]+!sw[1]+!sw[2]+!sw[3];
end
// DC2
always @(*) begin
dc2_out=dc2||4'b0101;
end
// F
always @(*) begin
func_out=sw[0]||(sw[1]^(sw[2]*sw[3]));
end


always @(*) begin
case (multi)
2'd0 : dc_dec = dc1_out;
2'd1 : dc_dec = dc2_out;
2'd2 : dc_dec = func_out;
2'd3 : dc_dec = dc1;
endcase
end

// DC-DEC
always @(*) begin
case (dc_dec)
4'd0 : hex = 7'b100_0000;
4'd1 : hex = 7'b111_1001;
4'd2 : hex = 7'b010_0100;
4'd3 : hex = 7'b011_0000;
4'd4 : hex = 7'b001_1001;
4'd5 : hex = 7'b001_0010;
4'd6 : hex = 7'b000_0010;
4'd7 : hex = 7'b111_1000;
4'd8 : hex = 7'b000_0000;
4'd9 : hex = 7'b001_0000;
4'd10 : hex = 7'b000_1000;
4'd11 : hex = 7'b011_0000;
4'd12 : hex = 7'b000_0011;
4'd13 : hex = 7'b010_0001;
4'd14 : hex = 7'b000_0110;
4'd15 : hex = 7'b000_1110;
endcase
end

// конец
endmodule