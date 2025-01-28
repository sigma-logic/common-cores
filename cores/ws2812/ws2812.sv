// Copyright (c) 2025 Sigma Logic

module ws2812 #(
    parameter int ClkFreqMhz = 70,
    parameter int ResetTi = ClkFreqMhz / 10 - 1,
    parameter int ZeroLowTi = int'(ClkFreqMhz * 0.85) - 1,
    parameter int ZeroHighTi = int'(ClkFreqMhz * 0.40) - 1,
    parameter int OneLowTi = int'(ClkFreqMhz * 0.40) - 1,
    parameter int OneHighTi = int'(ClkFreqMhz * 0.85) - 1
) (
    input logic clk,
    input logic rst_n,
    input logic [23:0] color,

    output logic ws
);

    typedef enum logic [2:0] {
        Reset,
        ZeroHigh,
        ZeroLow,
        OneHigh,
        OneLow,
        Next
    } state_t;

    state_t state;

    logic [31:0] cnt;
    logic [4:0] cursor;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= Reset;
            ws <= 1'b0;
            cnt <= 32'b0;
            cursor <= 5'd23;
        end else begin
            unique case (state)
                Reset: begin
                    ws <= 1'b0;

                    if (cnt < ResetTi) begin
                        cnt <= cnt + 32'b1;
                    end else begin
                        cnt   <= 32'b0;
                        state <= Next;
                    end
                end
                ZeroHigh: begin
                    ws <= 1'b1;

                    if (cnt < ZeroHighTi) begin
                        cnt <= cnt + 32'b1;
                    end else begin
                        cnt   <= 32'b0;
                        state <= ZeroLow;
                    end
                end
                ZeroLow: begin
                    ws <= 1'b0;

                    if (cnt < ZeroLowTi) begin
                        cnt <= cnt + 32'b1;
                    end else begin
                        cnt   <= 32'b0;
                        state <= Next;
                    end
                end
                OneHigh: begin
                    ws <= 1'b1;

                    if (cnt < OneHighTi) begin
                        cnt <= cnt + 32'b1;
                    end else begin
                        cnt   <= 32'b0;
                        state <= OneLow;
                    end
                end
                OneLow: begin
                    ws <= 1'b0;

                    if (cnt < OneLowTi) begin
                        cnt <= cnt + 32'b1;
                    end else begin
                        cnt   <= 32'b0;
                        state <= Next;
                    end
                end
                Next: begin
                    ws <= 1'b0;
                    state <= color[cursor] ? OneHigh : ZeroHigh;
                    cursor <= cursor == 5'd0 ? 5'd23 : cursor - 5'd1;
                end
            endcase
        end
    end

endmodule : ws2812

