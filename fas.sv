// Full Adder/Subtractor template
module fas (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic a_ns,        // A_nS (add/not subtract) control
    output logic s,          // Output S
    output logic cout        // Carry out
);

// Put your code here
logic g1TOg2, g2TOg3, g3TOg4, g5TOg6, g6TOg2, g7TOg8, g8TOg9, g9TOg4, g10TOg8 ,g11TOg12;

// define Cout path:
// first from down:
XOR2 #(.Tpdhl(7), .Tpdlh(10)) xor_g1(.A(a_ns), .B(a), .Z(g1TOg2));
OR2 #(.Tpdhl(5), .Tpdlh(4)) or_g2(.A(g1TOg2), .B(g6TOg2), .Z(g2TOg3));
NOT #(.Tpdhl(4), .Tpdlh(10)) not_g3(.A(g2TOg3), .Z(g3TOg4));
OR2 #(.Tpdhl(5), .Tpdlh(4)) or_g4(.A(g3TOg4), .B(g9TOg4), .Z(cout));

// second:
OR2 #(.Tpdhl(5), .Tpdlh(4)) or_g5(.A(cin), .B(b), .Z(g5TOg6));
NOT #(.Tpdhl(4), .Tpdlh(10)) not_g6(.A(g5TOg6), .Z(g6TOg2));

// third:
NOT #(.Tpdhl(4), .Tpdlh(10)) not_g7(.A(cin), .Z(g7TOg8));
OR2 #(.Tpdhl(5), .Tpdlh(4)) or_g8(.A(g7TOg8), .B(g10TOg8), .Z(g8TOg9));
NOT #(.Tpdhl(4), .Tpdlh(10)) not_g9(.A(g8TOg9), .Z(g9TOg4));
NOT #(.Tpdhl(4), .Tpdlh(10)) not_g10(.A(b), .Z(g10TOg8));

// define s path:
XOR2 #(.Tpdhl(7), .Tpdlh(10)) xor_g11(.A(b), .B(a), .Z(g11TOg12));
XOR2 #(.Tpdhl(7), .Tpdlh(10)) xor_g12(.A(g11TOg12), .B(cin), .Z(s));

// End of your code

endmodule
