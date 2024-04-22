//////////////////////////////////////////////////////////////////////////
/// Author (name and email): Qazi Shahid Ullah, shahidullahqazi@gmail.com
/// Date Created:            30-jan-2024
/// Description:  This module models a two port memory, each port will be 
/// having a single address that can be used for both read and write. This 
/// module will be used for modeling tightly coupled Instruction and Data 
/// Memory.
//////////////////////////////////////////////////////////////////////////


module mem_2p
#(
  parameter DATA_WIDTH        =   32  ,
  parameter ADDR_WIDTH        =   17  ,
  parameter BYTEENABLE_WIDTH  =   DATA_WIDTH/8
)(
  input   logic   clk,
  input   logic   rst_n,

  input   logic                           we_a        ,
  input   logic                           re_a        ,
  input   logic   [ADDR_WIDTH       -1:0] addr_a      ,
  input   logic   [DATA_WIDTH       -1:0] wr_data_a   ,
  output  logic   [DATA_WIDTH       -1:0] rd_data_a   ,
  input   logic   [BYTEENABLE_WIDTH -1:0] byteenable_a,

  input   logic                           we_b        ,
  input   logic                           re_b        ,
  input   logic   [ADDR_WIDTH       -1:0] addr_b      ,
  input   logic   [DATA_WIDTH       -1:0] wr_data_b   ,
  output  logic   [DATA_WIDTH       -1:0] rd_data_b   ,
  input   logic   [BYTEENABLE_WIDTH -1:0] byteenable_b

);

//=======================================================
//  local parameters
//=======================================================


//=======================================================
//  REG/WIRE declarations
//=======================================================

  // Declare the RAM variable
  logic [BYTEENABLE_WIDTH-1:0] [7:0] ram[2**ADDR_WIDTH-1:0];

  // read register
  logic   [ADDR_WIDTH       -1:0] addr_a_reg;
  logic   [ADDR_WIDTH       -1:0] addr_b_reg;


//=======================================================
//  Structural coding
//=======================================================

  // initial value for sim only
  initial begin
    for(int i =0; i<2**ADDR_WIDTH; i++) 
      ram[i]  =   32'd0;
      $readmemh("mem.txt", ram);
  end


  always @ (posedge clk )
  begin // Port a
   if (we_a) begin
      if (byteenable_a[0])  ram[addr_a][0]  <=   wr_data_a[7 : 0];
      if (byteenable_a[1])  ram[addr_a][1]  <=   wr_data_a[15: 8];
      if (byteenable_a[2])  ram[addr_a][2]  <=   wr_data_a[23:16];  
      if (byteenable_a[3])  ram[addr_a][3]  <=   wr_data_a[31:24];
    end
    if(re_a) begin
    addr_a_reg  <=  addr_a;
    end
  end

  always @ (posedge clk)
  begin // Port b
    if (we_b) begin
      case(byteenable_b)
        4'b0001 : ram[addr_b][0]  <=   wr_data_b[7 : 0];
        4'b0010 : ram[addr_b][1]  <=   wr_data_b[7 : 0];
        4'b0100 : ram[addr_b][2]  <=   wr_data_b[7 : 0];
        4'b1000 : ram[addr_b][3]  <=   wr_data_b[7 : 0];
        4'b0011 : begin
                  ram[addr_b][0]  <=   wr_data_b[7 : 0];
                  ram[addr_b][1]  <=   wr_data_b[15: 8];
        end
        4'b1100 : begin
                  ram[addr_b][2]  <=   wr_data_b[7 : 0];
                  ram[addr_b][3]  <=   wr_data_b[15: 8];
        end
        default : begin
                  ram[addr_b][0]  <=   wr_data_b[7 : 0];
                  ram[addr_b][1]  <=   wr_data_b[15: 8];
                  ram[addr_b][2]  <=   wr_data_b[23:16];
                  ram[addr_b][3]  <=   wr_data_b[31:24];
        end
      endcase
    end
    if(re_b) begin
    addr_b_reg  <=  addr_b;
    end
  end


  always_comb begin
    rd_data_a = ram[addr_a_reg];
    rd_data_b = ram[addr_b_reg];
  end

endmodule