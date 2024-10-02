`timescale 1ns / 1ps //1 nanoSecond = to 1 picoSecond

module SD
(
    input i,
    input clk,
    output out
    );
    
    reg out;
    
    //state declaration,  3 bit wide local parameters , s0, s1, s2
    localparam [1:0] s0 =2'b00, s1 =2'b01, s2 =2'b10; // 00, 01, 10
    
    // state variables(2-bit), store current and nextState
    reg [1:0] currentState, nextState;
    
    // state registers, , sequential logic block, updates currentState with value of nextState
    always @ (posedge clk) begin
        currentState <= nextState;
    end 
    
    // next state logic
    always @ (*) begin
        case (currentState) // beign cases
            s0: begin // we are in the s0 state
                nextState = (i) ? s1:s0; // if I is 1, go to state s1, otherwise s0
                out = 1'b0;
                end
                
           s1: begin // we are in the s0 state
                nextState = (i) ? s1:s2; // state 2, I is 1 , output Out is 1, otherwise 0
                out = 1'b0;
                end
                
           s2: begin // we are in the s0 state
                nextState = (i) ? s1:s0;// if i is 1 move to s1
                out = (i) ? 1'b1: 1'b0;
                end
                
           default : begin
                nextState = s0; //sets out to 0
                out = 1'b0;
                end
        endcase // end case
    end
endmodule