module ALU(data1,data2,opcode,hasil);
	input clk,reset;
	input [7:0] data1, data2;
	input [3:0] opcode;
	output reg [7:0] hasil;

	always@(*)
	begin
		a=data1;
		b=data2;

		case (opcode)
			/*2 operand*/
			4’b0001	: hasil = a & b;		//AND
			4’b0010	: hasil = a | b;		//OR
			4’b0011 	: hasil = a ^ b;	//XOR
			4’b0100 	: hasil = a + b;	//ADD
			4’b0101 	: hasil = a - b;	//SUB

			/*1 operand*/
			4’b0110	: hasil = a >> 1’b1;		//SHR
			4’b0111	: hasil = a << 1’b1;		//SHL
			4’b1000	: hasil = ~a;			//NOT/CPL
			4’b0000	: hasil <= 8'bZ;		//default
		endcase
	end
endmodule
