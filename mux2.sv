// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);

// Put your code here
	// bottom path
	logic g1TOg4, g4TOg6, g6TOg7, g2TOg3, g3TOg5, g5TOg6;   
	OR2 #(.Tpdhl(5), .Tpdlh(4)) or_g1(.A(d0), .B(sel), .Z(g1TOg4));
	NOT #(.Tpdhl(4), .Tpdlh(10)) not_g4(.A(g1TOg4), .Z(g4TOg6));
	OR2 #(.Tpdhl(5), .Tpdlh(4)) or_g6(.A(g4TOg6), .B(g5TOg6), .Z(g6TOg7));
	NOT #(.Tpdhl(4), .Tpdlh(10)) not_g7(.A(g6TOg7), .Z(z));
	
	// top path
	NOT #(.Tpdhl(4), .Tpdlh(10)) not_g2(.A(sel), .Z(g2TOg3));
	OR2 #(.Tpdhl(5), .Tpdlh(4)) or_g3(.A(g2TOg3), .B(d1), .Z(g3TOg5));
	NOT #(.Tpdhl(4), .Tpdlh(10)) not_g5(.A(g3TOg5), .Z(g5TOg6));
	
// End of your code

endmodule
