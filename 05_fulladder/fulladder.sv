module fulladder(
    input logic a,
    input logic b,
    input logic cin,
    output logic sum,
    output logic cout
);
    logic sum1;
    logic carry1;
    logic carry2;

    halfadder ha1 (
        .a(a),
        .b(b),
        .sum(sum1),
        .carry(carry1)
    );
    
    halfadder ha2 (
        .a(sum1),
        .b(cin),
        .sum(sum),
        .carry(carry2)
    );

        assign cout = carry1 | carry2;

endmodule

