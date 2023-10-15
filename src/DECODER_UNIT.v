

module DECODER_UNIT #(
  

parameter ALU_FUN_WIDTH = 2    )     //initialize a parameter variable with value 2

  (
  
  //                  Port Decleration                
  
  input wire [1:0] ALU_FUN,
  output reg Arith_Enable,
  output reg Logic_Enable,
  output reg CMP_Enable,
  output reg Shift_Enable
  
  );



//-----------------------------------------------------------------------
//                    Always Combinational Block   
//-----------------------------------------------------------------------


// impelementing the Logic Functions

always@(*)
  
      begin
        
  //                           Intial Values
  
        Arith_Enable = 1'b0;
        Logic_Enable = 1'b0;
        CMP_Enable = 1'b0;
        Shift_Enable = 1'b0;
        
    case(ALU_FUN)
      
      2'b00: Arith_Enable = 1'b1 ; // setting the Arith_Enable 
      
      2'b01: Logic_Enable = 1'b1 ;// setting the Logic_Enable 
    
      2'b10: CMP_Enable = 1'b1 ;// setting the CMP_Enable 

      2'b11: Shift_Enable = 1'b1 ;// setting the Shift_Enable 
    
  
    
endcase

  end
  
  
endmodule


