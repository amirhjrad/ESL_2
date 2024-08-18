// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\FFTHDLOptimizedExample_Streaming\RADIX22FFT_SDF1_1_block.v
// Created: 2024-05-11 19:34:42
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: RADIX22FFT_SDF1_1_block
// Source Path: FFTHDLOptimizedExample_Streaming/FFT Streaming/FFT/RADIX22FFT_SDF1_1
// Hierarchy Level: 2
// Model version: 8.0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module RADIX22FFT_SDF1_1_block
          (clk,
           reset,
           din_1_2_re_dly,
           din_1_2_im_dly,
           din_1_vld_dly,
           rd_1_Addr,
           rd_1_Enb,
           proc_1_enb,
           dout_1_2_re,
           dout_1_2_im);


  input   clk;
  input   reset;
  input   signed [15:0] din_1_2_re_dly;  // sfix16_En13
  input   signed [15:0] din_1_2_im_dly;  // sfix16_En13
  input   din_1_vld_dly;
  input   [4:0] rd_1_Addr;  // ufix5
  input   rd_1_Enb;
  input   proc_1_enb;
  output  signed [16:0] dout_1_2_re;  // sfix17_En13
  output  signed [16:0] dout_1_2_im;  // sfix17_En13


  wire signed [16:0] din_re;  // sfix17_En13
  reg signed [16:0] dinXTwdl_re;  // sfix17_En13
  wire signed [16:0] din_im;  // sfix17_En13
  reg signed [16:0] dinXTwdl_im;  // sfix17_En13
  reg  dinXTwdl_1_2_vld;
  reg  x_vld;
  wire signed [16:0] wrData_im;  // sfix17_En13
  wire [4:0] wrAddr;  // ufix5
  wire wrEnb;
  wire signed [16:0] x_im;  // sfix17_En13
  wire signed [16:0] wrData_re;  // sfix17_En13
  wire signed [16:0] x_re;  // sfix17_En13
  reg signed [17:0] Radix22ButterflyG1_btf1_re_reg;  // sfix18
  reg signed [17:0] Radix22ButterflyG1_btf1_im_reg;  // sfix18
  reg signed [17:0] Radix22ButterflyG1_btf2_re_reg;  // sfix18
  reg signed [17:0] Radix22ButterflyG1_btf2_im_reg;  // sfix18
  reg signed [16:0] Radix22ButterflyG1_x_re_dly1;  // sfix17
  reg signed [16:0] Radix22ButterflyG1_x_im_dly1;  // sfix17
  reg  Radix22ButterflyG1_x_vld_dly1;
  reg signed [16:0] Radix22ButterflyG1_dinXtwdl_re_dly1;  // sfix17
  reg signed [16:0] Radix22ButterflyG1_dinXtwdl_im_dly1;  // sfix17
  reg signed [16:0] Radix22ButterflyG1_dinXtwdl_re_dly2;  // sfix17
  reg signed [16:0] Radix22ButterflyG1_dinXtwdl_im_dly2;  // sfix17
  reg  Radix22ButterflyG1_dinXtwdl_vld_dly1;
  reg  Radix22ButterflyG1_dinXtwdl_vld_dly2;
  wire signed [17:0] Radix22ButterflyG1_btf1_re_reg_next;  // sfix18_En13
  wire signed [17:0] Radix22ButterflyG1_btf1_im_reg_next;  // sfix18_En13
  wire signed [17:0] Radix22ButterflyG1_btf2_re_reg_next;  // sfix18_En13
  wire signed [17:0] Radix22ButterflyG1_btf2_im_reg_next;  // sfix18_En13
  wire signed [17:0] Radix22ButterflyG1_add_cast;  // sfix18_En13
  wire signed [17:0] Radix22ButterflyG1_add_cast_1;  // sfix18_En13
  wire signed [17:0] Radix22ButterflyG1_sub_cast;  // sfix18_En13
  wire signed [17:0] Radix22ButterflyG1_sub_cast_1;  // sfix18_En13
  wire signed [17:0] Radix22ButterflyG1_add_cast_2;  // sfix18_En13
  wire signed [17:0] Radix22ButterflyG1_add_cast_3;  // sfix18_En13
  wire signed [17:0] Radix22ButterflyG1_sub_cast_2;  // sfix18_En13
  wire signed [17:0] Radix22ButterflyG1_sub_cast_3;  // sfix18_En13
  reg signed [16:0] xf_re;  // sfix17_En13
  reg signed [16:0] xf_im;  // sfix17_En13
  reg  xf_vld;
  wire signed [16:0] dinXTwdlf_re;  // sfix17_En13
  wire signed [16:0] dinXTwdlf_im;  // sfix17_En13
  wire dinxTwdlf_vld;
  wire signed [16:0] btf1_re;  // sfix17_En13
  wire signed [16:0] btf1_im;  // sfix17_En13
  wire signed [16:0] btf2_re;  // sfix17_En13
  wire signed [16:0] btf2_im;  // sfix17_En13
  reg  btf_vld;


  assign din_re = {din_1_2_re_dly[15], din_1_2_re_dly};



  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        dinXTwdl_re <= 17'sb00000000000000000;
      end
      else begin
        dinXTwdl_re <= din_re;
      end
    end



  assign din_im = {din_1_2_im_dly[15], din_1_2_im_dly};



  always @(posedge clk or posedge reset)
    begin : intdelay_1_process
      if (reset == 1'b1) begin
        dinXTwdl_im <= 17'sb00000000000000000;
      end
      else begin
        dinXTwdl_im <= din_im;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_2_process
      if (reset == 1'b1) begin
        dinXTwdl_1_2_vld <= 1'b0;
      end
      else begin
        dinXTwdl_1_2_vld <= din_1_vld_dly;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_3_process
      if (reset == 1'b1) begin
        x_vld <= 1'b0;
      end
      else begin
        x_vld <= rd_1_Enb;
      end
    end



  SimpleDualPortRAM_generic #(.AddrWidth(5),
                              .DataWidth(17)
                              )
                            u_dataMEM_im_0_1 (.clk(clk),
                                              .wr_din(wrData_im),
                                              .wr_addr(wrAddr),
                                              .wr_en(wrEnb),
                                              .rd_addr(rd_1_Addr),
                                              .dout(x_im)
                                              );

  SimpleDualPortRAM_generic #(.AddrWidth(5),
                              .DataWidth(17)
                              )
                            u_dataMEM_re_0_1 (.clk(clk),
                                              .wr_din(wrData_re),
                                              .wr_addr(wrAddr),
                                              .wr_en(wrEnb),
                                              .rd_addr(rd_1_Addr),
                                              .dout(x_re)
                                              );

  // Radix22ButterflyG1
  always @(posedge clk or posedge reset)
    begin : Radix22ButterflyG1_process
      if (reset == 1'b1) begin
        Radix22ButterflyG1_btf1_re_reg <= 18'sb000000000000000000;
        Radix22ButterflyG1_btf1_im_reg <= 18'sb000000000000000000;
        Radix22ButterflyG1_btf2_re_reg <= 18'sb000000000000000000;
        Radix22ButterflyG1_btf2_im_reg <= 18'sb000000000000000000;
        Radix22ButterflyG1_x_re_dly1 <= 17'sb00000000000000000;
        Radix22ButterflyG1_x_im_dly1 <= 17'sb00000000000000000;
        Radix22ButterflyG1_x_vld_dly1 <= 1'b0;
        xf_re <= 17'sb00000000000000000;
        xf_im <= 17'sb00000000000000000;
        xf_vld <= 1'b0;
        Radix22ButterflyG1_dinXtwdl_re_dly1 <= 17'sb00000000000000000;
        Radix22ButterflyG1_dinXtwdl_im_dly1 <= 17'sb00000000000000000;
        Radix22ButterflyG1_dinXtwdl_re_dly2 <= 17'sb00000000000000000;
        Radix22ButterflyG1_dinXtwdl_im_dly2 <= 17'sb00000000000000000;
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
        Radix22ButterflyG1_dinXtwdl_vld_dly1 <= proc_1_enb && dinXTwdl_1_2_vld;
      end
    end

  assign dinxTwdlf_vld = ( ! proc_1_enb) && dinXTwdl_1_2_vld;
  assign Radix22ButterflyG1_add_cast = {Radix22ButterflyG1_x_re_dly1[16], Radix22ButterflyG1_x_re_dly1};
  assign Radix22ButterflyG1_add_cast_1 = {Radix22ButterflyG1_dinXtwdl_re_dly2[16], Radix22ButterflyG1_dinXtwdl_re_dly2};
  assign Radix22ButterflyG1_btf1_re_reg_next = Radix22ButterflyG1_add_cast + Radix22ButterflyG1_add_cast_1;
  assign Radix22ButterflyG1_sub_cast = {Radix22ButterflyG1_x_re_dly1[16], Radix22ButterflyG1_x_re_dly1};
  assign Radix22ButterflyG1_sub_cast_1 = {Radix22ButterflyG1_dinXtwdl_re_dly2[16], Radix22ButterflyG1_dinXtwdl_re_dly2};
  assign Radix22ButterflyG1_btf2_re_reg_next = Radix22ButterflyG1_sub_cast - Radix22ButterflyG1_sub_cast_1;
  assign Radix22ButterflyG1_add_cast_2 = {Radix22ButterflyG1_x_im_dly1[16], Radix22ButterflyG1_x_im_dly1};
  assign Radix22ButterflyG1_add_cast_3 = {Radix22ButterflyG1_dinXtwdl_im_dly2[16], Radix22ButterflyG1_dinXtwdl_im_dly2};
  assign Radix22ButterflyG1_btf1_im_reg_next = Radix22ButterflyG1_add_cast_2 + Radix22ButterflyG1_add_cast_3;
  assign Radix22ButterflyG1_sub_cast_2 = {Radix22ButterflyG1_x_im_dly1[16], Radix22ButterflyG1_x_im_dly1};
  assign Radix22ButterflyG1_sub_cast_3 = {Radix22ButterflyG1_dinXtwdl_im_dly2[16], Radix22ButterflyG1_dinXtwdl_im_dly2};
  assign Radix22ButterflyG1_btf2_im_reg_next = Radix22ButterflyG1_sub_cast_2 - Radix22ButterflyG1_sub_cast_3;
  assign dinXTwdlf_re = dinXTwdl_re;
  assign dinXTwdlf_im = dinXTwdl_im;
  assign btf1_re = Radix22ButterflyG1_btf1_re_reg[16:0];
  assign btf1_im = Radix22ButterflyG1_btf1_im_reg[16:0];
  assign btf2_re = Radix22ButterflyG1_btf2_re_reg[16:0];
  assign btf2_im = Radix22ButterflyG1_btf2_im_reg[16:0];



  SDFCommutator1_block u_SDFCOMMUTATOR_1 (.clk(clk),
                                          .reset(reset),
                                          .din_1_vld_dly(din_1_vld_dly),
                                          .xf_re(xf_re),  // sfix17_En13
                                          .xf_im(xf_im),  // sfix17_En13
                                          .xf_vld(xf_vld),
                                          .dinXTwdlf_re(dinXTwdlf_re),  // sfix17_En13
                                          .dinXTwdlf_im(dinXTwdlf_im),  // sfix17_En13
                                          .dinxTwdlf_vld(dinxTwdlf_vld),
                                          .btf1_re(btf1_re),  // sfix17_En13
                                          .btf1_im(btf1_im),  // sfix17_En13
                                          .btf2_re(btf2_re),  // sfix17_En13
                                          .btf2_im(btf2_im),  // sfix17_En13
                                          .btf_vld(btf_vld),
                                          .wrData_re(wrData_re),  // sfix17_En13
                                          .wrData_im(wrData_im),  // sfix17_En13
                                          .wrAddr(wrAddr),  // ufix5
                                          .wrEnb(wrEnb),
                                          .dout_1_2_re(dout_1_2_re),  // sfix17_En13
                                          .dout_1_2_im(dout_1_2_im)  // sfix17_En13
                                          );

endmodule  // RADIX22FFT_SDF1_1_block

