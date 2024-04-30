module core(
    input wire reset,
    input wire clk,
    input wire a,
    input wire b,
    output wire [3:0] cnt
);

wire car_enter;
wire car_exit;

    control control_unit(
        .rst(reset),
        .clk(clk),
        .a(a),
        .b(b),
        .car_enter(car_enter),
        .car_exit(car_exit)
    )

    datapath datapath_unit(
        .clk(clk),
        .reset(reset),
        .cor_enter(cor_enter),
        .cor_exit(cor_exit),
        .cnt(cnt)
    )

endmodule