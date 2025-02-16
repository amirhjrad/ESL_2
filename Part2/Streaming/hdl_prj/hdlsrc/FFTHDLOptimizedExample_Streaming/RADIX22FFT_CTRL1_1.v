// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\FFTHDLOptimizedExample_Streaming\RADIX22FFT_CTRL1_1.v
// Created: 2024-05-11 19:34:42
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: RADIX22FFT_CTRL1_1
// Source Path: FFTHDLOptimizedExample_Streaming/FFT Streaming/FFT/RADIX22FFT_CTRL1_1
// Hierarchy Level: 2
// Model version: 8.0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module RADIX22FFT_CTRL1_1
          (clk,
           reset,
           dinXTwdl_1_1_vld,
           dinXTwdl_1_1_vld_1,
           rd_1_Addr,
           rd_1_Enb,
           proc_1_enb);


  input   clk;
  input   reset;
  input   dinXTwdl_1_1_vld;
  input   dinXTwdl_1_1_vld_1;
  output  [4:0] rd_1_Addr;  // ufix5
  output  rd_1_Enb;
  output  proc_1_enb;


  reg [4:0] SDFController_wrCount;  // ufix5
  reg [1:0] SDFController_wrState;  // ufix2
  reg [1:0] SDFController_rdState;  // ufix2
  reg [4:0] SDFController_rdAddr_reg;  // ufix5
  reg  SDFController_procEnb_reg;
  reg [1:0] SDFController_multjState;  // ufix2
  reg  SDFController_multiply_J_reg;
  reg [4:0] SDFController_wrCount_next;  // ufix5
  reg [1:0] SDFController_wrState_next;  // ufix2
  reg [1:0] SDFController_rdState_next;  // ufix2
  reg [4:0] SDFController_rdAddr_reg_next;  // ufix5
  reg  SDFController_procEnb_reg_next;
  reg [1:0] SDFController_multjState_next;  // ufix2
  reg  SDFController_multiply_J_reg_next;
  reg [4:0] rd_1_Addr_1;  // ufix5
  reg  rd_1_Enb_1;
  reg  proc_1_enb_1;
  reg  multiply_1_J;


  // SDFController
  always @(posedge clk or posedge reset)
    begin : SDFController_process
      if (reset == 1'b1) begin
        SDFController_wrCount <= 5'b00000;
        SDFController_rdAddr_reg <= 5'b00000;
        SDFController_wrState <= 2'b00;
        SDFController_rdState <= 2'b00;
        SDFController_multjState <= 2'b00;
        SDFController_procEnb_reg <= 1'b0;
        SDFController_multiply_J_reg <= 1'b0;
      end
      else begin
        SDFController_wrCount <= SDFController_wrCount_next;
        SDFController_wrState <= SDFController_wrState_next;
        SDFController_rdState <= SDFController_rdState_next;
        SDFController_rdAddr_reg <= SDFController_rdAddr_reg_next;
        SDFController_procEnb_reg <= SDFController_procEnb_reg_next;
        SDFController_multjState <= SDFController_multjState_next;
        SDFController_multiply_J_reg <= SDFController_multiply_J_reg_next;
      end
    end

  always @(SDFController_multiply_J_reg, SDFController_multjState,
       SDFController_procEnb_reg, SDFController_rdAddr_reg,
       SDFController_rdState, SDFController_wrCount, SDFController_wrState,
       dinXTwdl_1_1_vld, dinXTwdl_1_1_vld_1) begin
    SDFController_wrCount_next = SDFController_wrCount;
    SDFController_rdState_next = SDFController_rdState;
    SDFController_rdAddr_reg_next = SDFController_rdAddr_reg;
    SDFController_procEnb_reg_next = SDFController_procEnb_reg;
    SDFController_multjState_next = SDFController_multjState;
    case ( SDFController_multjState)
      2'b00 :
        begin
          SDFController_multjState_next = 2'b00;
          SDFController_multiply_J_reg_next = 1'b0;
          if (SDFController_rdState == 2'b01) begin
            SDFController_multjState_next = 2'b01;
          end
        end
      2'b01 :
        begin
          SDFController_multiply_J_reg_next = 1'b0;
          if (SDFController_rdState == 2'b10) begin
            SDFController_multjState_next = 2'b10;
          end
        end
      2'b10 :
        begin
          SDFController_multiply_J_reg_next = 1'b0;
          if (SDFController_rdState == 2'b01) begin
            SDFController_multjState_next = 2'b11;
            SDFController_multiply_J_reg_next = 1'b1;
          end
        end
      2'b11 :
        begin
          if (SDFController_rdState == 2'b01) begin
            SDFController_multjState_next = 2'b11;
            SDFController_multiply_J_reg_next = 1'b1;
          end
          else begin
            SDFController_multiply_J_reg_next = 1'b0;
            SDFController_multjState_next = 2'b00;
          end
        end
      default :
        begin
          SDFController_multjState_next = 2'b00;
          SDFController_multiply_J_reg_next = 1'b0;
        end
    endcase
    case ( SDFController_rdState)
      2'b00 :
        begin
          SDFController_rdState_next = 2'b00;
          SDFController_rdAddr_reg_next = 5'b00000;
          rd_1_Enb_1 = 1'b0;
          if (dinXTwdl_1_1_vld && (SDFController_wrCount == 5'b11111)) begin
            SDFController_rdState_next = 2'b01;
          end
        end
      2'b01 :
        begin
          SDFController_rdState_next = 2'b01;
          rd_1_Enb_1 = dinXTwdl_1_1_vld_1;
          if (dinXTwdl_1_1_vld_1) begin
            if (SDFController_rdAddr_reg == 5'b11111) begin
              SDFController_rdState_next = 2'b10;
            end
            SDFController_rdAddr_reg_next = SDFController_rdAddr_reg + 5'b00001;
          end
        end
      2'b10 :
        begin
          rd_1_Enb_1 = 1'b1;
          if (SDFController_rdAddr_reg == 5'b11111) begin
            if (dinXTwdl_1_1_vld && (SDFController_wrCount == 5'b11111)) begin
              SDFController_rdState_next = 2'b01;
            end
            else begin
              SDFController_rdState_next = 2'b00;
            end
          end
          SDFController_rdAddr_reg_next = SDFController_rdAddr_reg + 5'b00001;
        end
      default :
        begin
          SDFController_rdState_next = 2'b00;
          SDFController_rdAddr_reg_next = 5'b00000;
          rd_1_Enb_1 = 1'b0;
        end
    endcase
    case ( SDFController_wrState)
      2'b00 :
        begin
          SDFController_wrState_next = 2'b00;
          SDFController_wrCount_next = 5'b00000;
          SDFController_procEnb_reg_next = 1'b0;
          if (dinXTwdl_1_1_vld) begin
            SDFController_wrState_next = 2'b01;
            SDFController_wrCount_next = 5'b00001;
          end
        end
      2'b01 :
        begin
          SDFController_wrState_next = 2'b01;
          SDFController_procEnb_reg_next = 1'b0;
          if (dinXTwdl_1_1_vld) begin
            if (SDFController_wrCount == 5'b11111) begin
              SDFController_wrState_next = 2'b10;
              SDFController_procEnb_reg_next = 1'b1;
            end
            else begin
              SDFController_wrState_next = 2'b01;
            end
            SDFController_wrCount_next = SDFController_wrCount + 5'b00001;
          end
        end
      2'b10 :
        begin
          SDFController_wrState_next = 2'b10;
          if (dinXTwdl_1_1_vld) begin
            if (SDFController_wrCount == 5'b11111) begin
              SDFController_wrState_next = 2'b01;
              SDFController_procEnb_reg_next = 1'b0;
            end
            else begin
              SDFController_wrState_next = 2'b10;
              SDFController_procEnb_reg_next = 1'b1;
            end
            SDFController_wrCount_next = SDFController_wrCount + 5'b00001;
          end
        end
      default :
        begin
          SDFController_wrState_next = 2'b00;
          SDFController_wrCount_next = 5'b11111;
          SDFController_procEnb_reg_next = 1'b0;
        end
    endcase
    rd_1_Addr_1 = SDFController_rdAddr_reg;
    proc_1_enb_1 = SDFController_procEnb_reg;
    multiply_1_J = SDFController_multiply_J_reg;
  end



  assign rd_1_Addr = rd_1_Addr_1;

  assign rd_1_Enb = rd_1_Enb_1;

  assign proc_1_enb = proc_1_enb_1;

endmodule  // RADIX22FFT_CTRL1_1

