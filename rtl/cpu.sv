module cpu_top (
    // Clock and Reset
    input  logic        clk,
    input  logic        rst_n,

    // Instruction Memory Interface (Read Only)
    output logic [31:0] imem_addr,
    input  logic [31:0] imem_rdata,

    // Data Memory Interface (Read/Write)
    output logic [31:0] dmem_addr,
    output logic [31:0] dmem_wdata,
    output logic [3:0]  dmem_wstrb, // 4 byte write mask for storing bytes and half words (4/16)
    output logic        dmem_ren,
    input  logic [31:0] dmem_rdata,

);

endmodule