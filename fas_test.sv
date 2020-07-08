// Full Adder/Subtractor test bench template
module fas_test;

	logic fas_a;
	logic fas_b;
	logic fas_cin;
	logic fas_a_ns;
	
	logic fas_cout;
	logic fas_s;
	
	
	fas fasTest(
		.a(fas_a),
		.b(fas_b),
		.cin(fas_cin),
		.a_ns(fas_a_ns),
		.s(fas_s),
		.cout(fas_cout)
	);

	initial begin
		fas_a = 1'b0;
		fas_b = 1'b1;
		fas_cin = 1'b0;
		fas_a_ns = 1'b0;
		
		#60
		fas_a = 1'b0;
		fas_b = 1'b1;
		fas_cin = 1'b0;
		fas_a_ns = 1'b1;
		
		#60
		fas_a = 1'b0;
		fas_b = 1'b1;
		fas_cin = 1'b0;
		fas_a_ns = 1'b0;
	end
endmodule
