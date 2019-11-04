//------------------------------------------------------------------------------
//
//Module Name:					Syn_FIFO.v
//Department:					Xidian University
//Function Description:	   同步FIFO
//
//------------------------------------------------------------------------------
//
//Version 	Design		Coding		Simulata	  Review		Rel data
//V1.0		Verdvana		Verdvana		Verdvana      			2019-11-2
//
//-----------------------------------------------------------------------------------

`timescale 1ns/1ns 

module Syn_FIFO# (
parameter DATA_WIDTH = 8,					//定义FIFO数据位宽、地址位宽
parameter ADDR_WIDTH = 8)(
	/************ 时钟和复位 ************/
	input							clk,			//时钟
	input							rst_n,		//复位						
	/************ 读写使能 *************/					
	input							wr_en,		//写使能
	input							rd_en,		//读使能
	/*********** 数据输入输出 ***********/	
	input  [DATA_WIDTH-1:0]	data_in,		//数据输入
	output [DATA_WIDTH-1:0]	data_out,	//数据输出
	/************* 标志位 *************/	
	output						full,			//满标志
	output						empty 		//空标志
);


	/************** 常数 **************/
parameter FIFO_DEPTH = (1 << ADDR_WIDTH); 	//根据FIFO地址位宽定制FIFO深度

	/************* 寄存器 *************/
reg  [ADDR_WIDTH-1:0] 	wr_pointer;		//写指针
reg  [ADDR_WIDTH-1:0] 	rd_pointer;		//读指针
reg  [ADDR_WIDTH  :0] 	status_cnt;		//状态计数器

reg [DATA_WIDTH-1:0]	fifo [0:FIFO_DEPTH-1];	//寄存器组




//-------------------------------------
//使能同步
reg wr_en_r;
reg rd_en_r;

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		wr_en_r <= 1'b0;
		rd_en_r <= 1'b0;
	end
	
	else begin
		wr_en_r <= wr_en;
      rd_en_r <= rd_en;
	end
	
end	



//-------------------------------------------
//写指针
always@(posedge clk or negedge rst_n) begin

	if(!rst_n)
		wr_pointer <= 0;
	
	else if(wr_en_r && (status_cnt != (FIFO_DEPTH))) 
		wr_pointer <= wr_pointer + 1;
	

end



//-------------------------------------------
//读指针
always@(posedge clk or negedge rst_n) begin

	if(!rst_n)
		rd_pointer <= 0;
		
	else if(rd_en_r && (status_cnt != 0))
		rd_pointer <= rd_pointer + 1;
	

end



//------------------------------------------
//状态计数

wire status_rd = rd_en_r && !wr_en_r && (status_cnt != 0);
wire status_wr = wr_en_r && !rd_en_r && (status_cnt != (FIFO_DEPTH));	

always@(posedge clk or negedge rst_n) begin

	if(!rst_n)
		status_cnt <= 0;
	
	else if (status_rd)
		status_cnt <= status_cnt - 1;
	
	else if (status_wr)
		status_cnt <= status_cnt + 1;
		
	else
		status_cnt <= status_cnt;
		
end



//-------------------------------------------
//写操作
always@(posedge clk) begin
		
	if(wr_en_r && !full)
		fifo[wr_pointer] <= data_in;
	
end


//-------------------------------------------
//读操作
reg [DATA_WIDTH-1:0] data_out_r;

always@(posedge clk) begin
	
	if(rd_en_r)
		data_out_r <= fifo[rd_pointer];
	
end

assign data_out = data_out_r;



//-------------------------------------------
//满标志

assign full = (status_cnt > (FIFO_DEPTH-1));
		
//-------------------------------------------
//空标志

assign empty = (status_cnt == 0);




endmodule

	
	
