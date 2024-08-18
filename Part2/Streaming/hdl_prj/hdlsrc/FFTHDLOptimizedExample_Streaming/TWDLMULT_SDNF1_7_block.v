// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\FFTHDLOptimizedExample_Streaming\TWDLMULT_SDNF1_7_block.v
// Created: 2024-05-11 19:34:42
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: TWDLMULT_SDNF1_7_block
// Source Path: FFTHDLOptimizedExample_Streaming/FFT Streaming/FFT/TWDLMULT_SDNF1_7
// Hierarchy Level: 2
// Model version: 8.0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module TWDLMULT_SDNF1_7_block
          (clk,
           reset,
           dout_6_3_re,
           dout_6_3_im,
           dout_6_4_re,
           dout_6_4_im,
           dout_6_1_vld,
           twdl_7_3_re,
           twdl_7_3_im,
           twdl_7_4_re,
           twdl_7_4_im,
           twdlXdin_3_re,
           twdlXdin_3_im,
           twdlXdin_4_re,
           twdlXdin_4_im);


  input   clk;
  input   reset;
  input   signed [21:0] dout_6_3_re;  // sfix22_En13
  input   signed [21:0] dout_6_3_im;  // sfix22_En13
  input   signed [21:0] dout_6_4_re;  // sfix22_En13
  input   signed [21:0] dout_6_4_im;  // sfix22_En13
  input   dout_6_1_vld;
  input   signed [15:0] twdl_7_3_re;  // sfix16_En14
  input   signed [15:0] twdl_7_3_im;  // sfix16_En14
  input   signed [15:0] twdl_7_4_re;  // sfix16_En14
  input   signed [15:0] twdl_7_4_im;  // sfix16_En14
  output  signed [22:0] twdlXdin_3_re;  // sfix23_En13
  output  signed [22:0] twdlXdin_3_im;  // sfix23_En13
  output  signed [22:0] twdlXdin_4_re;  // sfix23_En13
  output  signed [22:0] twdlXdin_4_im;  // sfix23_En13


  wire signed [22:0] din_re;  // sfix23_En13
  reg signed [22:0] din1_re_dly1;  // sfix23_En13
  reg signed [22:0] din1_re_dly2;  // sfix23_En13
  reg signed [22:0] din1_re_dly3;  // sfix23_En13
  wire signed [22:0] din_im;  // sfix23_En13
  reg signed [22:0] din1_im_dly1;  // sfix23_En13
  reg signed [22:0] din1_im_dly2;  // sfix23_En13
  reg signed [22:0] din1_im_dly3;  // sfix23_En13
  reg  din1_vld_dly1;
  reg  din1_vld_dly2;
  reg  din1_vld_dly3;
  wire signed [22:0] din_re_1;  // sfix23_En13
  reg signed [22:0] din2_re_dly1;  // sfix23_En13
  reg signed [22:0] din2_re_dly2;  // sfix23_En13
  reg signed [22:0] din2_re_dly3;  // sfix23_En13
  wire signed [22:0] din_im_1;  // sfix23_En13
  reg signed [22:0] din2_im_dly1;  // sfix23_En13
  reg signed [22:0] din2_im_dly2;  // sfix23_En13
  reg signed [22:0] din2_im_dly3;  // sfix23_En13
  reg  di2_vld_dly1;
  reg  di2_vld_dly2;
  reg  di2_vld_dly3;


  assign din_re = {dout_6_3_re[21], dout_6_3_re};



  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        din1_re_dly1 <= 23'sb00000000000000000000000;
      end
      else begin
        din1_re_dly1 <= din_re;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_1_process
      if (reset == 1'b1) begin
        din1_re_dly2 <= 23'sb00000000000000000000000;
      end
      else begin
        din1_re_dly2 <= din1_re_dly1;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_2_process
      if (reset == 1'b1) begin
        din1_re_dly3 <= 23'sb00000000000000000000000;
      end
      else begin
        din1_re_dly3 <= din1_re_dly2;
      end
    end



  assign din_im = {dout_6_3_im[21], dout_6_3_im};



  always @(posedge clk or posedge reset)
    begin : intdelay_3_process
      if (reset == 1'b1) begin
        din1_im_dly1 <= 23'sb00000000000000000000000;
      end
      else begin
        din1_im_dly1 <= din_im;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_4_process
      if (reset == 1'b1) begin
        din1_im_dly2 <= 23'sb00000000000000000000000;
      end
      else begin
        din1_im_dly2 <= din1_im_dly1;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_5_process
      if (reset == 1'b1) begin
        din1_im_dly3 <= 23'sb00000000000000000000000;
      end
      else begin
        din1_im_dly3 <= din1_im_dly2;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_6_process
      if (reset == 1'b1) begin
        din1_vld_dly1 <= 1'b0;
      end
      else begin
        din1_vld_dly1 <= dout_6_1_vld;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_7_process
      if (reset == 1'b1) begin
        din1_vld_dly2 <= 1'b0;
      end
      else begin
        din1_vld_dly2 <= din1_vld_dly1;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_8_process
      if (reset == 1'b1) begin
        din1_vld_dly3 <= 1'b0;
      end
      else begin
        din1_vld_dly3 <= din1_vld_dly2;
      end
    end



  Complex4Multiply_block16 u_MUL4_1 (.clk(clk),
                                     .reset(reset),
                                     .din1_re_dly3(din1_re_dly3),  // sfix23_En13
                                     .din1_im_dly3(din1_im_dly3),  // sfix23_En13
                                     .din1_vld_dly3(din1_vld_dly3),
                                     .twdl_7_3_re(twdl_7_3_re),  // sfix16_En14
                                     .twdl_7_3_im(twdl_7_3_im),  // sfix16_En14
                                     .twdlXdin_3_re(twdlXdin_3_re),  // sfix23_En13
                                     .twdlXdin_3_im(twdlXdin_3_im)  // sfix23_En13
                                     );

  assign din_re_1 = {dout_6_4_re[21], dout_6_4_re};



  always @(posedge clk or posedge reset)
    begin : intdelay_9_process
      if (reset == 1'b1) begin
        din2_re_dly1 <= 23'sb00000000000000000000000;
      end
      else begin
        din2_re_dly1 <= din_re_1;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_10_process
      if (reset == 1'b1) begin
        din2_re_dly2 <= 23'sb00000000000000000000000;
      end
      else begin
        din2_re_dly2 <= din2_re_dly1;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_11_process
      if (reset == 1'b1) begin
        din2_re_dly3 <= 23'sb00000000000000000000000;
      end
      else begin
        din2_re_dly3 <= din2_re_dly2;
      end
    end



  assign din_im_1 = {dout_6_4_im[21], dout_6_4_im};



  always @(posedge clk or posedge reset)
    begin : intdelay_12_process
      if (reset == 1'b1) begin
        din2_im_dly1 <= 23'sb00000000000000000000000;
      end
      else begin
        din2_im_dly1 <= din_im_1;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_13_process
      if (reset == 1'b1) begin
        din2_im_dly2 <= 23'sb00000000000000000000000;
      end
      else begin
        din2_im_dly2 <= din2_im_dly1;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_14_process
      if (reset == 1'b1) begin
        din2_im_dly3 <= 23'sb00000000000000000000000;
      end
      else begin
        din2_im_dly3 <= din2_im_dly2;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_15_process
      if (reset == 1'b1) begin
        di2_vld_dly1 <= 1'b0;
      end
      else begin
        di2_vld_dly1 <= dout_6_1_vld;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_16_process
      if (reset == 1'b1) begin
        di2_vld_dly2 <= 1'b0;
      end
      else begin
        di2_vld_dly2 <= di2_vld_dly1;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_17_process
      if (reset == 1'b1) begin
        di2_vld_dly3 <= 1'b0;
      end
      else begin
        di2_vld_dly3 <= di2_vld_dly2;
      end
    end



  Complex4Multiply_block17 u_MUL4_2 (.clk(clk),
                                     .reset(reset),
                                     .din2_re_dly3(din2_re_dly3),  // sfix23_En13
                                     .din2_im_dly3(din2_im_dly3),  // sfix23_En13
                                     .di2_vld_dly3(di2_vld_dly3),
                                     .twdl_7_4_re(twdl_7_4_re),  // sfix16_En14
                                     .twdl_7_4_im(twdl_7_4_im),  // sfix16_En14
                                     .twdlXdin_4_re(twdlXdin_4_re),  // sfix23_En13
                                     .twdlXdin_4_im(twdlXdin_4_im)  // sfix23_En13
                                     );

endmodule  // TWDLMULT_SDNF1_7_block

