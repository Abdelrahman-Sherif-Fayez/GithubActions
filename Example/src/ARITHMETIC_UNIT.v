

module ARITHMETIC_UNIT #(
  
parameter A_WIDTH = 16             , //initialize a parameter variable with value 16 
parameter B_WIDTH = 16             , //initialize a parameter variable with value 16 
parameter ALU_FUN_WIDTH = 2        , //initialize a parameter variable with value 2
parameter ALU_ARITH_OUT_WIDTH = 32 , //initialize a parameter variable with value 16
parameter ALU_ARITH_OUT_D_WIDTH = 32 ) //initialize a parameter variable with value 16  
  
(  
  //                  Port Decleration                
  input wire [A_WIDTH-1:0] A,
  input wire [B_WIDTH-1:0] B,
  input wire [ALU_FUN_WIDTH-1:0] ALU_FUN,
  input wire CLK,
  input wire RST,
  input wire Arith_Enable,
  output reg [ALU_ARITH_OUT_WIDTH-1:0] Arith_OUT,
  output reg Carry_OUT,
  output reg Arith_Flag
  
  );
  
  reg [ALU_ARITH_OUT_D_WIDTH-1:0] Arith_D;
  reg Carry_OUT_D;
//-----------------------------------------------------------------------
//                    Always Sequential Block   
//-----------------------------------------------------------------------

always@(posedge CLK or negedge RST)
begin
  
  if(!RST)
    begin
    Arith_OUT <= 'b0;
    Carry_OUT <= 'b0;
    end
  else
    begin
    Arith_OUT <= Arith_D;
    Carry_OUT <= Carry_OUT_D;
    end
end




//-----------------------------------------------------------------------
//                    Always Combinational Block   
//-----------------------------------------------------------------------


// impelementing the Arithmetic Functions


always@(*)
  begin
    
    if (Arith_Enable)
      
      begin
        
    //                   intial value
      Carry_OUT_D = 1'b0;
      Arith_Flag = 1'b0;
      Arith_D = 16'b0;
      
    case(ALU_FUN)
    
      
      2'b00: 
      
      begin
      {Carry_OUT_D,Arith_D[A_WIDTH-1:0]} = A + B; // Arithmatic addition
      Arith_Flag = 1'b1;
        end
        
      2'b01: 
      
      begin
      Arith_D = A - B;  // Arithmatic subtraction
      Arith_Flag = 1'b1;
        end
        
      2'b10:
      
      begin
       Arith_D = A * B;  // Arithmatic multiplication
       Arith_Flag = 1'b1;
        end
        
      2'b11: 
      
      begin
      Arith_D = A / B;  // Arithmatic division
      Arith_Flag = 1'b1;
        end
        
    default:
    
    begin
     Arith_D = 16'b0;
     Carry_OUT_D = 1'b0;
     Arith_Flag = 1'b0;
    end
    
  endcase
end

else
  
  begin
    
    Arith_D = 16'b0;
    Carry_OUT_D = 1'b0;
    Arith_Flag = 1'b0;
    end
    
  end
  
  
endmodule