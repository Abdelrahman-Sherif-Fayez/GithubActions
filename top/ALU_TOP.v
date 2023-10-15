

module ALU_TOP #(
  
parameter A_WIDTH = 16             , //initialize a parameter variable with value 16 
parameter B_WIDTH = 16             , //initialize a parameter variable with value 16 
parameter ALU_FUN_WIDTH = 4        , //initialize a parameter variable with value 4
parameter ALU_ARITH_OUT_WIDTH = 32 , //initialize a parameter variable with value 16
parameter ALU_LOGIC_OUT_WIDTH = 16 , //initialize a parameter variable with value 16
parameter ALU_CMP_OUT_WIDTH   = 2  , //initialize a parameter variable with value 16
parameter ALU_SHIFT_OUT_WIDTH = 16 ) //initialize a parameter variable with value 16


( 
//-----------------------------------------------------------------------
//                    Port Decleration  
//-----------------------------------------------------------------------
 
   

  input wire [A_WIDTH-1:0] A_TOP,
  input wire [B_WIDTH-1:0] B_TOP,
  input wire [ALU_FUN_WIDTH-1:0] ALU_FUN_TOP,
  input wire CLK_TOP,
  input wire RST_TOP,
  output wire [ALU_ARITH_OUT_WIDTH-1:0] Arith_OUT_TOP,
  output wire Carry_OUT_TOP,
  output wire Arith_Flag_TOP,
  output wire [ALU_LOGIC_OUT_WIDTH-1:0] Logic_OUT_TOP,
  output wire Logic_Flag_TOP,// help please
  output wire [ALU_CMP_OUT_WIDTH-1:0] CMP_OUT_TOP,
  output wire CMP_Flag_TOP,
  output wire [ALU_SHIFT_OUT_WIDTH-1:0] Shift_OUT_TOP,
  output wire Shift_Flag_TOP
   );
   
//-----------------------------------------------------------------------
//                    Internal Signal Declaration  
//-----------------------------------------------------------------------


wire                                   Arith_Enable_TOP ;  
wire                                   Logic_Enable_TOP ; 
wire                                   CMP_Enable_TOP   ;  
wire                                   Shift_Enable_TOP ; 
   
   
//-----------------------------------------------------------------------
//                           Port Mapping  
//----------------------------------------------------------------------- 



DECODER_UNIT  U_decoder_unit  (

.ALU_FUN(ALU_FUN_TOP[3:2]),
.Arith_Enable(Arith_Enable_TOP),
.Logic_Enable(Logic_Enable_TOP),
.CMP_Enable(CMP_Enable_TOP),
.Shift_Enable(Shift_Enable_TOP)
);  

ARITHMETIC_UNIT U_arithmetic_unit (

.A(A_TOP),
.B(B_TOP),
.ALU_FUN(ALU_FUN_TOP[1:0]),
.CLK(CLK_TOP),
.RST(RST_TOP),
.Arith_Enable(Arith_Enable_TOP),
.Arith_OUT(Arith_OUT_TOP),
.Carry_OUT(Carry_OUT_TOP),
.Arith_Flag(Arith_Flag_TOP)

);

LOGIC_UNIT U_logic_unit (

.a(A_TOP),
.b(B_TOP),
.ALU_FUN(ALU_FUN_TOP[1:0]),
.CLK(CLK_TOP),
.RST(RST_TOP),
.Logic_Enable(Logic_Enable_TOP),
.Logic_OUT(Logic_OUT_TOP),
.Logic_Flag(Logic_Flag_TOP)

);

CMP_UNIT U_cmp_unit (

.A(A_TOP),
.B(B_TOP),
.ALU_FUN(ALU_FUN_TOP[1:0]),
.CLK(CLK_TOP),
.RST(RST_TOP),
.CMP_Enable(CMP_Enable_TOP),
.CMP_OUT(CMP_OUT_TOP),
.CMP_Flag(CMP_Flag_TOP)

);

SHIFT_UNIT U_shifter_unit (

.A(A_TOP),
.B(B_TOP),
.ALU_FUN(ALU_FUN_TOP[1:0]),
.CLK(CLK_TOP),
.RST(RST_TOP),
.Shift_Enable(Shift_Enable_TOP),
.Shift_OUT(Shift_OUT_TOP),
.Shift_Flag(Shift_Flag_TOP)

);
   
 endmodule
  
  