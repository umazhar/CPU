`timescale 1ns / 1ps

`define RED     "\033[31m"
`define GREEN   "\033[32m"
`define YELLOW  "\033[33m"
`define RESET   "\033[0m"

module register_file_tb;
    logic                             clk;
    logic                             reg_write;
    
    //Register Number
    logic [4:0]       read_register1, read_register2, write_register; // clog2(32) = 5, any register from 0 to 31
    
    //Data
    logic [63:0]       write_data;

    logic [63:0]       read_data1;
    logic [63:0]       read_data2;

    register_file #(
        .NUM_REGS(32), 
        .DATA_WIDTH(64)
    ) dut (
        .*
        );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    task automatic writeToRegister(
        input logic [4:0] wr_reg,
        input logic [63:0] data
        );

        @(negedge clk);
        reg_write = 1;
        write_register = wr_reg;
        write_data = data;

        //next clk cycle
        @(negedge clk);
        reg_write = 0;

    endtask //automatic

    task automatic checkReadValue (
        input logic [4:0] reg_to_read,
        input logic [4:0] expected_value
    );

    
        
    endtask //automatic


    initial begin
        read_register1 = 0;
        read_register2 = 0;
        write_register = 0;
        write_data = 0;
        reg_write = 0;

        #10;

        $display("Running register file write test");


        $finish;
    end

endmodule


