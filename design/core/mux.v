//###############################################
// Author:  Qazi Hamid Ullah (hamidullahqazi12@gmail.com)
// Date:	2/24/2024
// Module:  mux.v       
// Description: This is a mux which selects between 
//  two inputs
//  
//###############################################

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
