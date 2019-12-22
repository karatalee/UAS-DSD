module regfile (readreg1,readreg2,writereg,data,clk,clr,op,read1,read2);
	input clk,clr,op;
	input [2:0] readreg1, readreg2, writereg;
	input [7:0] data;
	output [7:0] read1, read2;

	reg [7:0] registerfile [2:0]; //ada 3 register 8 bit
	integer i;

	always @(negedge clk) //write saat negative edge sehingga di posedge data siap
	begin 
		if(op == 1) //write ke register
			registerfile[writereg] <= data; //pilih register yang mau di write
		else if(op == 0) // read register
		begin
			read1 = registerfile[readreg1]; //untuk ngeread isi dari register
			read2 = registerfile[readreg2]; //untuk ngeread & butuh 2 register (operand) yang di read
		end
		if(clr == 1) //instruksi clear
			for(i = 0; i <= 3; i = i + 1) //clear semua register
			begin
				registerfile[i] <= 8'b0;
			end
	end
endmodule
