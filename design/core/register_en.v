//###############################################
// Author:  Qazi Hamid Ullah (hamidullahqazi12@gmail.com)
// Date:	  2/24/2024
// Module:  register_en.v       
// Description: This is a register module with enable 
//  control.
//  
//###############################################

module register_en
#(
  parameter width       = 32,  
  parameter Default_val = 0
)(
  input       clk, 
  input       reset, 
  input       en,
  input       flush,
  input       [width-1:0] d,
  output reg  [width-1:0] q
);

//=======================================================
//  Structural coding
//=======================================================

  always@(posedge clk or negedge reset )
  begin
  	if(!reset)
  		q <= Default_val;
  	else if(flush)
  	 	q <= Default_val;
  	else if(en)
  		q <= d;
  end

endmodule
