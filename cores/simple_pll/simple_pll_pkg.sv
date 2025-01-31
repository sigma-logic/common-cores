// Copyright (c) 2025 Sigma Logic

package simple_pll_pkg;

    typedef struct {
        string ref_clk_mhz;
        int i_div;
        int m_div;
        int o_div_0;
        int o_div_1;
        int o_div_2;
        int o_div_3;
        bit clk_0_en;
        bit clk_1_en;
        bit clk_2_en;
        bit clk_3_en;
    } pll_cfg_t;

    typedef struct packed {
        logic clk_0;
        logic clk_1;
        logic clk_2;
        logic clk_3;
    } pll_channels_t;

endpackage : simple_pll_pkg
