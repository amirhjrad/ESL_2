// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\FFTHDLOptimizedExample_Streaming\TWDLROM_3_8.v
// Created: 2024-05-11 19:34:42
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: TWDLROM_3_8
// Source Path: FFTHDLOptimizedExample_Streaming/FFT Streaming/FFT/TWDLROM_3_8
// Hierarchy Level: 2
// Model version: 8.0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module TWDLROM_3_8
          (clk,
           reset,
           dout_2_1_vld,
           twdl_3_8_re,
           twdl_3_8_im);


  input   clk;
  input   reset;
  input   dout_2_1_vld;
  output  signed [15:0] twdl_3_8_re;  // sfix16_En14
  output  signed [15:0] twdl_3_8_im;  // sfix16_En14


  reg [6:0] Radix22TwdlMapping_cnt;  // ufix7
  reg [1:0] Radix22TwdlMapping_phase;  // ufix2
  reg [2:0] Radix22TwdlMapping_octantReg1;  // ufix3
  reg [8:0] Radix22TwdlMapping_twdlAddr_raw;  // ufix9
  reg [5:0] Radix22TwdlMapping_twdlAddrMap;  // ufix6
  reg  Radix22TwdlMapping_twdl45Reg;
  reg  Radix22TwdlMapping_dvldReg1;
  reg  Radix22TwdlMapping_dvldReg2;
  reg [6:0] Radix22TwdlMapping_cnt_next;  // ufix7
  reg [1:0] Radix22TwdlMapping_phase_next;  // ufix2
  reg [2:0] Radix22TwdlMapping_octantReg1_next;  // ufix3
  reg [8:0] Radix22TwdlMapping_twdlAddr_raw_next;  // ufix9
  reg [5:0] Radix22TwdlMapping_twdlAddrMap_next;  // ufix6
  reg  Radix22TwdlMapping_twdl45Reg_next;
  reg  Radix22TwdlMapping_dvldReg1_next;
  reg  Radix22TwdlMapping_dvldReg2_next;
  reg [5:0] twdlAddr;  // ufix6
  reg  twdlAddrVld;
  reg [2:0] twdlOctant;  // ufix3
  reg  twdl45;
  wire signed [15:0] Twiddle_re_table_data [0:63];  // sfix16_En14 [64]
  wire signed [15:0] twiddleS_re;  // sfix16_En14
  reg signed [15:0] twiddleReg_re;  // sfix16_En14
  wire signed [15:0] Twiddle_im_table_data [0:63];  // sfix16_En14 [64]
  wire signed [15:0] twiddleS_im;  // sfix16_En14
  reg signed [15:0] twiddleReg_im;  // sfix16_En14
  reg [2:0] twdlOctantReg;  // ufix3
  reg  twdl45Reg;
  reg signed [15:0] twdl_3_8_re_1;  // sfix16_En14
  reg signed [15:0] twdl_3_8_im_1;  // sfix16_En14
  reg [2:0] Radix22TwdlMapping_octant;  // ufix3
  reg [8:0] Radix22TwdlMapping_cnt_cast;  // ufix9
  reg signed [19:0] Radix22TwdlMapping_sub_cast;  // sfix20_En6
  reg signed [19:0] Radix22TwdlMapping_sub_temp;  // sfix20_En6
  reg signed [10:0] Radix22TwdlMapping_sub_temp_0;  // sfix11
  reg signed [10:0] Radix22TwdlMapping_sub_temp_1;  // sfix11
  reg signed [19:0] Radix22TwdlMapping_sub_cast_0;  // sfix20_En6
  reg signed [19:0] Radix22TwdlMapping_sub_temp_2;  // sfix20_En6
  reg signed [19:0] Radix22TwdlMapping_sub_cast_1;  // sfix20_En6
  reg signed [19:0] Radix22TwdlMapping_sub_temp_3;  // sfix20_En6
  reg [8:0] Radix22TwdlMapping_t_0_0;  // ufix9
  reg signed [10:0] Radix22TwdlMapping_t_1;  // sfix11
  reg signed [10:0] Radix22TwdlMapping_t_2_0;  // sfix11
  reg signed [15:0] Radix22TwdlOctCorr_twdlIn_re;  // sfix16_En14
  reg signed [15:0] Radix22TwdlOctCorr_twdlIn_im;  // sfix16_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_0;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_1;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_2;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_3;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_4;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_5;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_6;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_7;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_8;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_9;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_10;  // sfix17_En14


  // Radix22TwdlMapping
  always @(posedge clk or posedge reset)
    begin : Radix22TwdlMapping_process
      if (reset == 1'b1) begin
        Radix22TwdlMapping_octantReg1 <= 3'b000;
        Radix22TwdlMapping_twdlAddr_raw <= 9'b000000000;
        Radix22TwdlMapping_twdlAddrMap <= 6'b000000;
        Radix22TwdlMapping_twdl45Reg <= 1'b0;
        Radix22TwdlMapping_dvldReg1 <= 1'b0;
        Radix22TwdlMapping_dvldReg2 <= 1'b0;
        Radix22TwdlMapping_cnt <= 7'b0000111;
        Radix22TwdlMapping_phase <= 2'b00;
      end
      else begin
        Radix22TwdlMapping_cnt <= Radix22TwdlMapping_cnt_next;
        Radix22TwdlMapping_phase <= Radix22TwdlMapping_phase_next;
        Radix22TwdlMapping_octantReg1 <= Radix22TwdlMapping_octantReg1_next;
        Radix22TwdlMapping_twdlAddr_raw <= Radix22TwdlMapping_twdlAddr_raw_next;
        Radix22TwdlMapping_twdlAddrMap <= Radix22TwdlMapping_twdlAddrMap_next;
        Radix22TwdlMapping_twdl45Reg <= Radix22TwdlMapping_twdl45Reg_next;
        Radix22TwdlMapping_dvldReg1 <= Radix22TwdlMapping_dvldReg1_next;
        Radix22TwdlMapping_dvldReg2 <= Radix22TwdlMapping_dvldReg2_next;
      end
    end

  always @(Radix22TwdlMapping_cnt, Radix22TwdlMapping_dvldReg1,
       Radix22TwdlMapping_dvldReg2, Radix22TwdlMapping_octantReg1,
       Radix22TwdlMapping_phase, Radix22TwdlMapping_twdl45Reg,
       Radix22TwdlMapping_twdlAddrMap, Radix22TwdlMapping_twdlAddr_raw,
       dout_2_1_vld) begin
    Radix22TwdlMapping_sub_temp = 20'sb00000000000000000000;
    Radix22TwdlMapping_sub_temp_0 = 11'sb00000000000;
    Radix22TwdlMapping_sub_temp_1 = 11'sb00000000000;
    Radix22TwdlMapping_sub_temp_2 = 20'sb00000000000000000000;
    Radix22TwdlMapping_sub_temp_3 = 20'sb00000000000000000000;
    Radix22TwdlMapping_sub_cast_1 = 20'sb00000000000000000000;
    Radix22TwdlMapping_t_0_0 = 9'b000000000;
    Radix22TwdlMapping_cnt_cast = 9'b000000000;
    Radix22TwdlMapping_sub_cast_0 = 20'sb00000000000000000000;
    Radix22TwdlMapping_t_2_0 = 11'sb00000000000;
    Radix22TwdlMapping_t_1 = 11'sb00000000000;
    Radix22TwdlMapping_sub_cast = 20'sb00000000000000000000;
    Radix22TwdlMapping_cnt_next = Radix22TwdlMapping_cnt;
    Radix22TwdlMapping_phase_next = Radix22TwdlMapping_phase;
    Radix22TwdlMapping_dvldReg2_next = Radix22TwdlMapping_dvldReg1;
    Radix22TwdlMapping_dvldReg1_next = dout_2_1_vld;
    case ( Radix22TwdlMapping_twdlAddr_raw)
      9'b001000000 :
        begin
          Radix22TwdlMapping_octant = 3'b000;
          Radix22TwdlMapping_twdl45Reg_next = 1'b1;
        end
      9'b010000000 :
        begin
          Radix22TwdlMapping_octant = 3'b001;
          Radix22TwdlMapping_twdl45Reg_next = 1'b0;
        end
      9'b011000000 :
        begin
          Radix22TwdlMapping_octant = 3'b010;
          Radix22TwdlMapping_twdl45Reg_next = 1'b1;
        end
      9'b100000000 :
        begin
          Radix22TwdlMapping_octant = 3'b011;
          Radix22TwdlMapping_twdl45Reg_next = 1'b0;
        end
      9'b101000000 :
        begin
          Radix22TwdlMapping_octant = 3'b100;
          Radix22TwdlMapping_twdl45Reg_next = 1'b1;
        end
      default :
        begin
          Radix22TwdlMapping_octant = Radix22TwdlMapping_twdlAddr_raw[8:6];
          Radix22TwdlMapping_twdl45Reg_next = 1'b0;
        end
    endcase
    Radix22TwdlMapping_octantReg1_next = Radix22TwdlMapping_octant;
    case ( Radix22TwdlMapping_octant)
      3'b000 :
        begin
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_twdlAddr_raw[5:0];
        end
      3'b001 :
        begin
          Radix22TwdlMapping_t_1 = {2'b0, Radix22TwdlMapping_twdlAddr_raw};
          Radix22TwdlMapping_sub_temp_0 = 11'sb00010000000 - Radix22TwdlMapping_t_1;
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_sub_temp_0[5:0];
        end
      3'b010 :
        begin
          Radix22TwdlMapping_t_2_0 = {2'b0, Radix22TwdlMapping_twdlAddr_raw};
          Radix22TwdlMapping_sub_temp_1 = Radix22TwdlMapping_t_2_0 - 11'sb00010000000;
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_sub_temp_1[5:0];
        end
      3'b011 :
        begin
          Radix22TwdlMapping_sub_cast_0 = {5'b0, {Radix22TwdlMapping_twdlAddr_raw, 6'b000000}};
          Radix22TwdlMapping_sub_temp_2 = 20'sb00000100000000000000 - Radix22TwdlMapping_sub_cast_0;
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_sub_temp_2[11:6];
        end
      3'b100 :
        begin
          Radix22TwdlMapping_sub_cast_1 = {5'b0, {Radix22TwdlMapping_twdlAddr_raw, 6'b000000}};
          Radix22TwdlMapping_sub_temp_3 = Radix22TwdlMapping_sub_cast_1 - 20'sb00000100000000000000;
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_sub_temp_3[11:6];
        end
      default :
        begin
          Radix22TwdlMapping_sub_cast = {5'b0, {Radix22TwdlMapping_twdlAddr_raw, 6'b000000}};
          Radix22TwdlMapping_sub_temp = 20'sb00000110000000000000 - Radix22TwdlMapping_sub_cast;
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_sub_temp[11:6];
        end
    endcase
    if (Radix22TwdlMapping_phase == 2'b00) begin
      Radix22TwdlMapping_twdlAddr_raw_next = 9'b000000000;
    end
    else if (Radix22TwdlMapping_phase == 2'b01) begin
      Radix22TwdlMapping_t_0_0 = {2'b0, Radix22TwdlMapping_cnt};
      Radix22TwdlMapping_twdlAddr_raw_next = Radix22TwdlMapping_t_0_0 <<< 8'd1;
    end
    else if (Radix22TwdlMapping_phase == 2'b10) begin
      Radix22TwdlMapping_twdlAddr_raw_next = {2'b0, Radix22TwdlMapping_cnt};
    end
    else begin
      Radix22TwdlMapping_cnt_cast = {2'b0, Radix22TwdlMapping_cnt};
      Radix22TwdlMapping_twdlAddr_raw_next = (Radix22TwdlMapping_cnt_cast <<< 8'd1) + Radix22TwdlMapping_cnt_cast;
    end
    if (dout_2_1_vld && (Radix22TwdlMapping_cnt > 7'b1110111)) begin
      Radix22TwdlMapping_phase_next = Radix22TwdlMapping_phase + 2'b01;
    end
    if (dout_2_1_vld) begin
      Radix22TwdlMapping_cnt_next = Radix22TwdlMapping_cnt + 7'b0001000;
    end
    twdlAddr = Radix22TwdlMapping_twdlAddrMap;
    twdlAddrVld = Radix22TwdlMapping_dvldReg2;
    twdlOctant = Radix22TwdlMapping_octantReg1;
    twdl45 = Radix22TwdlMapping_twdl45Reg;
  end



  // Twiddle ROM1
  assign Twiddle_re_table_data[0] = 16'sb0100000000000000;
  assign Twiddle_re_table_data[1] = 16'sb0011111111111111;
  assign Twiddle_re_table_data[2] = 16'sb0011111111111011;
  assign Twiddle_re_table_data[3] = 16'sb0011111111110101;
  assign Twiddle_re_table_data[4] = 16'sb0011111111101100;
  assign Twiddle_re_table_data[5] = 16'sb0011111111100001;
  assign Twiddle_re_table_data[6] = 16'sb0011111111010100;
  assign Twiddle_re_table_data[7] = 16'sb0011111111000100;
  assign Twiddle_re_table_data[8] = 16'sb0011111110110001;
  assign Twiddle_re_table_data[9] = 16'sb0011111110011100;
  assign Twiddle_re_table_data[10] = 16'sb0011111110000101;
  assign Twiddle_re_table_data[11] = 16'sb0011111101101011;
  assign Twiddle_re_table_data[12] = 16'sb0011111101001111;
  assign Twiddle_re_table_data[13] = 16'sb0011111100110000;
  assign Twiddle_re_table_data[14] = 16'sb0011111100001111;
  assign Twiddle_re_table_data[15] = 16'sb0011111011101011;
  assign Twiddle_re_table_data[16] = 16'sb0011111011000101;
  assign Twiddle_re_table_data[17] = 16'sb0011111010011101;
  assign Twiddle_re_table_data[18] = 16'sb0011111001110010;
  assign Twiddle_re_table_data[19] = 16'sb0011111001000101;
  assign Twiddle_re_table_data[20] = 16'sb0011111000010101;
  assign Twiddle_re_table_data[21] = 16'sb0011110111100011;
  assign Twiddle_re_table_data[22] = 16'sb0011110110101111;
  assign Twiddle_re_table_data[23] = 16'sb0011110101111000;
  assign Twiddle_re_table_data[24] = 16'sb0011110100111111;
  assign Twiddle_re_table_data[25] = 16'sb0011110100000011;
  assign Twiddle_re_table_data[26] = 16'sb0011110011000101;
  assign Twiddle_re_table_data[27] = 16'sb0011110010000101;
  assign Twiddle_re_table_data[28] = 16'sb0011110001000010;
  assign Twiddle_re_table_data[29] = 16'sb0011101111111101;
  assign Twiddle_re_table_data[30] = 16'sb0011101110110110;
  assign Twiddle_re_table_data[31] = 16'sb0011101101101101;
  assign Twiddle_re_table_data[32] = 16'sb0011101100100001;
  assign Twiddle_re_table_data[33] = 16'sb0011101011010011;
  assign Twiddle_re_table_data[34] = 16'sb0011101010000010;
  assign Twiddle_re_table_data[35] = 16'sb0011101000110000;
  assign Twiddle_re_table_data[36] = 16'sb0011100111011011;
  assign Twiddle_re_table_data[37] = 16'sb0011100110000100;
  assign Twiddle_re_table_data[38] = 16'sb0011100100101011;
  assign Twiddle_re_table_data[39] = 16'sb0011100011001111;
  assign Twiddle_re_table_data[40] = 16'sb0011100001110001;
  assign Twiddle_re_table_data[41] = 16'sb0011100000010010;
  assign Twiddle_re_table_data[42] = 16'sb0011011110110000;
  assign Twiddle_re_table_data[43] = 16'sb0011011101001011;
  assign Twiddle_re_table_data[44] = 16'sb0011011011100101;
  assign Twiddle_re_table_data[45] = 16'sb0011011001111101;
  assign Twiddle_re_table_data[46] = 16'sb0011011000010010;
  assign Twiddle_re_table_data[47] = 16'sb0011010110100101;
  assign Twiddle_re_table_data[48] = 16'sb0011010100110111;
  assign Twiddle_re_table_data[49] = 16'sb0011010011000110;
  assign Twiddle_re_table_data[50] = 16'sb0011010001010011;
  assign Twiddle_re_table_data[51] = 16'sb0011001111011111;
  assign Twiddle_re_table_data[52] = 16'sb0011001101101000;
  assign Twiddle_re_table_data[53] = 16'sb0011001011101111;
  assign Twiddle_re_table_data[54] = 16'sb0011001001110100;
  assign Twiddle_re_table_data[55] = 16'sb0011000111111000;
  assign Twiddle_re_table_data[56] = 16'sb0011000101111001;
  assign Twiddle_re_table_data[57] = 16'sb0011000011111001;
  assign Twiddle_re_table_data[58] = 16'sb0011000001110110;
  assign Twiddle_re_table_data[59] = 16'sb0010111111110010;
  assign Twiddle_re_table_data[60] = 16'sb0010111101101100;
  assign Twiddle_re_table_data[61] = 16'sb0010111011100100;
  assign Twiddle_re_table_data[62] = 16'sb0010111001011010;
  assign Twiddle_re_table_data[63] = 16'sb0010110111001111;
  assign twiddleS_re = Twiddle_re_table_data[twdlAddr];



  always @(posedge clk or posedge reset)
    begin : TWIDDLEROM_RE_process
      if (reset == 1'b1) begin
        twiddleReg_re <= 16'sb0000000000000000;
      end
      else begin
        twiddleReg_re <= twiddleS_re;
      end
    end



  // Twiddle ROM2
  assign Twiddle_im_table_data[0] = 16'sb0000000000000000;
  assign Twiddle_im_table_data[1] = 16'sb1111111100110111;
  assign Twiddle_im_table_data[2] = 16'sb1111111001101110;
  assign Twiddle_im_table_data[3] = 16'sb1111110110100101;
  assign Twiddle_im_table_data[4] = 16'sb1111110011011100;
  assign Twiddle_im_table_data[5] = 16'sb1111110000010011;
  assign Twiddle_im_table_data[6] = 16'sb1111101101001011;
  assign Twiddle_im_table_data[7] = 16'sb1111101010000010;
  assign Twiddle_im_table_data[8] = 16'sb1111100110111010;
  assign Twiddle_im_table_data[9] = 16'sb1111100011110010;
  assign Twiddle_im_table_data[10] = 16'sb1111100000101010;
  assign Twiddle_im_table_data[11] = 16'sb1111011101100011;
  assign Twiddle_im_table_data[12] = 16'sb1111011010011100;
  assign Twiddle_im_table_data[13] = 16'sb1111010111010101;
  assign Twiddle_im_table_data[14] = 16'sb1111010100001111;
  assign Twiddle_im_table_data[15] = 16'sb1111010001001001;
  assign Twiddle_im_table_data[16] = 16'sb1111001110000100;
  assign Twiddle_im_table_data[17] = 16'sb1111001010111111;
  assign Twiddle_im_table_data[18] = 16'sb1111000111111010;
  assign Twiddle_im_table_data[19] = 16'sb1111000100110110;
  assign Twiddle_im_table_data[20] = 16'sb1111000001110011;
  assign Twiddle_im_table_data[21] = 16'sb1110111110110000;
  assign Twiddle_im_table_data[22] = 16'sb1110111011101110;
  assign Twiddle_im_table_data[23] = 16'sb1110111000101101;
  assign Twiddle_im_table_data[24] = 16'sb1110110101101100;
  assign Twiddle_im_table_data[25] = 16'sb1110110010101100;
  assign Twiddle_im_table_data[26] = 16'sb1110101111101101;
  assign Twiddle_im_table_data[27] = 16'sb1110101100101110;
  assign Twiddle_im_table_data[28] = 16'sb1110101001110000;
  assign Twiddle_im_table_data[29] = 16'sb1110100110110100;
  assign Twiddle_im_table_data[30] = 16'sb1110100011110111;
  assign Twiddle_im_table_data[31] = 16'sb1110100000111100;
  assign Twiddle_im_table_data[32] = 16'sb1110011110000010;
  assign Twiddle_im_table_data[33] = 16'sb1110011011001001;
  assign Twiddle_im_table_data[34] = 16'sb1110011000010001;
  assign Twiddle_im_table_data[35] = 16'sb1110010101011001;
  assign Twiddle_im_table_data[36] = 16'sb1110010010100011;
  assign Twiddle_im_table_data[37] = 16'sb1110001111101110;
  assign Twiddle_im_table_data[38] = 16'sb1110001100111010;
  assign Twiddle_im_table_data[39] = 16'sb1110001010000111;
  assign Twiddle_im_table_data[40] = 16'sb1110000111010101;
  assign Twiddle_im_table_data[41] = 16'sb1110000100100100;
  assign Twiddle_im_table_data[42] = 16'sb1110000001110100;
  assign Twiddle_im_table_data[43] = 16'sb1101111111000110;
  assign Twiddle_im_table_data[44] = 16'sb1101111100011001;
  assign Twiddle_im_table_data[45] = 16'sb1101111001101101;
  assign Twiddle_im_table_data[46] = 16'sb1101110111000011;
  assign Twiddle_im_table_data[47] = 16'sb1101110100011001;
  assign Twiddle_im_table_data[48] = 16'sb1101110001110010;
  assign Twiddle_im_table_data[49] = 16'sb1101101111001011;
  assign Twiddle_im_table_data[50] = 16'sb1101101100100110;
  assign Twiddle_im_table_data[51] = 16'sb1101101010000010;
  assign Twiddle_im_table_data[52] = 16'sb1101100111100000;
  assign Twiddle_im_table_data[53] = 16'sb1101100100111111;
  assign Twiddle_im_table_data[54] = 16'sb1101100010100000;
  assign Twiddle_im_table_data[55] = 16'sb1101100000000010;
  assign Twiddle_im_table_data[56] = 16'sb1101011101100110;
  assign Twiddle_im_table_data[57] = 16'sb1101011011001011;
  assign Twiddle_im_table_data[58] = 16'sb1101011000110010;
  assign Twiddle_im_table_data[59] = 16'sb1101010110011011;
  assign Twiddle_im_table_data[60] = 16'sb1101010100000101;
  assign Twiddle_im_table_data[61] = 16'sb1101010001110001;
  assign Twiddle_im_table_data[62] = 16'sb1101001111011111;
  assign Twiddle_im_table_data[63] = 16'sb1101001101001110;
  assign twiddleS_im = Twiddle_im_table_data[twdlAddr];



  always @(posedge clk or posedge reset)
    begin : TWIDDLEROM_IM_process
      if (reset == 1'b1) begin
        twiddleReg_im <= 16'sb0000000000000000;
      end
      else begin
        twiddleReg_im <= twiddleS_im;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        twdlOctantReg <= 3'b000;
      end
      else begin
        twdlOctantReg <= twdlOctant;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_1_process
      if (reset == 1'b1) begin
        twdl45Reg <= 1'b0;
      end
      else begin
        twdl45Reg <= twdl45;
      end
    end



  // Radix22TwdlOctCorr
  always @(twdl45Reg, twdlOctantReg, twiddleReg_im, twiddleReg_re) begin
    Radix22TwdlOctCorr_cast_0 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_2 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_4 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_6 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_8 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_10 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_3 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_9 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_1 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_7 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_5 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_twdlIn_re = twiddleReg_re;
    Radix22TwdlOctCorr_twdlIn_im = twiddleReg_im;
    if (twdl45Reg) begin
      case ( twdlOctantReg)
        3'b000 :
          begin
            Radix22TwdlOctCorr_twdlIn_re = 16'sb0010110101000001;
            Radix22TwdlOctCorr_twdlIn_im = 16'sb1101001010111111;
          end
        3'b010 :
          begin
            Radix22TwdlOctCorr_twdlIn_re = 16'sb1101001010111111;
            Radix22TwdlOctCorr_twdlIn_im = 16'sb1101001010111111;
          end
        3'b100 :
          begin
            Radix22TwdlOctCorr_twdlIn_re = 16'sb1101001010111111;
            Radix22TwdlOctCorr_twdlIn_im = 16'sb0010110101000001;
          end
        default :
          begin
            Radix22TwdlOctCorr_twdlIn_re = 16'sb0010110101000001;
            Radix22TwdlOctCorr_twdlIn_im = 16'sb1101001010111111;
          end
      endcase
    end
    else begin
      case ( twdlOctantReg)
        3'b000 :
          begin
          end
        3'b001 :
          begin
            Radix22TwdlOctCorr_cast = {twiddleReg_im[15], twiddleReg_im};
            Radix22TwdlOctCorr_cast_0 =  - (Radix22TwdlOctCorr_cast);
            Radix22TwdlOctCorr_twdlIn_re = Radix22TwdlOctCorr_cast_0[15:0];
            Radix22TwdlOctCorr_cast_5 = {twiddleReg_re[15], twiddleReg_re};
            Radix22TwdlOctCorr_cast_6 =  - (Radix22TwdlOctCorr_cast_5);
            Radix22TwdlOctCorr_twdlIn_im = Radix22TwdlOctCorr_cast_6[15:0];
          end
        3'b010 :
          begin
            Radix22TwdlOctCorr_twdlIn_re = twiddleReg_im;
            Radix22TwdlOctCorr_cast_7 = {twiddleReg_re[15], twiddleReg_re};
            Radix22TwdlOctCorr_cast_8 =  - (Radix22TwdlOctCorr_cast_7);
            Radix22TwdlOctCorr_twdlIn_im = Radix22TwdlOctCorr_cast_8[15:0];
          end
        3'b011 :
          begin
            Radix22TwdlOctCorr_cast_1 = {twiddleReg_re[15], twiddleReg_re};
            Radix22TwdlOctCorr_cast_2 =  - (Radix22TwdlOctCorr_cast_1);
            Radix22TwdlOctCorr_twdlIn_re = Radix22TwdlOctCorr_cast_2[15:0];
            Radix22TwdlOctCorr_twdlIn_im = twiddleReg_im;
          end
        3'b100 :
          begin
            Radix22TwdlOctCorr_cast_3 = {twiddleReg_re[15], twiddleReg_re};
            Radix22TwdlOctCorr_cast_4 =  - (Radix22TwdlOctCorr_cast_3);
            Radix22TwdlOctCorr_twdlIn_re = Radix22TwdlOctCorr_cast_4[15:0];
            Radix22TwdlOctCorr_cast_9 = {twiddleReg_im[15], twiddleReg_im};
            Radix22TwdlOctCorr_cast_10 =  - (Radix22TwdlOctCorr_cast_9);
            Radix22TwdlOctCorr_twdlIn_im = Radix22TwdlOctCorr_cast_10[15:0];
          end
        default :
          begin
            Radix22TwdlOctCorr_twdlIn_re = twiddleReg_im;
            Radix22TwdlOctCorr_twdlIn_im = twiddleReg_re;
          end
      endcase
    end
    twdl_3_8_re_1 = Radix22TwdlOctCorr_twdlIn_re;
    twdl_3_8_im_1 = Radix22TwdlOctCorr_twdlIn_im;
  end



  assign twdl_3_8_re = twdl_3_8_re_1;

  assign twdl_3_8_im = twdl_3_8_im_1;

endmodule  // TWDLROM_3_8

