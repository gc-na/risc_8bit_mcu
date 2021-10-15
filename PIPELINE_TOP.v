module PIPELINE_TOP(
input reset,
input clk,
output read,
output write,
output inst_ld
);
wire sig_mc_clk;
wire sig_mem_clk;
wire sig_READ;
wire sig_WRITE;
wire sig_INST_LD;
wire [4:0] sig_prom_addr_out;
wire [4:0] sig_ir_reg;
wire [7:0] sig_mem_data_in;
wire [7:0] sig_prom_data_in;
wire [7:0] sig_mem_data_out;
wire [7:0] sig_mem_dout;
assign read = sig_READ;
assign write = sig_WRITE;
assign inst_ld = sig_INST_LD;
PIPELINE_MC PIPELINE_MC_blk(
.clk(sig_mc_clk),
.reset(reset),
.prom_data_in(sig_prom_data_in),
.mem_data_in(sig_mem_data_in),
.READ(sig_READ),
.WIRTE(sig_WRITE),
.INST_LD(sig_INST_LD),
.IR_REG(sig_ir_reg),
.prom_addr_out(sig_prom_addr_out),
.mem_data_out(sig_mem_data_out)
);
dataram dataram_blk(
.rst(reset),
.clk(sig_mem_clk),
.read(sig_READ),
.write(sig_WRITE),
.mem_addr(sig_ir_reg),
.mem_din(sig_mem_data_out),
.mem_dout(sig_mem_data_in)
);
prom prom_blk(
.reset(reset),
.clk(sig_mem_clk),
.MEM_ADDR(sig_prom_addr_out),
.MEM_DOUT(sig_mem_dout)
);
inst_buf inst_buf_blk(
.reset(reset),
.clk(sig_mc_clk),
.ld(sig_INST_LD),
.inst_buf_in(sig_mem_dout),
.inst_buf_out(sig_prom_data_in)
);
CLK_GENERATOR CLK_GENERATOR_blk(
.clk(clk),
.mc_clk(sig_mc_clk),
.mem_clk(sig_mem_clk)
);
endmodule
