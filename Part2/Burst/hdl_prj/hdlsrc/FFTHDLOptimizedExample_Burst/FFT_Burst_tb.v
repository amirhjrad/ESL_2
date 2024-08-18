// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\FFTHDLOptimizedExample_Burst\FFT_Burst_tb.v
// Created: 2024-05-11 18:32:20
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 1
// Target subsystem base rate: 1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: FFT_Burst_tb
// Source Path: 
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module FFT_Burst_tb;



  reg  clk;
  reg  reset;
  wire enb;
  wire Ready_done;  // ufix1
  wire rdEnb;
  wire Ready_done_enb;  // ufix1
  reg [14:0] DataOut_re_addr;  // ufix15
  wire Ready_lastAddr;  // ufix1
  wire resetn;
  reg  check3_done;  // ufix1
  wire ValidOut_done;  // ufix1
  wire ValidOut_done_enb;  // ufix1
  wire ValidOut_lastAddr;  // ufix1
  reg  check2_done;  // ufix1
  wire DataOut_re_done;  // ufix1
  wire DataOut_re_done_enb;  // ufix1
  wire DataOut_re_active;  // ufix1
  wire snkDone;
  wire snkDonen;
  wire tb_enb;
  wire ce_out;
  wire DataOut_re_enb;  // ufix1
  wire DataOut_re_lastAddr;  // ufix1
  reg  check1_done;  // ufix1
  reg [14:0] Source_out1_addr;  // ufix15
  wire Source_out1_active;  // ufix1
  wire Source_out1_enb;  // ufix1
  wire [14:0] Source_out1_addr_delay_1;  // ufix15
  reg signed [31:0] fp_DataIn_re;  // sfix32
  reg signed [15:0] rawData_DataIn_re;  // sfix16_En13
  reg signed [31:0] status_DataIn_re;  // sfix32
  reg signed [15:0] holdData_DataIn_re;  // sfix16_En13
  reg signed [15:0] DataIn_re_offset;  // sfix16_En13
  wire signed [15:0] DataIn_re;  // sfix16_En13
  wire signed [15:0] rawData_DataIn_im;  // sfix16_En13
  reg signed [15:0] holdData_DataIn_im;  // sfix16_En13
  reg signed [15:0] DataIn_im_offset;  // sfix16_En13
  wire signed [15:0] DataIn_im_1;  // sfix16_En13
  wire [14:0] Source_out2_addr_delay_1;  // ufix15
  reg signed [31:0] fp_ValidIn;  // sfix32
  reg  rawData_ValidIn;
  reg signed [31:0] status_ValidIn;  // sfix32
  reg  holdData_ValidIn;
  reg  ValidIn_offset;
  wire ValidIn;
  wire signed [24:0] DataOut_re;  // sfix25_En13
  wire signed [24:0] DataOut_im;  // sfix25_En13
  wire ValidOut;
  wire Ready;
  wire [14:0] DataOut_re_addr_delay_1;  // ufix15
  reg signed [31:0] fp_DataOut_re_expected;  // sfix32
  reg signed [24:0] DataOut_re_expected;  // sfix25_En13
  reg signed [31:0] status_DataOut_re_expected;  // sfix32
  wire signed [24:0] DataOut_re_ref;  // sfix25_En13
  reg  DataOut_re_testFailure;  // ufix1
  reg signed [31:0] fp_DataOut_im_expected;  // sfix32
  reg signed [24:0] DataOut_im_expected;  // sfix25_En13
  reg signed [31:0] status_DataOut_im_expected;  // sfix32
  wire signed [24:0] DataOut_im_ref;  // sfix25_En13
  reg  DataOut_im_testFailure;  // ufix1
  wire [14:0] ValidOut_addr_delay_1;  // ufix15
  reg signed [31:0] fp_ValidOut_expected;  // sfix32
  reg  ValidOut_expected;
  reg signed [31:0] status_ValidOut_expected;  // sfix32
  wire ValidOut_ref;
  reg  ValidOut_testFailure;  // ufix1
  wire [14:0] Ready_addr_delay_1;  // ufix15
  reg signed [31:0] fp_Ready_expected;  // sfix32
  reg  Ready_expected;
  reg signed [31:0] status_Ready_expected;  // sfix32
  wire Ready_ref;
  reg  Ready_testFailure;  // ufix1
  wire testFailure;  // ufix1


  assign Ready_done_enb = Ready_done & rdEnb;



  assign Ready_lastAddr = DataOut_re_addr >= 15'b110000000000000;



  assign Ready_done = Ready_lastAddr & resetn;



  // Delay to allow last sim cycle to complete
  always @(posedge clk or posedge reset)
    begin : checkDone_3
      if (reset) begin
        check3_done <= 0;
      end
      else begin
        if (Ready_done_enb) begin
          check3_done <= Ready_done;
        end
      end
    end

  assign ValidOut_done_enb = ValidOut_done & rdEnb;



  assign ValidOut_lastAddr = DataOut_re_addr >= 15'b110000000000000;



  assign ValidOut_done = ValidOut_lastAddr & resetn;



  // Delay to allow last sim cycle to complete
  always @(posedge clk or posedge reset)
    begin : checkDone_2
      if (reset) begin
        check2_done <= 0;
      end
      else begin
        if (ValidOut_done_enb) begin
          check2_done <= ValidOut_done;
        end
      end
    end

  assign DataOut_re_done_enb = DataOut_re_done & rdEnb;



  assign DataOut_re_active = DataOut_re_addr != 15'b110000000000000;



  assign #2 enb = rdEnb;

  assign snkDonen =  ~ snkDone;



  always 
    begin : clk_gen
      clk <= 1'b1;
      # (5);
      clk <= 1'b0;
      # (5);
      if (snkDone == 1'b1) begin
        clk <= 1'b1;
        # (5);
        clk <= 1'b0;
        # (5);
        $stop;
      end
    end

  initial
    begin : reset_gen
      reset <= 1'b1;
      # (20);
      @ (posedge clk)
      # (2);
      reset <= 1'b0;
    end

  assign resetn =  ~ reset;



  assign tb_enb = resetn & snkDonen;



  assign rdEnb = (snkDone == 1'b0 ? tb_enb :
              1'b0);



  assign ce_out = enb & (rdEnb & tb_enb);



  assign DataOut_re_enb = ce_out & DataOut_re_active;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 24576
  always @(posedge clk or posedge reset)
    begin : c_2_process
      if (reset == 1'b1) begin
        DataOut_re_addr <= 15'b000000000000000;
      end
      else begin
        if (DataOut_re_enb) begin
          if (DataOut_re_addr >= 15'b110000000000000) begin
            DataOut_re_addr <= 15'b000000000000000;
          end
          else begin
            DataOut_re_addr <= DataOut_re_addr + 15'b000000000000001;
          end
        end
      end
    end



  assign DataOut_re_lastAddr = DataOut_re_addr >= 15'b110000000000000;



  assign DataOut_re_done = DataOut_re_lastAddr & resetn;



  // Delay to allow last sim cycle to complete
  always @(posedge clk or posedge reset)
    begin : checkDone_1
      if (reset) begin
        check1_done <= 0;
      end
      else begin
        if (DataOut_re_done_enb) begin
          check1_done <= DataOut_re_done;
        end
      end
    end

  assign snkDone = check3_done & (check1_done & check2_done);



  assign Source_out1_active = Source_out1_addr != 15'b110000000000000;



  assign Source_out1_enb = Source_out1_active & (rdEnb & tb_enb);



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 24576
  always @(posedge clk or posedge reset)
    begin : Source_process
      if (reset == 1'b1) begin
        Source_out1_addr <= 15'b000000000000000;
      end
      else begin
        if (Source_out1_enb) begin
          if (Source_out1_addr >= 15'b110000000000000) begin
            Source_out1_addr <= 15'b000000000000000;
          end
          else begin
            Source_out1_addr <= Source_out1_addr + 15'b000000000000001;
          end
        end
      end
    end



  assign #1 Source_out1_addr_delay_1 = Source_out1_addr;

  // Data source for DataIn_re
  initial
    begin : DataIn_re_fileread
      fp_DataIn_re = $fopen("DataIn_re.dat", "r");
      status_DataIn_re = $rewind(fp_DataIn_re);
    end

  always @(Source_out1_addr_delay_1, rdEnb, tb_enb)
    begin
      if (tb_enb == 0) begin
        rawData_DataIn_re <= 16'bx;
      end
      else if (rdEnb == 1) begin
        status_DataIn_re = $fscanf(fp_DataIn_re, "%h", rawData_DataIn_re);
      end
    end

  // holdData reg for Source_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Source_out1
      if (reset) begin
        holdData_DataIn_re <= 16'bx;
      end
      else begin
        holdData_DataIn_re <= rawData_DataIn_re;
      end
    end

  always @(rawData_DataIn_re or rdEnb)
    begin : stimuli_Source_out1_1
      if (rdEnb == 1'b0) begin
        DataIn_re_offset <= holdData_DataIn_re;
      end
      else begin
        DataIn_re_offset <= rawData_DataIn_re;
      end
    end

  assign #2 DataIn_re = DataIn_re_offset;

  // Data source for DataIn_im
  assign rawData_DataIn_im = 16'sb0000000000000000;



  // holdData reg for Source_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Source_out1_2
      if (reset) begin
        holdData_DataIn_im <= 16'bx;
      end
      else begin
        holdData_DataIn_im <= rawData_DataIn_im;
      end
    end

  always @(rawData_DataIn_im or rdEnb)
    begin : stimuli_Source_out1_3
      if (rdEnb == 1'b0) begin
        DataIn_im_offset <= holdData_DataIn_im;
      end
      else begin
        DataIn_im_offset <= rawData_DataIn_im;
      end
    end

  assign #2 DataIn_im_1 = DataIn_im_offset;

  assign #1 Source_out2_addr_delay_1 = Source_out1_addr;

  // Data source for ValidIn
  initial
    begin : ValidIn_fileread
      fp_ValidIn = $fopen("ValidIn.dat", "r");
      status_ValidIn = $rewind(fp_ValidIn);
    end

  always @(Source_out2_addr_delay_1, rdEnb, tb_enb)
    begin
      if (tb_enb == 0) begin
        rawData_ValidIn <= 1'bx;
      end
      else if (rdEnb == 1) begin
        status_ValidIn = $fscanf(fp_ValidIn, "%h", rawData_ValidIn);
      end
    end

  // holdData reg for Source_out2
  always @(posedge clk or posedge reset)
    begin : stimuli_Source_out2
      if (reset) begin
        holdData_ValidIn <= 1'bx;
      end
      else begin
        holdData_ValidIn <= rawData_ValidIn;
      end
    end

  always @(rawData_ValidIn or rdEnb)
    begin : stimuli_Source_out2_1
      if (rdEnb == 1'b0) begin
        ValidIn_offset <= holdData_ValidIn;
      end
      else begin
        ValidIn_offset <= rawData_ValidIn;
      end
    end

  assign #2 ValidIn = ValidIn_offset;

  FFT_Burst u_FFT_Burst (.clk(clk),
                         .reset(reset),
                         .DataIn_re(DataIn_re),  // sfix16_En13
                         .DataIn_im(DataIn_im_1),  // sfix16_En13
                         .ValidIn(ValidIn),
                         .DataOut_re(DataOut_re),  // sfix25_En13
                         .DataOut_im(DataOut_im),  // sfix25_En13
                         .ValidOut(ValidOut),
                         .Ready(Ready)
                         );

  assign #1 DataOut_re_addr_delay_1 = DataOut_re_addr;

  // Data source for DataOut_re_expected
  initial
    begin : DataOut_re_expected_fileread
      fp_DataOut_re_expected = $fopen("DataOut_re_expected.dat", "r");
      status_DataOut_re_expected = $rewind(fp_DataOut_re_expected);
    end

  always @(DataOut_re_addr_delay_1, rdEnb, tb_enb)
    begin
      if (tb_enb == 0) begin
        DataOut_re_expected <= 25'bx;
      end
      else if (rdEnb == 1) begin
        status_DataOut_re_expected = $fscanf(fp_DataOut_re_expected, "%h", DataOut_re_expected);
      end
    end

  assign DataOut_re_ref = DataOut_re_expected;

  always @(posedge clk or posedge reset)
    begin : DataOut_re_checker
      if (reset == 1'b1) begin
        DataOut_re_testFailure <= 1'b0;
      end
      else begin
        if (ce_out == 1'b1 && DataOut_re !== DataOut_re_ref) begin
          DataOut_re_testFailure <= 1'b1;
          $display("ERROR in DataOut_re at time %t : Expected '%h' Actual '%h'", $time, DataOut_re_ref, DataOut_re);
        end
      end
    end

  // Data source for DataOut_im_expected
  initial
    begin : DataOut_im_expected_fileread
      fp_DataOut_im_expected = $fopen("DataOut_im_expected.dat", "r");
      status_DataOut_im_expected = $rewind(fp_DataOut_im_expected);
    end

  always @(DataOut_re_addr_delay_1, rdEnb, tb_enb)
    begin
      if (tb_enb == 0) begin
        DataOut_im_expected <= 25'bx;
      end
      else if (rdEnb == 1) begin
        status_DataOut_im_expected = $fscanf(fp_DataOut_im_expected, "%h", DataOut_im_expected);
      end
    end

  assign DataOut_im_ref = DataOut_im_expected;

  always @(posedge clk or posedge reset)
    begin : DataOut_im_checker
      if (reset == 1'b1) begin
        DataOut_im_testFailure <= 1'b0;
      end
      else begin
        if (ce_out == 1'b1 && DataOut_im !== DataOut_im_ref) begin
          DataOut_im_testFailure <= 1'b1;
          $display("ERROR in DataOut_im at time %t : Expected '%h' Actual '%h'", $time, DataOut_im_ref, DataOut_im);
        end
      end
    end

  assign #1 ValidOut_addr_delay_1 = DataOut_re_addr;

  // Data source for ValidOut_expected
  initial
    begin : ValidOut_expected_fileread
      fp_ValidOut_expected = $fopen("ValidOut_expected.dat", "r");
      status_ValidOut_expected = $rewind(fp_ValidOut_expected);
    end

  always @(ValidOut_addr_delay_1, ce_out, tb_enb)
    begin
      if (tb_enb == 0) begin
        ValidOut_expected <= 1'bx;
      end
      else if (ce_out == 1) begin
        status_ValidOut_expected = $fscanf(fp_ValidOut_expected, "%h", ValidOut_expected);
      end
    end

  assign ValidOut_ref = ValidOut_expected;

  always @(posedge clk or posedge reset)
    begin : ValidOut_checker
      if (reset == 1'b1) begin
        ValidOut_testFailure <= 1'b0;
      end
      else begin
        if (ce_out == 1'b1 && ValidOut !== ValidOut_ref) begin
          ValidOut_testFailure <= 1'b1;
          $display("ERROR in ValidOut at time %t : Expected '%h' Actual '%h'", $time, ValidOut_ref, ValidOut);
        end
      end
    end

  assign #1 Ready_addr_delay_1 = DataOut_re_addr;

  // Data source for Ready_expected
  initial
    begin : Ready_expected_fileread
      fp_Ready_expected = $fopen("Ready_expected.dat", "r");
      status_Ready_expected = $rewind(fp_Ready_expected);
    end

  always @(Ready_addr_delay_1, ce_out, tb_enb)
    begin
      if (tb_enb == 0) begin
        Ready_expected <= 1'bx;
      end
      else if (ce_out == 1) begin
        status_Ready_expected = $fscanf(fp_Ready_expected, "%h", Ready_expected);
      end
    end

  assign Ready_ref = Ready_expected;

  always @(posedge clk or posedge reset)
    begin : Ready_checker
      if (reset == 1'b1) begin
        Ready_testFailure <= 1'b0;
      end
      else begin
        if (ce_out == 1'b1 && Ready !== Ready_ref) begin
          Ready_testFailure <= 1'b1;
          $display("ERROR in Ready at time %t : Expected '%h' Actual '%h'", $time, Ready_ref, Ready);
        end
      end
    end

  assign testFailure = Ready_testFailure | (ValidOut_testFailure | (DataOut_re_testFailure | DataOut_im_testFailure));



  always @(posedge clk)
    begin : completed_msg
      if (snkDone == 1'b1) begin
        if (testFailure == 1'b0) begin
          $display("**************TEST COMPLETED (PASSED)**************");
        end
        else begin
          $display("**************TEST COMPLETED (FAILED)**************");
        end
      end
    end

endmodule  // FFT_Burst_tb

