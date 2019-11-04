//------------------------------------------------------------------------------
//
//Module Name:					Syn_FIFO_TB.v
//Department:					Xidian University
//Function Description:	   同步FIFO测试文件
//
//------------------------------------------------------------------------------
//
//Version 	Design		Coding		Simulata	  Review		Rel data
//V1.0		Verdvana		Verdvana		Verdvana      			2019-11-2
//
//-----------------------------------------------------------------------------------

`timescale 1ns/1ns

module Syn_FIFO_TB;

parameter DATA_WIDTH = 3;
parameter ADDR_WIDTH = 3;
parameter FIFO_DEPTH = (1 << ADDR_WIDTH);

reg clk;
reg rst_n;


reg wr_en;
reg rd_en;

reg [DATA_WIDTH-1:0]	data_in;

wire						full;
wire						empty;

wire [DATA_WIDTH-1:0]	data_out;



Syn_FIFO #(
	.DATA_WIDTH(DATA_WIDTH),
	.ADDR_WIDTH(ADDR_WIDTH)
)
u_Syn_FIFO(

	.clk(clk),
	.rst_n(rst_n),
	
	.wr_en(wr_en),
	.rd_en(rd_en),
	
	.data_in(data_in),
	
	.full(full),
	.empty(empty),
	
	.data_out(data_out)
	
);

initial begin
	clk = 0;
	forever #10 clk=~clk;
end

task task_rst;
begin
	rst_n = 0;
	repeat(2)@(negedge clk);
	rst_n = 1;
end
endtask

task task_sysinit;
begin
	wr_en = 0;
	rd_en = 0;
	data_in = 0;
end
endtask


initial
begin
	task_sysinit;
	task_rst;
	#10;
	
	wr_en = 1;
	
	
	repeat(FIFO_DEPTH)@(posedge clk) begin
		data_in = data_in + 1;
	end
	
	#60;
	
	wr_en = 0;
	
	#60;
	
	rd_en = 1;
	
	#100;
	
	rd_en = 0;
	
	#40;
	
	wr_en = 1;
	
	
	repeat(FIFO_DEPTH)@(posedge clk) begin
		data_in = data_in + 1;
	end
	
	#60;
	
	wr_en = 0;
	
	#60;
	
	rd_en = 1;
	
	#200;
	
	rd_en = 0;
	
	#40;
	
	
		
		
	

	
end



endmodule


