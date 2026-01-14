// synchronous assert, synchrounous reset D-flip-flop
module DFF #(
    parameter int WIDTH = 32
) (
    input logic                     clk,
    input logic                     en,
    input logic                     reset_n, //active low reset
    input logic     [WIDTH-1:0]     d,
    output logic    [WIDTH-1:0]     q
);
    always_ff @(posedge clk) begin
        if (!reset_n)
            q <= '0;
        else if (en)
            q <= d;
    end
    
endmodule