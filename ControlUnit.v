module ControlUnit(clk,reset,interrupt,datamem_data,datamem_address,regfile_out1,regfile_out2, alu_out,alu_opcode,regfile_data,usermem_data,regfile_read1,regfile_read2, regfile_writereg,usermem_address,pc_jmpaddr,rw,regfile_op,pc_jump);
	input clk, reset, interrupt;
	input [7:0] datamem_data, datamem_address, regfile_out1, regfile_out2, alu_out;
	output reg [3:0] alu_opcode;
	output reg [7:0] regfile_data, usermem_data;
	output reg [1:0] regfile_read1, regfile_read2, regfile_writereg;
	output reg [7:0] usermem_address, pc_jmpaddr;
	output reg rw, regfile_op, pc_jump);
	
	reg [1:0] stage; //menunjukkan sekarang di stage apa
	reg [7:0] instruction_c; //menyimpan hasil coding yang ingin dijalankan
	reg [7:0] instruction; 
	reg [7:0] prevaddr; //menyimpan alamat sebelumnya, digunakan saat interrupt
	
	always@(posedge clk)
	begin
        	if(reset == 1) //jika resetnya true, maka semua output jadi 0
        	begin
			{instruction,alu_opcode,regfile_data,usermem_data,usermem_address} = 8'b0;
			{regfile_read1,regfile_read2,regfile_writereg} = 3'b0;
			{rw, regfile_op, pc_jump} = 1'b0;
			stage = 2'h2;
        	end
		else if(interrupt == 1) //jika ada interrupt
		begin
			prevaddr = datamem_address; //simpan alamat instruksi yang diinterrupt
			pc_jump = 1;				//flag kalau mau ngejump
			pc_jmpaddr = 8'hfd;     		//opcode untuk jump
		end
endmodule
