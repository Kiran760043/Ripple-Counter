//////////////////////////////////////////////////////////////////////////////////
// Design: Test bench for Ripple Counter
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module test_ripple_counter( );

  parameter N = 4;
  //inputs for DUT
  reg clk, rst;
  //outputs for DUt
  wire [N-1:0] up;
  wire [N-1:0] down;

  ripple_counter DUT (.clk(clk), .rst(rst), .upcount(up), .downcount(down));

  initial
        begin
            $display($time, " << Simulation Results >>");
            $monitor($time, "clk = %b, rst = %b, upcount = %b, downcount =%b", clk, rst, up, down);
        end

  always #10 clk = ~clk;

  initial begin
    clk = 1;
    rst = 1;

    #5 rst = 1;
	#20 rst = 0;
	#315 $finish;
  end


endmodule


//module tb_ripple;
//   reg clk;
//   reg rst;
//   wire [3:0] out;

//   ripple_counter r0   (  .clk (clk),
//                  .rst (rst),
//                  .out (out));

//   always #5 clk = ~clk;

//   initial begin
//      rst <= 0;
//      clk <= 0;

//      repeat (4) @ (posedge clk);
//      rst <= 1;

//      repeat (25) @ (posedge clk);
//      $finish;
//   end
//endmodule
