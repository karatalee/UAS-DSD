module PC(clk,reset,jmpaddr,data,datamem_address);
	input [7:0] jmpaddr;
	input clk, reset;
	output reg [7:0] data,datamem_address;

	reg [7:0] temp;

	always@(posedge clk)
	begin
   		if(reset==1)
            		temp = 8'h00;
       		else //untuk jump
			datamem_address = temp; //kirim current add
            		temp = jmpaddr;
	end
	assign data = temp;
endmodule
