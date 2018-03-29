`timescale 1ns / 1ps

module debouncer(input clk, input rst, input btn_in, output btn_out);
     
    parameter N = 21;
 
    reg [N-1 : 0] delaycount_reg;                     
    reg [N-1 : 0] delaycount_next;
    
	 reg DB_out = 0;
	 assign btn_out = ~DB_out;
	 
    reg DFF1, DFF2;                                 
    wire q_add;                                     
    wire q_reset;
 
    always @(posedge clk)
    begin
        if(rst ==  1'b0) // At reset initialize FF and counter 
        begin
            DFF1 <= 1'b0;
            DFF2 <= 1'b0;
            delaycount_reg <= { N {1'b0} };
        end
        else
        begin
            DFF1 <= btn_in;
            DFF2 <= DFF1;
            delaycount_reg <= delaycount_next;
        end
    end
      
    assign q_reset = (DFF1  ^ DFF2);
    assign  q_add = ~(delaycount_reg[N-1]);
     
    always @(q_reset, q_add, delaycount_reg)
    begin
        case( {q_reset , q_add})
            2'b00:
                    delaycount_next <= delaycount_reg;
            2'b01:
                    delaycount_next <= delaycount_reg + 1;
            default:
                    delaycount_next <= { N {1'b0} };
        endcase    
    end
      
    always @(posedge clk)
    begin
        if(delaycount_reg[N-1] == 1'b1)
            DB_out <= DFF2;
        else
            DB_out <= DB_out;
    end
         
endmodule