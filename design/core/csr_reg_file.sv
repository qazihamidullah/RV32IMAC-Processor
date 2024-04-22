//////////////////////////////////////////////////////////////////////////
/// Author (name and email): Qazi Hamid Ullah, qullah.bee20seecs@seecs.edu.pk
/// Date Created: 2/24/2024
/// Description: <reservation set with combinational read but writes at a clock>
///////////////////////////////////////////////////////////////////////////

module csr_reg_file(
	input                           clk,
	input                           rst,
  input   [31:0]                  instruction,           

);

  reg      [31:0] csr[5:0]; // Declare the csr register file -- 6 bit in length and 32 bit in width 
	integer  i;   
  
  //Read
  assign read_data1 = (we && rd==rs1 && rd!=0) ? write_data: ram[rs1];

  // Write
  always @ (posedge clk, negedge rst)
	begin
		if(~rst) begin
		  for (i=0; i< 2**ADDR_WIDTH; i=i+1)
		    ram[i] <= 32'd0;
		end
		else if (we & rd!=0)
		  ram[rd] <= write_data;
	end

endmodule