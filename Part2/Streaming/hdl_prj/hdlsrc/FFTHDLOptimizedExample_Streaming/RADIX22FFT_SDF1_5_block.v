// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\FFTHDLOptimizedExample_Streaming\RADIX22FFT_SDF1_5_block.v
// Created: 2024-05-11 19:34:42
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: RADIX22FFT_SDF1_5_block
// Source Path: FFTHDLOptimizedExample_Streaming/FFT Streaming/FFT/RADIX22FFT_SDF1_5
// Hierarchy Level: 2
// Model version: 8.0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module RADIX22FFT_SDF1_5_block
          (clk,
           reset,
           din_5_2_re_dly,
           din_5_2_im_dly,
           din_5_vld_dly,
           rd_5_Addr,
           rd_5_Enb,
           twdl_5_2_re,
           twdl_5_2_im,
           proc_5_enb,
           dout_5_2_re,
           dout_5_2_im);


  input   clk;
  input   reset;
  input   signed [19:0] din_5_2_re_dly;  // sfix20_En13
  input   signed [19:0] din_5_2_im_dly;  // sfix20_En13
  input   din_5_vld_dly;
  input   rd_5_Addr;  // ufix1
  input   rd_5_Enb;
  input   signed [15:0] twdl_5_2_re;  // sfix16_En14
  input   signed [15:0] twdl_5_2_im;  // sfix16_En14
  input   proc_5_enb;
  output  signed [20:0] dout_5_2_re;  // sfix21_En13
  output  signed [20:0] dout_5_2_im;  // sfix21_En13


  wire signed [20:0] din_re;  // sfix21_En13
  wire signed [20:0] din_im;  // sfix21_En13
  wire signed [20:0] dinXTwdl_re;  // sfix21_En13
  wire signed [20:0] dinXTwdl_im;  // sfix21_En13
  wire dinXTwdl_5_2_vld;
  reg  x_vld;
  wire signed [20:0] wrData_re;  // sfix21_En13
  wire signed [20:0] wrData_im;  // sfix21_En13
  wire wrAddr;  // ufix1
  wire wrEnb;
  reg signed [20:0] twoLocationReg_0_MEM_re_0;  // sfix21
  reg signed [20:0] twoLocationReg_0_MEM_im_0;  // sfix21
  reg signed [20:0] twoLocationReg_0_MEM_re_1;  // sfix21
  reg signed [20:0] twoLocationReg_0_MEM_im_1;  // sfix21
  reg signed [20:0] twoLocationReg_0_dout_re_reg;  // sfix21
  reg signed [20:0] twoLocationReg_0_dout_im_reg;  // sfix21
  reg signed [20:0] twoLocationReg_0_MEM_re_0_next;  // sfix21_En13
  reg signed [20:0] twoLocationReg_0_MEM_im_0_next;  // sfix21_En13
  reg signed [20:0] twoLocationReg_0_MEM_re_1_next;  // sfix21_En13
  reg signed [20:0] twoLocationReg_0_MEM_im_1_next;  // sfix21_En13
  reg signed [20:0] twoLocationReg_0_dout_re_reg_next;  // sfix21_En13
  reg signed [20:0] twoLocationReg_0_dout_im_reg_next;  // sfix21_En13
  reg signed [20:0] x_re;  // sfix21_En13
  reg signed [20:0] x_im;  // sfix21_En13
  reg signed [21:0] Radix22ButterflyG1_btf1_re_reg;  // sfix22
  reg signed [21:0] Radix22ButterflyG1_btf1_im_reg;  // sfix22
  reg signed [21:0] Radix22ButterflyG1_btf2_re_reg;  // sfix22
  reg signed [21:0] Radix22ButterflyG1_btf2_im_reg;  // sfix22
  reg signed [20:0] Radix22ButterflyG1_x_re_dly1;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_x_im_dly1;  // sfix21
  reg  Radix22ButterflyG1_x_vld_dly1;
  reg signed [20:0] Radix22ButterflyG1_dinXtwdl_re_dly1;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_dinXtwdl_im_dly1;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_dinXtwdl_re_dly2;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_dinXtwdl_im_dly2;  // sfix21
  reg  Radix22ButterflyG1_dinXtwdl_vld_dly1;
  reg  Radix22ButterflyG1_dinXtwdl_vld_dly2;
  wire signed [21:0] Radix22ButterflyG1_btf1_re_reg_next;  // sfix22_En13
  wire signed [21:0] Radix22ButterflyG1_btf1_im_reg_next;  // sfix22_En13
  wire signed [21:0] Radix22ButterflyG1_btf2_re_reg_next;  // sfix22_En13
  wire signed [21:0] Radix22ButterflyG1_btf2_im_reg_next;  // sfix22_En13
  wire signed [21:0] Radix22ButterflyG1_add_cast;  // sfix22_En13
  wire signed [21:0] Radix22ButterflyG1_add_cast_1;  // sfix22_En13
  wire signed [21:0] Radix22ButterflyG1_sub_cast;  // sfix22_En13
  wire signed [21:0] Radix22ButterflyG1_sub_cast_1;  // sfix22_En13
  wire signed [21:0] Radix22ButterflyG1_add_cast_2;  // sfix22_En13
  wire signed [21:0] Radix22ButterflyG1_add_cast_3;  // sfix22_En13
  wire signed [21:0] Radix22ButterflyG1_sub_cast_2;  // sfix22_En13
  wire signed [21:0] Radix22ButterflyG1_sub_cast_3;  // sfix22_En13
  reg signed [20:0] xf_re;  // sfix21_En13
  reg signed [20:0] xf_im;  // sfix21_En13
  reg  xf_vld;
  wire signed [20:0] dinXTwdlf_re;  // sfix21_En13
  wire signed [20:0] dinXTwdlf_im;  // sfix21_En13
  wire dinxTwdlf_vld;
  wire signed [20:0] btf1_re;  // sfix21_En13
  wire signed [20:0] btf1_im;  // sfix21_En13
  wire signed [20:0] btf2_re;  // sfix21_En13
  wire signed [20:0] btf2_im;  // sfix21_En13
  reg  btf_vld;


  assign din_re = {din_5_2_re_dly[19], din_5_2_re_dly};



  assign din_im = {din_5_2_im_dly[19], din_5_2_im_dly};



  Complex4Multiply_block8 u_MUL4 (.clk(clk),
                                  .reset(reset),
                                  .din_re(din_re),  // sfix21_En13
                                  .din_im(din_im),  // sfix21_En13
                                  .din_5_vld_dly(din_5_vld_dly),
                                  .twdl_5_2_re(twdl_5_2_re),  // sfix16_En14
                                  .twdl_5_2_im(twdl_5_2_im),  // sfix16_En14
                                  .dinXTwdl_re(dinXTwdl_re),  // sfix21_En13
                                  .dinXTwdl_im(dinXTwdl_im),  // sfix21_En13
                                  .dinXTwdl_5_2_vld(dinXTwdl_5_2_vld)
                                  );

  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        x_vld <= 1'b0;
      end
      else begin
        x_vld <= rd_5_Enb;
      end
    end



  // twoLocationReg_0
  always @(posedge clk or posedge reset)
    begin : twoLocationReg_0_process
      if (reset == 1'b1) begin
        twoLocationReg_0_MEM_re_0 <= 21'sb000000000000000000000;
        twoLocationReg_0_MEM_im_0 <= 21'sb000000000000000000000;
        twoLocationReg_0_MEM_re_1 <= 21'sb000000000000000000000;
        twoLocationReg_0_MEM_im_1 <= 21'sb000000000000000000000;
        twoLocationReg_0_dout_re_reg <= 21'sb000000000000000000000;
        twoLocationReg_0_dout_im_reg <= 21'sb000000000000000000000;
      end
      else begin
        twoLocationReg_0_MEM_re_0 <= twoLocationReg_0_MEM_re_0_next;
        twoLocationReg_0_MEM_im_0 <= twoLocationReg_0_MEM_im_0_next;
        twoLocationReg_0_MEM_re_1 <= twoLocationReg_0_MEM_re_1_next;
        twoLocationReg_0_MEM_im_1 <= twoLocationReg_0_MEM_im_1_next;
        twoLocationReg_0_dout_re_reg <= twoLocationReg_0_dout_re_reg_next;
        twoLocationReg_0_dout_im_reg <= twoLocationReg_0_dout_im_reg_next;
      end
    end

  always @(rd_5_Addr, twoLocationReg_0_MEM_im_0, twoLocationReg_0_MEM_im_1,
       twoLocationReg_0_MEM_re_0, twoLocationReg_0_MEM_re_1,
       twoLocationReg_0_dout_im_reg, twoLocationReg_0_dout_re_reg, wrAddr,
       wrData_im, wrData_re, wrEnb) begin
    twoLocationReg_0_MEM_re_0_next = twoLocationReg_0_MEM_re_0;
    twoLocationReg_0_MEM_im_0_next = twoLocationReg_0_MEM_im_0;
    twoLocationReg_0_MEM_re_1_next = twoLocationReg_0_MEM_re_1;
    twoLocationReg_0_MEM_im_1_next = twoLocationReg_0_MEM_im_1;
    if (rd_5_Addr == 1'b1) begin
      twoLocationReg_0_dout_re_reg_next = twoLocationReg_0_MEM_re_1;
      twoLocationReg_0_dout_im_reg_next = twoLocationReg_0_MEM_im_1;
    end
    else begin
      twoLocationReg_0_dout_re_reg_next = twoLocationReg_0_MEM_re_0;
      twoLocationReg_0_dout_im_reg_next = twoLocationReg_0_MEM_im_0;
    end
    if (wrEnb) begin
      if (wrAddr == 1'b1) begin
        twoLocationReg_0_MEM_re_1_next = wrData_re;
        twoLocationReg_0_MEM_im_1_next = wrData_im;
      end
      else begin
        twoLocationReg_0_MEM_re_0_next = wrData_re;
        twoLocationReg_0_MEM_im_0_next = wrData_im;
      end
    end
    x_re = twoLocationReg_0_dout_re_reg;
    x_im = twoLocationReg_0_dout_im_reg;
  end



  // Radix22ButterflyG1
  always @(posedge clk or posedge reset)
    begin : Radix22ButterflyG1_process
      if (reset == 1'b1) begin
        Radix22ButterflyG1_btf1_re_reg <= 22'sb0000000000000000000000;
        Radix22ButterflyG1_btf1_im_reg <= 22'sb0000000000000000000000;
        Radix22ButterflyG1_btf2_re_reg <= 22'sb0000000000000000000000;
        Radix22ButterflyG1_btf2_im_reg <= 22'sb0000000000000000000000;
        Radix22ButterflyG1_x_re_dly1 <= 21'sb000000000000000000000;
        Radix22ButterflyG1_x_im_dly1 <= 21'sb000000000000000000000;
        Radix22ButterflyG1_x_vld_dly1 <= 1'b0;
        xf_re <= 21'sb000000000000000000000;
        xf_im <= 21'sb000000000000000000000;
        xf_vld <= 1'b0;
        Radix22ButterflyG1_dinXtwdl_re_dly1 <= 21'sb000000000000000000000;
        Radix22ButterflyG1_dinXtwdl_im_dly1 <= 21'sb000000000000000000000;
        Radix22ButterflyG1_dinXtwdl_re_dly2 <= 21'sb000000000000000000000;
        Radix22ButterflyG1_dinXtwdl_im_dly2 <= 21'sb000000000000000000000;
        Radix22ButterflyG1_dinXtwdl_vld_dly1 <= 1'b0;
        Radix22ButterflyG1_dinXtwdl_vld_dly2 <= 1'b0;
        btf_vld <= 1'b0;
      end
      else begin
        Radix22ButterflyG1_btf1_re_reg <= Radix22ButterflyG1_btf1_re_reg_next;
        Radix22ButterflyG1_btf1_im_reg <= Radix22ButterflyG1_btf1_im_reg_next;
        Radix22ButterflyG1_btf2_re_reg <= Radix22ButterflyG1_btf2_re_reg_next;
        Radix22ButterflyG1_btf2_im_reg <= Radix22ButterflyG1_btf2_im_reg_next;
        xf_re <= Radix22ButterflyG1_x_re_dly1;
        xf_im <= Radix22ButterflyG1_x_im_dly1;
        xf_vld <= Radix22ButterflyG1_x_vld_dly1;
        btf_vld <= Radix22ButterflyG1_dinXtwdl_vld_dly2;
        Radix22ButterflyG1_dinXtwdl_vld_dly2 <= Radix22ButterflyG1_dinXtwdl_vld_dly1;
        Radix22ButterflyG1_dinXtwdl_re_dly2 <= Radix22ButterflyG1_dinXtwdl_re_dly1;
        Radix22ButterflyG1_dinXtwdl_im_dly2 <= Radix22ButterflyG1_dinXtwdl_im_dly1;
        Radix22ButterflyG1_dinXtwdl_re_dly1 <= dinXTwdl_re;
        Radix22ButterflyG1_dinXtwdl_im_dly1 <= dinXTwdl_im;
        Radix22ButterflyG1_x_re_dly1 <= x_re;
        Radix22ButterflyG1_x_im_dly1 <= x_im;
        Radix22ButterflyG1_x_vld_dly1 <= x_vld;
        Radix22ButterflyG1_dinXtwdl_vld_dly1 <= proc_5_enb && dinXTwdl_5_2_vld;
      end
    end

  assign dinxTwdlf_vld = ( ! proc_5_enb) && dinXTwdl_5_2_vld;
  assign Radix22ButterflyG1_add_cast = {Radix22ButterflyG1_x_re_dly1[20], Radix22ButterflyG1_x_re_dly1};
  assign Radix22ButterflyG1_add_cast_1 = {Radix22ButterflyG1_dinXtwdl_re_dly2[20], Radix22ButterflyG1_dinXtwdl_re_dly2};
  assign Radix22ButterflyG1_btf1_re_reg_next = Radix22ButterflyG1_add_cast + Radix22ButterflyG1_add_cast_1;
  assign Radix22ButterflyG1_sub_cast = {Radix22ButterflyG1_x_re_dly1[20], Radix22ButterflyG1_x_re_dly1};
  assign Radix22ButterflyG1_sub_cast_1 = {Radix22ButterflyG1_dinXtwdl_re_dly2[20], Radix22ButterflyG1_dinXtwdl_re_dly2};
  assign Radix22ButterflyG1_btf2_re_reg_next = Radix22ButterflyG1_sub_cast - Radix22ButterflyG1_sub_cast_1;
  assign Radix22ButterflyG1_add_cast_2 = {Radix22ButterflyG1_x_im_dly1[20], Radix22ButterflyG1_x_im_dly1};
  assign Radix22ButterflyG1_add_cast_3 = {Radix22ButterflyG1_dinXtwdl_im_dly2[20], Radix22ButterflyG1_dinXtwdl_im_dly2};
  assign Radix22ButterflyG1_btf1_im_reg_next = Radix22ButterflyG1_add_cast_2 + Radix22ButterflyG1_add_cast_3;
  assign Radix22ButterflyG1_sub_cast_2 = {Radix22ButterflyG1_x_im_dly1[20], Radix22ButterflyG1_x_im_dly1};
  assign Radix22ButterflyG1_sub_cast_3 = {Radix22ButterflyG1_dinXtwdl_im_dly2[20], Radix22ButterflyG1_dinXtwdl_im_dly2};
  assign Radix22ButterflyG1_btf2_im_reg_next = Radix22ButterflyG1_sub_cast_2 - Radix22ButterflyG1_sub_cast_3;
  assign dinXTwdlf_re = dinXTwdl_re;
  assign dinXTwdlf_im = dinXTwdl_im;
  assign btf1_re = Radix22ButterflyG1_btf1_re_reg[20:0];
  assign btf1_im = Radix22ButterflyG1_btf1_im_reg[20:0];
  assign btf2_re = Radix22ButterflyG1_btf2_re_reg[20:0];
  assign btf2_im = Radix22ButterflyG1_btf2_im_reg[20:0];



  SDFCommutator5_block u_SDFCOMMUTATOR_5 (.clk(clk),
                                          .reset(reset),
                                          .din_5_vld_dly(din_5_vld_dly),
                                          .xf_re(xf_re),  // sfix21_En13
                                          .xf_im(xf_im),  // sfix21_En13
                                          .xf_vld(xf_vld),
                                          .dinXTwdlf_re(dinXTwdlf_re),  // sfix21_En13
                                          .dinXTwdlf_im(dinXTwdlf_im),  // sfix21_En13
                                          .dinxTwdlf_vld(dinxTwdlf_vld),
                                          .btf1_re(btf1_re),  // sfix21_En13
                                          .btf1_im(btf1_im),  // sfix21_En13
                                          .btf2_re(btf2_re),  // sfix21_En13
                                          .btf2_im(btf2_im),  // sfix21_En13
                                          .btf_vld(btf_vld),
                                          .wrData_re(wrData_re),  // sfix21_En13
                                          .wrData_im(wrData_im),  // sfix21_En13
                                          .wrAddr(wrAddr),  // ufix1
                                          .wrEnb(wrEnb),
                                          .dout_5_2_re(dout_5_2_re),  // sfix21_En13
                                          .dout_5_2_im(dout_5_2_im)  // sfix21_En13
                                          );

endmodule  // RADIX22FFT_SDF1_5_block

