// 64-bit ALU test bench template
module alu64bit_test;

// Put your code here
// ------------------
    logic [63:0] alu_a;    
    logic [63:0] alu_b;
    logic alu_cin;     
    logic [1:0] alu_op;
    logic [63:0] alu_s;
    logic alu_cout;

	
    alu64bit uut (
        .a(alu_a),
        .b(alu_b),
		.cin(alu_cin),
        .op(alu_op),
        .s(alu_s),
		.cout(alu_cout)
		);

    initial begin

		alu_a = 64'hffffffffffffffff;
		alu_b = 64'h0000000000000001;
		alu_cin  = 1'b0;
		
		alu_op[0] = 1'b0;
		alu_op[1] = 1'b1;

        
		#3000
		alu_a = 64'hffffffffffffffff;
		alu_b = 64'h0000000000000000;
		alu_cin  = 1'b0;
		
		alu_op[0] = 1'b0;
		alu_op[1] = 1'b1;
	end
    
// End of your code

endmodule
