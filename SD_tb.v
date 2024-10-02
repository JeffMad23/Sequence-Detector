`timescale 1ns / 1ps

module SD_tb( );
    // create registers . wires and required variables
    reg i_tb, clk_tb;
    wire out_tb;
    integer index; // keep track of index
    reg[9:0] data; // stores 10 bit value
    
    //instantiate module, input and signal
    SD uut(.i(i_tb), .clk(clk_tb), .out(out_tb));
    
    //initialization
    initial begin
        i_tb = 0;
        data = 10'b0001101011; //assign binary value
        index = 0;  
    end    
    
    // clcok generation, 40 time units
    initial begin
        clk_tb = 0;
        forever begin
            #20;
            clk_tb = ~clk_tb;
        end
    end
    
 // Generate Input Sequence
       always @ (posedge clk_tb) begin
           i_tb = data >> index;  //i_tb right_shift the data value by index,
           index = index + 1;   // increase index on each positive edge of clock
       end
    
  
  
endmodule