// 1-bit ALU template
module alu1bit (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic s,          // Output S
    output logic cout        // Carry out
);

logic notTOfas, fasTOmux, orTOnot, notTOmux, xorTOmux;

// nor operation:
OR2 #(.Tpdhl(5), .Tpdlh(4)) or1(.A(b), .B(a), .Z(orTOnot));
NOT #(.Tpdhl(4), .Tpdlh(10)) bottomNot(.A(orTOnot), .Z(notTOmux));

// xor operation:
XOR2 #(.Tpdhl(7), .Tpdlh(10)) xor1(.A(b), .B(a), .Z(xorTOmux));

// fas oeration:
NOT #(.Tpdhl(4), .Tpdlh(10)) topNot(.A(op[0]), .Z(notTOfas));
fas fas1 (.a(a), .b(b), .cin(cin), .a_ns(notTOfas), .s(fasTOmux), .cout(cout));

// define mux 4->1:
mux4 mux (.d0(notTOmux), .d1(xorTOmux), .d2(fasTOmux), .d3(fasTOmux), .sel(op), .z(s));


// End of your code

endmodule
