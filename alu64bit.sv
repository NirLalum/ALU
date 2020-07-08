// 64-bit ALU template
module alu64bit (
    input logic [63:0] a,    // Input bit a
    input logic [63:0] b,    // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic [63:0] s,   // Output S
    output logic cout        // Carry out
);

	logic [62:0] coutWires;
	// define the 0 1 bit alu
	alu1bit firstALU(
		.a(a[0]),
		.b(b[0]),
		.cin(cin),
		.op(op),
		.s(s[0]),
		.cout(coutWires[0])
	);
	
	// define 1 - 62 1bit ALUs
	genvar i;
	generate
		for (i = 1; i < 63; i++)
		begin
			alu1bit alu_inst(
				.a(a[i]),
				.b(b[i]),
				.cin(coutWires[i-1]),
				.op(op),
				.s(s[i]),
				.cout(coutWires[i])
			);
		end
	endgenerate
	
	// define the 63 1bit ALU
	alu1bit lastALU(
		.a(a[63]),
		.b(b[63]),
		.cin(coutWires[62]),
		.op(op),
		.s(s[63]),
		.cout(cout)
	);
	
endmodule
