module alu #(
    parameter int DATA_WIDTH = 64
) (
    input logic [DATA_WIDTH-1:0] a,
    input logic [DATA_WIDTH-1:0] b,
    input logic [3:0]            alu_control, // 4-bit control signal to select operation

    output logic [DATA_WIDTH-1:0] out,
    output logic                  zero_flag 
);
    always_comb begin
        case (alu_control)
            4'b0000: out = a & b; // AND
            4'b0001: out = a | b; // OR
            4'b0010: out = a + b; // ADD
            4'b0110: out = a - b; // SUB
            default: out = '0; 
        endcase
    end

    assign zero_flag = (out == 0) ? 1 : 0;


endmodule