// Copyright (c) 2025 Sigma Logic

module ws2812 #(
    parameter int ClkFreqMhz = 70,
    parameter int ResetTi = 1e3,
    parameter int LowZeroTi = ClkFreqMhz * 45,
    parameter int HighZeroTi = ClkFreqMhz * 8,
    parameter int LowOneTi = ClkFreqMhz * 85,
    parameter int HighOneTi = ClkFreqMhz * 4
) (
    input logic clk,
    input logic rst_n,
    input logic [23:0] color,

    output logic ws
);

    typedef enum logic [2:0] {
        Reset,
        HighZero,
        HighOne,
        LowZero,
        LowOne,
        Next
    } state_t;

    localparam logic [4:0] Unit = 5'd23;

    state_t state;

    logic [31:0] cnt;
    logic [4:0] cursor;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= Reset;
            ws <= 1'b0;
            cnt <= 32'b0;
            cursor <= 5'b0;
        end else case (state)
            Reset: begin
                if (cnt < ResetTi) begin
                    cnt <= cnt + 32'b1;
                end else begin
                    cnt <= 32'b0;
                    state <= Next;
                end
            end
            HighZero: begin
                ws <= 1'b1;

                if (cnt < HighZeroTi) begin
                    cnt <= cnt + 32'b1;
                end else begin
                    cnt <= 32'b0;
                    state <= LowZero;
                end
            end
            LowZero: begin
                ws <= 1'b0;

                if (cnt < LowZeroTi) begin
                    cnt <= cnt + 32'b1;
                end else begin
                    cnt <= 32'b0;
                    state <= Next;
                end
            end
            HighOne: begin
                ws <= 1'b1;

                if (cnt < HighOneTi) begin
                    cnt <= cnt + 32'b1;
                end else begin
                    cnt <= 32'b0;
                    state <= LowOne;
                end
            end
            LowOne: begin
                ws <= 1'b0;

                if (cnt < LowOneTi) begin
                    cnt <= cnt + 32'b1;
                end else begin
                    cnt <= 32'b0;
                    state <= Next;
                end
            end
            Next: begin
                state <= color[cursor] ? HighOne : HighZero;
                cursor <= cursor == Unit ? 5'd0 : cursor + 5'd1;
            end
            default : begin
                state <= Reset;
            end
        endcase
    end

endmodule : ws2812

