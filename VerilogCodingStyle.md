# Purpose of Having Coding Standarad
1. A coding standard provides a uniform appearance to the codes written by different engineers.

2. It improves readability, and maintainability of the code and it also reduces complexity.

3. It helps in code reuse and helps to detect error easily.

4. It promotes sound programming practices and increases efficiency of the programmers.

# Editor Recommendated for Coding 
  Sublime text editor is recommended for code development, as it has multiple packages like highighting syntax, and some other cool stuffs that allows easy development of RTL. Different utility of sublime will shared later in this section. Following packages need to be installed for using such utilites. 

  ```
  Align Arguments,Alignment,AlignTab,Bracketeer,BracketFlasher,BracketGuard,BracketHighlighter,Brackets Color Scheme,BracketSpacer,CTags,HighlightWords,multiAlign,Package Control,RainbowBrackets,Smart VHDL,SublimeLinter-annotations,SublimeLinter-contrib-verilator,SublimeLinter-ruby,SublimeLinter,sublimelint,SystemVerilog,Verilog Automatic,Verilog,VHDL Mode,VHDL
  ```

  To install them  

    1. open sublime text editor 
    2. open up Preferences tab and go to packet control option to install package control 
    3. after installing package control you can install different pakacges of your choice to this utility
    4. to install the above packages, press ctrl + shift + p, this will open up command platte
    5. select Package Control: Advanced Install Packages
    6. copy the above comma separated packeges name and paste it into the bar at the bottom and entre to install the packges

# Requirements for RTL Coding

1.  All the files must the header identifing the designer name. This will help in finging the relevent designer when someone has any querry in the that file. 
```
//////////////////////////////////////////////////////////////////////////
/// Author (name and email):
/// Date Created:
/// Description: <detailed description of function>
///////////////////////////////////////////////////////////////////////////
```
2.  Use of indentation to align code for easier readability. Change setting of the eiditor (sublime text) to use "indent using space" and changes tab width to "2 spaces"

3.  use following template for module decleration

```
//////////////////////////////////////////////////////////////////////////
/// Author (name and email):
/// Date Created:
/// Description: <detailed description of function>
///////////////////////////////////////////////////////////////////////////


module test_module
#(
  parameter a   =   0  ,
  parameter b   =   1  ,
  parameter c   =   123

)(
  input   logic     clk,
  input   logic     rst_n,

  input   logic   a_in  ,
  input   logic   b_in  ,
  output  logic   c_out      
);

//=======================================================
//  local parameters
//=======================================================

  localparam d = a + b;

//=======================================================
//  REG/WIRE declarations
//=======================================================

  logic temp;

//=======================================================
//  Structural coding
//=======================================================

  always_comb begin
    c_out = a ^ b;
  end

endmodule

```

4.  use following template for module instantiation

```
  test_module
  #(
      .a  (),
      .b  (),
      .c  ()
  ) test_module_inst (
    .clk (clk ),
    .rstn(rstn),

    .a_in (a_in),
    .b_in (b_in)            
    .c_out(c_out)                
  );
```

5. naming convention

    1.  typedef   : “_t”
    2.  enum      : “_e”
    3.  interface : “_if”
