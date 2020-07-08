// 4->1 multiplexer test bench template
module mux4_test;


	logic mux4_d0;
	logic mux4_d1;
	logic mux4_d2;
	logic mux4_d3;
	logic [1:0] mux4_sel;
	
	logic mux4_z;
	
	mux4 mux4Test(
		.d3(mux4_d3),
		.d2(mux4_d2),
		.d1(mux4_d1),
		.d0(mux4_d0),
		.sel(mux4_sel),
		.z(mux4_z)
	);
	
	initial begin
		mux4_d3 = 1'b1;
		mux4_d2 = 1'b1;
		mux4_d1 = 1'b1;
		mux4_d0 = 1'b0;
		mux4_sel[0] = 1'b0;
		mux4_sel[1] = 1'b0;
		
		#100
		mux4_d3 = 1'b1;
		mux4_d2 = 1'b1;
		mux4_d1 = 1'b1;
		mux4_d0 = 1'b1;
		mux4_sel[0] = 1'b0;
		mux4_sel[1] = 1'b0;
		
		#100
		mux4_d3 = 1'b1;
		mux4_d2 = 1'b1;
		mux4_d1 = 1'b1;
		mux4_d0 = 1'b0;
		mux4_sel[0] = 1'b0;
		mux4_sel[1] = 1'b0;
			
	end
endmodule
	
