//////////////////////////////////////////////////////////////////////////
/// Author (name and email): Afif Arif Siddiqi, asiddiqi.bee20seecs@seecs.edu.pk
/// Date Created: 1/24/2024
/// Description: <creating interfaces for DMEM and IMEM>
///////////////////////////////////////////////////////////////////////////


interface mem_ntv_interface_if ();
  logic [31:0]   addr;
  logic [31:0]   wdata;
  logic [31:0]   rdata;
  logic          w_en;
  logic          r_en;
  logic [3:0]    byteenable;


  modport core ( 
    output addr,
    output wdata,
    input  rdata,
    output w_en,
    output r_en,
    output byteenable
  );

  modport soc ( 
    input  addr,
    input  wdata,
    output rdata,
    input  w_en,
    input  r_en,
    input  byteenable
  );

endinterface