module alu (
    input  logic [31:0] ain,
    input  logic [31:0] bin,
    input  logic [2:0]  alu_op,
    output logic [31:0] alu_result,
    output logic        zero_flag
);

// ALU Operations based on RISC-V ISA
// https://msyksphinz-self.github.io/riscv-isadoc/

    always_comb begin
        case (alu_op)
            3'b000: alu_result = ain + bin;       // ADD    
            3'b001: alu_result = ain - bin;        // SUB
            4'b0010: alu_result = ain & bin;             // AND
            4'b0011: alu_result = ain | bin;             // OR
            4'b0100: alu_result = ain ^ bin;             // XOR
            4'b0101: alu_result = ain << bin[4:0];      // SLL
            4'b0110: alu_result = ain >> bin[4:0];      // SRL
            4'b0111: alu_result = ($signed(ain) >>> bin[4:0]); // SRA
            4'b1000: alu_result = (ain < bin) ? 32'b1 : 32'b0; // SLT

            default: alu_result = 32'b0;
        endcase

        zero_flag = (alu_result == 32'b0);
    end

endmodule