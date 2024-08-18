// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\FFTHDLOptimizedExample_Streaming\RADIX22FFT_SDNF2_8_block1.v
// Created: 2024-05-11 19:34:42
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: RADIX22FFT_SDNF2_8_block1
// Source Path: FFTHDLOptimizedExample_Streaming/FFT Streaming/FFT/RADIX22FFT_SDNF2_8
// Hierarchy Level: 2
// Model version: 8.0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module RADIX22FFT_SDNF2_8_block1
          (clk,
           reset,
           rotate_5,
           dout_2_re,
           dout_2_im,
           dout_6_re,
           dout_6_im,
           dout_1_vld,
           dout_5_re,
           dout_5_im,
           dout_6_re_1,
           dout_6_im_1);


  input   clk;
  input   reset;
  input   rotate_5;  // ufix1
  input   signed [22:0] dout_2_re;  // sfix23_En13
  input   signed [22:0] dout_2_im;  // sfix23_En13
  input   signed [22:0] dout_6_re;  // sfix23_En13
  input   signed [22:0] dout_6_im;  // sfix23_En13
  input   dout_1_vld;
  output  signed [23:0] dout_5_re;  // sfix24_En13
  output  signed [23:0] dout_5_im;  // sfix24_En13
  output  signed [23:0] dout_6_re_1;  // sfix24_En13
  output  signed [23:0] dout_6_im_1;  // sfix24_En13


  wire signed [23:0] din1_re;  // sfix24_En13
  wire signed [23:0] din1_im;  // sfix24_En13
  wire signed [23:0] din2_re;  // sfix24_En13
  wire signed [23:0] din2_im;  // sfix24_En13
  reg  Radix22ButterflyG2_NF_din_vld_dly;
  reg signed [24:0] Radix22ButterflyG2_NF_btf1_re_reg;  // sfix25
  reg signed [24:0] Radix22ButterflyG2_NF_btf1_im_reg;  // sfix25
  reg signed [24:0] Radix22ButterflyG2_NF_btf2_re_reg;  // sfix25
  reg signed [24:0] Radix22ButterflyG2_NF_btf2_im_reg;  // sfix25
  reg  Radix22ButterflyG2_NF_din_vld_dly_next;
  reg signed [24:0] Radix22ButterflyG2_NF_btf1_re_reg_next;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_btf1_im_reg_next;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_btf2_re_reg_next;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_btf2_im_reg_next;  // sfix25_En13
  reg signed [23:0] dout_5_re_1;  // sfix24_En13
  reg signed [23:0] dout_5_im_1;  // sfix24_En13
  reg signed [23:0] dout_6_re_2;  // sfix24_En13
  reg signed [23:0] dout_6_im_2;  // sfix24_En13
  reg  dout_8_vld;
  reg signed [24:0] Radix22ButterflyG2_NF_add_cast;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_add_cast_0;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_add_cast_1;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_add_cast_2;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_sub_cast;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_sub_cast_0;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_sub_cast_1;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_sub_cast_2;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_add_cast_3;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_add_cast_4;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_add_cast_5;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_add_cast_6;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_sub_cast_3;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_sub_cast_4;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_sub_cast_5;  // sfix25_En13
  reg signed [24:0] Radix22ButterflyG2_NF_sub_cast_6;  // sfix25_En13


  assign din1_re = {dout_2_re[22], dout_2_re};



  assign din1_im = {dout_2_im[22], dout_2_im};



  assign din2_re = {dout_6_re[22], dout_6_re};



  assign din2_im = {dout_6_im[22], dout_6_im};



  // Radix22ButterflyG2_NF
  always @(posedge clk or posedge reset)
    begin : Radix22ButterflyG2_NF_process
      if (reset == 1'b1) begin
        Radix22ButterflyG2_NF_din_vld_dly <= 1'b0;
        Radix22ButterflyG2_NF_btf1_re_reg <= 25'sb0000000000000000000000000;
        Radix22ButterflyG2_NF_btf1_im_reg <= 25'sb0000000000000000000000000;
        Radix22ButterflyG2_NF_btf2_re_reg <= 25'sb0000000000000000000000000;
        Radix22ButterflyG2_NF_btf2_im_reg <= 25'sb0000000000000000000000000;
      end
      else begin
        Radix22ButterflyG2_NF_din_vld_dly <= Radix22ButterflyG2_NF_din_vld_dly_next;
        Radix22ButterflyG2_NF_btf1_re_reg <= Radix22ButterflyG2_NF_btf1_re_reg_next;
        Radix22ButterflyG2_NF_btf1_im_reg <= Radix22ButterflyG2_NF_btf1_im_reg_next;
        Radix22ButterflyG2_NF_btf2_re_reg <= Radix22ButterflyG2_NF_btf2_re_reg_next;
        Radix22ButterflyG2_NF_btf2_im_reg <= Radix22ButterflyG2_NF_btf2_im_reg_next;
      end
    end

  always @(Radix22ButterflyG2_NF_btf1_im_reg, Radix22ButterflyG2_NF_btf1_re_reg,
       Radix22ButterflyG2_NF_btf2_im_reg, Radix22ButterflyG2_NF_btf2_re_reg,
       Radix22ButterflyG2_NF_din_vld_dly, din1_im, din1_re, din2_im, din2_re,
       dout_1_vld, rotate_5) begin
    Radix22ButterflyG2_NF_add_cast_1 = 25'sb0000000000000000000000000;
    Radix22ButterflyG2_NF_add_cast_2 = 25'sb0000000000000000000000000;
    Radix22ButterflyG2_NF_sub_cast_1 = 25'sb0000000000000000000000000;
    Radix22ButterflyG2_NF_sub_cast_2 = 25'sb0000000000000000000000000;
    Radix22ButterflyG2_NF_add_cast_5 = 25'sb0000000000000000000000000;
    Radix22ButterflyG2_NF_add_cast_6 = 25'sb0000000000000000000000000;
    Radix22ButterflyG2_NF_sub_cast_5 = 25'sb0000000000000000000000000;
    Radix22ButterflyG2_NF_sub_cast_6 = 25'sb0000000000000000000000000;
    Radix22ButterflyG2_NF_add_cast = 25'sb0000000000000000000000000;
    Radix22ButterflyG2_NF_add_cast_0 = 25'sb0000000000000000000000000;
    Radix22ButterflyG2_NF_sub_cast = 25'sb0000000000000000000000000;
    Radix22ButterflyG2_NF_sub_cast_0 = 25'sb0000000000000000000000000;
    Radix22ButterflyG2_NF_add_cast_3 = 25'sb0000000000000000000000000;
    Radix22ButterflyG2_NF_add_cast_4 = 25'sb0000000000000000000000000;
    Radix22ButterflyG2_NF_sub_cast_3 = 25'sb0000000000000000000000000;
    Radix22ButterflyG2_NF_sub_cast_4 = 25'sb0000000000000000000000000;
    Radix22ButterflyG2_NF_btf1_re_reg_next = Radix22ButterflyG2_NF_btf1_re_reg;
    Radix22ButterflyG2_NF_btf1_im_reg_next = Radix22ButterflyG2_NF_btf1_im_reg;
    Radix22ButterflyG2_NF_btf2_re_reg_next = Radix22ButterflyG2_NF_btf2_re_reg;
    Radix22ButterflyG2_NF_btf2_im_reg_next = Radix22ButterflyG2_NF_btf2_im_reg;
    Radix22ButterflyG2_NF_din_vld_dly_next = dout_1_vld;
    if (rotate_5 != 1'b0) begin
      if (dout_1_vld) begin
        Radix22ButterflyG2_NF_add_cast_1 = {din1_re[23], din1_re};
        Radix22ButterflyG2_NF_add_cast_2 = {din2_im[23], din2_im};
        Radix22ButterflyG2_NF_btf1_re_reg_next = Radix22ButterflyG2_NF_add_cast_1 + Radix22ButterflyG2_NF_add_cast_2;
        Radix22ButterflyG2_NF_sub_cast_1 = {din1_re[23], din1_re};
        Radix22ButterflyG2_NF_sub_cast_2 = {din2_im[23], din2_im};
        Radix22ButterflyG2_NF_btf2_re_reg_next = Radix22ButterflyG2_NF_sub_cast_1 - Radix22ButterflyG2_NF_sub_cast_2;
        Radix22ButterflyG2_NF_add_cast_5 = {din1_im[23], din1_im};
        Radix22ButterflyG2_NF_add_cast_6 = {din2_re[23], din2_re};
        Radix22ButterflyG2_NF_btf2_im_reg_next = Radix22ButterflyG2_NF_add_cast_5 + Radix22ButterflyG2_NF_add_cast_6;
        Radix22ButterflyG2_NF_sub_cast_5 = {din1_im[23], din1_im};
        Radix22ButterflyG2_NF_sub_cast_6 = {din2_re[23], din2_re};
        Radix22ButterflyG2_NF_btf1_im_reg_next = Radix22ButterflyG2_NF_sub_cast_5 - Radix22ButterflyG2_NF_sub_cast_6;
      end
    end
    else if (dout_1_vld) begin
      Radix22ButterflyG2_NF_add_cast = {din1_re[23], din1_re};
      Radix22ButterflyG2_NF_add_cast_0 = {din2_re[23], din2_re};
      Radix22ButterflyG2_NF_btf1_re_reg_next = Radix22ButterflyG2_NF_add_cast + Radix22ButterflyG2_NF_add_cast_0;
      Radix22ButterflyG2_NF_sub_cast = {din1_re[23], din1_re};
      Radix22ButterflyG2_NF_sub_cast_0 = {din2_re[23], din2_re};
      Radix22ButterflyG2_NF_btf2_re_reg_next = Radix22ButterflyG2_NF_sub_cast - Radix22ButterflyG2_NF_sub_cast_0;
      Radix22ButterflyG2_NF_add_cast_3 = {din1_im[23], din1_im};
      Radix22ButterflyG2_NF_add_cast_4 = {din2_im[23], din2_im};
      Radix22ButterflyG2_NF_btf1_im_reg_next = Radix22ButterflyG2_NF_add_cast_3 + Radix22ButterflyG2_NF_add_cast_4;
      Radix22ButterflyG2_NF_sub_cast_3 = {din1_im[23], din1_im};
      Radix22ButterflyG2_NF_sub_cast_4 = {din2_im[23], din2_im};
      Radix22ButterflyG2_NF_btf2_im_reg_next = Radix22ButterflyG2_NF_sub_cast_3 - Radix22ButterflyG2_NF_sub_cast_4;
    end
    dout_5_re_1 = Radix22ButterflyG2_NF_btf1_re_reg[23:0];
    dout_5_im_1 = Radix22ButterflyG2_NF_btf1_im_reg[23:0];
    dout_6_re_2 = Radix22ButterflyG2_NF_btf2_re_reg[23:0];
    dout_6_im_2 = Radix22ButterflyG2_NF_btf2_im_reg[23:0];
    dout_8_vld = Radix22ButterflyG2_NF_din_vld_dly;
  end



  assign dout_5_re = dout_5_re_1;

  assign dout_5_im = dout_5_im_1;

  assign dout_6_re_1 = dout_6_re_2;

  assign dout_6_im_1 = dout_6_im_2;

endmodule  // RADIX22FFT_SDNF2_8_block1

