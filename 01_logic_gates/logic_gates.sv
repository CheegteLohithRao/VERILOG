module logic_gates(
    input logic a,
    input logic b,

    output logic not_gate,
    output logic and_gate,
    output logic or_gate,
    output logic nor_gate,
    output logic nand_gate,
    output logic XOR_gate,
    output logic XNOR_gate
);

    assign not_gate = ~a;
    assign and_gate = a & b;
    assign or_gate = a | b;
    assign nor_gate = ~(a | b);
    assign nand_gate = ~(a & b);
    assign XOR_gate = a ^ b;
    assign XNOR_gate = ~(a ^ b);
    
endmodule
