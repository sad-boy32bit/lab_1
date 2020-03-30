`timescale 1ns / 1ps



module hex_test_tb(

);

reg [9:0] sw;
wire [9:0] led;
wire [6:0] hex;
wire [3:0] hex_on;


hex_test DUT (
.sw (sw),
.led (led),
.hex (hex),
.hex_on (hex_on)
);

initial begin
sw[9:0] = 10'b0;
forever begin
#1 sw[9:0] = sw[9:0] +1'b1;
end
end


endmodule