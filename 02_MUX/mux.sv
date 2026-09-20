module mux(
    input logic sel,
    input logic i0,
    input logic i1,
    output logic y
);

    assign y = (~sel & i0) | (sel & i1);

endmodule
