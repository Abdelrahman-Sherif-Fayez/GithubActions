module LOGIC_UNIT #(
parameter A_WIDTH = 16             , //initialize a parameter variable with value 16 
parameter B_WIDTH = 16             , //initialize a parameter variable with value 16 
parameter ALU_FUN_WIDTH = 2        , //initialize a parameter variable with value 2
parameter ALU_LOGIC_OUT_WIDTH = 16 , //initialize a parameter variable with value 16
parameter ALU_LOGIC_OUT_D_WIDTH = 16 ) //initialize a parameter variable with value 16 
  (
  
  //                  Port Decleration                
  input wire [A_WIDTH-1:0] a,
  input wire [B_WIDTH-1:0] b,
  input wire [ALU_FUN_WIDTH-1:0] ALU_FUN,
  input wire CLK,
  input wire RST,
  input wire Logic_Enable,
  output reg [ALU_LOGIC_OUT_WIDTH-1:0] Logic_OUT,
  output reg Logic_Flag
  
  );
  
  reg [ALU_LOGIC_OUT_D_WIDTH-1:0] Logic_D;
//-----------------------------------------------------------------------
//                    Always Sequential Block   
//-----------------------------------------------------------------------

always@(posedge CLK or negedge RST)
begin
  
  if(!RST)
    
    Logic_OUT <= 16'b0;
    
  else
    
    Logic_OUT <= Logic_D;
    
end




//-----------------------------------------------------------------------
//                    Always Combinational Block   
//-----------------------------------------------------------------------


// impelementing the Logic Functions


always@(*)
  begin
    
    if (Logic_Enable)
      
      begin
 //                     intial values
      Logic_D = 16'b0;
      Logic_Flag = 1'b0;
      
    case(ALU_FUN)
      
      
      2'b00:
      
      begin
       Logic_D = (a & b); // Logic and 
       Logic_Flag = 1'b1;
        end
        
      2'b01:
      
      begin
       Logic_D = (a | b);  // Logic or
       Logic_Flag = 1'b1;
        end
        
      2'b10:
      
      begin
       Logic_D = ~(a & b);  // Logic nand
       Logic_Flag = 1'b1;
        end
        
      2'b11:
      
      begin
       Logic_D = ~(a | b);  // Logic nor
       Logic_Flag = 1'b1;
        end
        
    default:
    
    begin
     Logic_D = 16'b0;
     Logic_Flag = 1'b0;
      end
      
  endcase
end

else
  
  begin
    
    Logic_D = 16'b0;
    Logic_Flag = 1'b0;
  end
  
  end
  
  
endmodule