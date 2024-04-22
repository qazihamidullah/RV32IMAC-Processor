//////////////////////////////////////////////////////////////////////////
/// Author (name and email): Afif Arif Siddiqi, asiddiqi.bee20seecs@seecs.edu.pk
/// Date Created: 1/24/2024
/// Description: <adds two 32 bit inputs>
///////////////////////////////////////////////////////////////////////////

module adder (
  input   [31:0]  a,b,
  output  [31:0]  c
);

  assign  c = a + b;

endmodule