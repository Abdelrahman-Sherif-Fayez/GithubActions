

module SHIFT_UNIT #(
  
parameter A_WIDTH = 16             , //initialize a parameter variable with value 16 
parameter B_WIDTH = 16             , //initialize a parameter variable with value 16 
parameter ALU_FUN_WIDTH = 2        , //initialize a parameter variable with value 2
parameter ALU_SHIFT_OUT_WIDTH = 16 , //initialize a parameter variable with value 16
parameter ALU_SHIFT_OUT_D_WIDTH = 16 ) //initialize a parameter variable with value 16 
  (

  //                  Port Decleration                
  input wire [A_WIDTH-1:0] A,
  input wire [B_WIDTH-1:0] B,
  input wire [ALU_FUN_WIDTH-1:0] ALU_FUN,
  input wire CLK,
  input wire RST,
  input wire Shift_Enable,
  output reg [ALU_SHIFT_OUT_WIDTH-1:0] Shift_OUT,
  output reg Shift_Flag
  
  );
  
  reg [ALU_SHIFT_OUT_D_WIDTH-1:0] Shift_D;
  
//-----------------------------------------------------------------------
//                    Always Sequential Block   
//-----------------------------------------------------------------------

always@(posedge CLK or negedge RST)
begin
  
  if(!RST)
    
    Shift_OUT <= 16'b0;
    
  else
    
    Shift_OUT <= Shift_D;
    
end




//-----------------------------------------------------------------------
//                    Always Combinational Block   
//-----------------------------------------------------------------------


// impelementing the Shifting Functions


always@(*)
  begin
    
    if (Shift_Enable)
      
      begin
        
    case(ALU_FUN)
      
      2'b00:
      
      begin
       Shift_D = A >> 1 ;// Shifting A to right 1 bit
       Shift_Flag = 1'b1;
         end
    
      2'b01:
      
      begin
       Shift_D = A << 1;  // Shifting A to left 1 bit
       Shift_Flag = 1'b1;
        end
    
      2'b10:
      
      begin
       Shift_D = B >> 1;  // Shifting B to right 1 bit
       Shift_Flag = 1'b1;
        end
    
      2'b11:
      
      begin
       Shift_D = B << 1;  // Shifting B to left 1 bit
       Shift_Flag = 1'b1;
        end
        
    default:
    
    begin
     Shift_D = 16'b0;
     Shift_Flag = 1'b0;
      end
      
  endcase
  
  end

else
  
  begin
    
    Shift_D = 16'b0;
    Shift_Flag = 1'b0;
  end
  
  end
  
  
  
endmodule


