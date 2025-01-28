// Copyright (c) 2025 Sigma Logic

`timescale 100 ps / 100 ps

module rgmii_tx (
    input logic clk,
    input byte  din,

    output logic [3:0] q
);

    logic [3:0] sink;

    generate
        for (genvar i = 0; i < 4; i++) begin : gen_oddr
            ODDR u_oddr (
                .Q0 (q[i]),
                .Q1 (sink[i]),
                .D0 (din[i]),
                .D1 (din[i+4]),
                .TX (1'b0),
                .CLK(clk)
            );
        end
    endgenerate

endmodule : rgmii_tx
