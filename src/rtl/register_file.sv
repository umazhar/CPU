module register_file #(
    parameter int REG_WIDTH = 32,
    parameter int NUM_REGS = 32,
    parameter int DATA_WIDTH = 64
) (
    input logic                             clk,
    input logic                             reg_write,
    
    //Register Number
    input logic [5:0]       read_register1, read_register2, write_register,
    
    //Data
    input logic [63:0]       write_data,

    output logic [63:0]       read_data1,
    output logic [63:0]       read_data2
);
    logic [DATA_WIDTH-1:0] register_array [NUM_REGS-1:0]; //32 registers, 64 bits each

    always_ff @( posedge clk ) begin
        if (reg_write && write_register != 0)
            register_array[write_register] <= write_data;
    end

    assign read_data1 = register_array[read_register1];
    assign read_data2 = register_array[read_register2];

endmodule