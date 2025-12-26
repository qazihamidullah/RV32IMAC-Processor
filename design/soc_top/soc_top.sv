//###############################################
// Author:  Qazi Hamid Ullah (hamidullahqazi12@gmail.com)
// Date:	  2/24/2024
// Module:  soc_top.sv       
// Description: This is the SOC Top module
//  
//  
//###############################################

module soc_top import risc_v_core_pkg::*;
(
        input logic clk,
        input logic rst
);
//=======================================================
//  local parameters
//=======================================================


//=======================================================
//  REG/WIRE declarations
//=======================================================
  mem_ntv_interface_if    mem_ntv_interface_imem();
  mem_ntv_interface_if    mem_ntv_interface_dmem();

//=======================================================
//  Structural coding
//=======================================================

  core_top core(     
                .clk_in                 (clk                              ),
                .rst_in                 (rst                              ),
                .mem_ntv_interface_imem (mem_ntv_interface_imem.core      ),
                .mem_ntv_interface_dmem (mem_ntv_interface_dmem.core      )
  );  


  mem_2p mem_inst( 
                .clk                    (clk                              ),
                .rst_n                  (rst                              ),
                .re_a                   (mem_ntv_interface_imem.r_en      ),
                .we_a                   (1'b0                             ),
                .addr_a                 (mem_ntv_interface_imem.addr>>2   ),
                .wr_data_a              (0                                ),
                .rd_data_a              (mem_ntv_interface_imem.rdata     ),
                .byteenable_a           (1'b0                             ),
                .re_b                   (mem_ntv_interface_dmem.r_en      ),
                .we_b                   (mem_ntv_interface_dmem.w_en      ),
                .addr_b                 (mem_ntv_interface_dmem.addr>>2   ),
                .wr_data_b              (mem_ntv_interface_dmem.wdata     ),
                .rd_data_b              (mem_ntv_interface_dmem.rdata     ),
                .byteenable_b           (mem_ntv_interface_dmem.byteenable)
    
  );

  endmodule
          
