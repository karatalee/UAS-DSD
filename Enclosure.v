module enclosure(clk,reset,interrupt,datamem_data,usermem_data,datamem_address,usermem_address,rw);
	input clk, reset, interrupt;
	input [7:0] datamem_data;
	input [7:0] usermem_data;
	output [7:0] datamem_address, usermem_address;
	output rw;

	wire [1:0] regfile_read1, regfile_read2, regfile_writereg; 
	wire [7:0] pc_jumpaddr, regfile_data, regfile_out1, regfile_out2;
	wire [7:0] alu_out;
	wire [3:0] alu_opcode;
	
 	PC PC0(clk, reset, pc_jump, pc_jumpaddr, datamem_address);
    
	REG REG0(regfile_read1, regfile_read2, regfile_writereg, regfile_data, clk, reset, regfile_op, regfile_out1, regfile_out2);
    	
	ALU ALU0(regfile_out1, regfile_out2, alu_opcode, alu_out);
    
	ControlUnit CU0(clk, reset, interrupt, datamem_data, datamem_address, regfile_out1, regfile_out2, alu_out, alu_opcode, regfile_data, usermem_data, regfile_read1, regfile_read2, regfile_writereg, usermem_address, pc_jumpaddr, rw, regfile_op, pc_jump); 
endmodule