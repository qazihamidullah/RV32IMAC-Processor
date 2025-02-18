
//###############################################
// Author:  Qazi Hamid Ullah (hamidullahqazi12@gmail.com)
// Date:    2/24/2024
// Module:  adder.v       
// Description: This is an adder module which
//  adds two 32 bit inputs and generate a 32 bit
//  output
//###############################################

module adder (
  input   [31:0]  a,
  input   [31:0]  b,
  output  [31:0]  c
);

  assign  c = a + b;

endmodule
