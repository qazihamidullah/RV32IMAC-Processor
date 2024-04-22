//////////////////////////////////////////////////////////////////////////
/// Author (name and email): Afif Arif Siddiqi, asiddiqi.bee20seecs@seecs.edu.pk
/// Date Created: 1/24/2024
/// Description: <2x1 mux with default operand size of 32 bits>
///////////////////////////////////////////////////////////////////////////


module mux
#(
	parameter width = 32
)(
	input  [width-1:0] a,
	input  [width-1:0] b,
	input              s, 
	output [width-1:0] c
);

//=======================================================
//  Structural coding
//=======================================================
	assign c = (s) ? b : a ;

endmodule