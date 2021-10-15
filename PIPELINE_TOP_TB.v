module PIPELINE_TOP_TB;
// Inputs
reg reset;
reg clk;
// Outputs
wire read;
wire write;
wire inst_ld;
// Instantiate the Unit Under Test (UUT)
PIPELINE_TOP uut (
.reset(reset),
.clk(clk),
.read(read),
.write(write),
.inst_ld(inst_ld)
);
initial begin
// Initialize Inputs
reset = 0;
clk = 0;
// Wait 100 ns for global reset to finish
 // Add stimulus here
end
always
#5 clk = ~clk;
initial begin
#0 reset = 1;
#20 reset = 20;
end
 endmodule
