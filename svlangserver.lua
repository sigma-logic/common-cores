return {
  includeIndexing = {
    "cores/**/*.{v,sv,svh}",
    "include/**/*.{sv,svh}",
  },
  excludeIndexing = {"**/*_pkg.sv"},
  launchConfiguration = "verilator -f verilator/lsp.f",
  formatCommand = "verible-verilog-format --flagfile verible-format.f",
}

