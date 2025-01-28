module top (
    input logic rst_n,

    output logic clk,
    output logic strip
);

    OSC #(.FREQ_DIV(3)) u_osc (.OSCOUT(clk));

    ws2812 #(.ClkFreqMhz(70)) u_ws (
        .clk(clk),
        .rst_n(rst_n),
        .color(24'h001010),
        .ws(strip)
    );

endmodule : top
