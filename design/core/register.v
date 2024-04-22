//////////////////////////////////////////////////////////////////////////
/// Author (name and email): Afif Arif Siddiqi, asiddiqi.bee20seecs@seecs.edu.pk
/// Date Created: 1/24/2024
/// Description: <register>
///////////////////////////////////////////////////////////////////////////

module register
#(
  parameter width       = 32,  
  parameter Default_val = 0
)(
  input       clk, 
  input       reset, 
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
  	else
  		q <= d;
  end

endmodule