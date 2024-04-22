//////////////////////////////////////////////////////////////////////////
/// Author (name and email): Qazi Shahid Ullah, shahidullahqazi@gmail.com
/// Date Created:            01-feb-2024
/// Description:  This module is a test bench for the models of two port 
/// memory, each port will be will a single address that can be used for 
/// both read and write. 
//////////////////////////////////////////////////////////////////////////

module tb;

//=======================================================
//  local parameters
//=======================================================

  parameter DATA_WIDTH        =   32  ;
  parameter ADDR_WIDTH        =   15  ;
  parameter BYTEENABLE_WIDTH  =   DATA_WIDTH/8;

//=======================================================
//  REG/WIRE declarations
//=======================================================
  logic   clk;
  logic   rst_n;

  logic                           we_a        ;
  logic   [ADDR_WIDTH       -1:0] addr_a      ;
  logic   [DATA_WIDTH       -1:0] wr_data_a   ;
  logic   [DATA_WIDTH       -1:0] rd_data_a   ;
  logic   [BYTEENABLE_WIDTH -1:0] byteenable_a;

  logic                           we_b        ;
  logic   [ADDR_WIDTH       -1:0] addr_b      ;
  logic   [DATA_WIDTH       -1:0] wr_data_b   ;
  logic   [DATA_WIDTH       -1:0] rd_data_b   ;
  logic   [BYTEENABLE_WIDTH -1:0] byteenable_b;


//=======================================================
//  module instantiations
//=======================================================
  mem_2p i_mem_2p (
  .clk         (clk         ),
  .rst_n       (rst_n       ),
  .we_a        (we_a        ),
  .addr_a      (addr_a      ), // TODO: Check connection ! Signal/port not matching : Expecting logic [14:0]  -- Found logic [ADDR_WIDTH-1:0] 
  .wr_data_a   (wr_data_a   ), // TODO: Check connection ! Signal/port not matching : Expecting logic [31:0]  -- Found logic [DATA_WIDTH-1:0] 
  .rd_data_a   (rd_data_a   ), // TODO: Check connection ! Signal/port not matching : Expecting logic [31:0]  -- Found logic [DATA_WIDTH-1:0] 
  .byteenable_a(byteenable_a), // TODO: Check connection ! Signal/port not matching : Expecting logic [DATA_WIDTH/8-1:0]  -- Found logic [BYTEENABLE_WIDTH-1:0] 
  .we_b        (we_b        ),
  .addr_b      (addr_b      ), // TODO: Check connection ! Signal/port not matching : Expecting logic [14:0]  -- Found logic [ADDR_WIDTH-1:0] 
  .wr_data_b   (wr_data_b   ), // TODO: Check connection ! Signal/port not matching : Expecting logic [31:0]  -- Found logic [DATA_WIDTH-1:0] 
  .rd_data_b   (rd_data_b   ), // TODO: Check connection ! Signal/port not matching : Expecting logic [31:0]  -- Found logic [DATA_WIDTH-1:0] 
  .byteenable_b(byteenable_b)  // TODO: Check connection ! Signal/port not matching : Expecting logic [DATA_WIDTH/8-1:0]  -- Found logic [BYTEENABLE_WIDTH-1:0] 
);

//=======================================================
//  Functions
//=======================================================

//=======================================================
//  test bench stimulus
//=======================================================

  initial begin
    #0;
    clk = 0;
    rst_n = 1;

    we_a        = 0;
    addr_a      = 0;
    wr_data_a   = 0;
    byteenable_a= 0; 

    we_b        = 0;
    addr_b      = 0;
    wr_data_b   = 0;
    byteenable_b= 0; 
    #10

    // write 
    we_a  = 1;
    for (int i = 0; i < 10; i++) begin 
    byteenable_a  = 4'b0011;  
    addr_a        = i;
    wr_data_a     = $urandom();   
    #10;
    end 

    // read 
    we_a  = 0;
    for (int i = 0; i < 10; i++) begin
    addr_a    = i;  
    #10;
    end 

    // write 
    we_b  = 1;
    for (int i = 0; i < 10; i++) begin
    addr_b    = i;
    wr_data_a = i;   
    #10;
    end 

    // write 
    we_b  = 0;
    for (int i = 0; i < 10; i++) begin
    addr_b    = i;
    #10;
    end 

    $stop();
    
  end

  always #5 clk = ~clk;

endmodule