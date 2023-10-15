
module CMP_UNIT #(
  
parameter A_WIDTH = 16             , //initialize a parameter variable with value 16 
parameter B_WIDTH = 16             , //initialize a parameter variable with value 16 
parameter ALU_FUN_WIDTH = 2        , //initialize a parameter variable with value 2
parameter ALU_CMP_OUT_WIDTH = 2 , //initialize a parameter variable with value 16
parameter ALU_CMP_OUT_D_WIDTH = 2 ) //initialize a parameter variable with value 16 
  (
  
  //                  Port Decleration                
  input wire [A_WIDTH-1:0] A,
  input wire [B_WIDTH-1:0] B,
  input wire [ALU_FUN_WIDTH-1:0] ALU_FUN,
  input wire CLK,
  input wire RST,
  input wire CMP_Enable,
  output reg [ALU_CMP_OUT_WIDTH-1:0] CMP_OUT,
  output reg CMP_Flag
  
  );
  
  reg [ALU_CMP_OUT_D_WIDTH-1:0] CMP_D;
  
//-----------------------------------------------------------------------
//                    Always Sequential Block   
//-----------------------------------------------------------------------

always@(posedge CLK or negedge RST)
begin
  
  if(!RST)
    
    CMP_OUT <= 16'b0;
    
  else
    
    CMP_OUT <= CMP_D;
    
end




//-----------------------------------------------------------------------
//                    Always Combinational Block   
//-----------------------------------------------------------------------


// impelementing the Compare Functions


always@(*)
  begin
    
    if (CMP_Enable)
      
      begin
        
    case(ALU_FUN)
      
      
      2'b01:
      
      begin
       CMP_D = (A == B) ? 16'b1 : 16'b0;  // cmp A = B 
       CMP_Flag = 1'b1;
        end
  
      2'b10: 
      
      begin
       CMP_D = (A > B) ? 16'b10 : 16'b0 ;  // cmp A > B
       CMP_Flag = 1'b1;
       end
  
      2'b11:
      
      begin
       CMP_D = (A < B) ? 16'b11 : 16'b0;  // cmp A < B
       CMP_Flag = 1'b1;
        end
  
    default:
    
    begin
     CMP_D = 16'b0;
     CMP_Flag = 1'b1;
    end
    
  endcase
  
  end

else
  
  begin
    
    CMP_D = 16'b0;
    CMP_Flag = 1'b0;
  end
  
  end
  
  
endmodule


