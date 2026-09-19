module tb_logic_gates;
    logic a;
    logic b;

    logic not_gate;
    logic and_gate;
    logic or_gate;
    logic nor_gate;
    logic nand_gate;
    logic XOR_gate;
    logic XNOR_gate;

logic_gates dut(
    .a(a),
    .b(b),
    .not_gate(not_gate),
    .and_gate(and_gate),
    .or_gate(or_gate),
    .nor_gate(nor_gate),
    .nand_gate(nand_gate),
    .XOR_gate(XOR_gate),
    .XNOR_gate(XNOR_gate)
);

initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,tb_logic_gates);

    a = 0; b = 0;
    #10;
    $display("a = %b b = %b | NOT = %b AND = %b OR = %b NOR = %b NAND = %b XOR = %b XNOR = %b",
    a,b,not_gate,and_gate,or_gate,nor_gate,nand_gate,XOR_gate,XNOR_gate);

    a = 0; b = 1;
    #10;
    $display("a = %b b = %b | NOT = %b AND = %b OR = %b NOR = %b NAND = %b XOR = %b XNOR = %b",
    a,b,not_gate,and_gate,or_gate,nor_gate,nand_gate,XOR_gate,XNOR_gate);

    a = 1; b = 0;
    #10;
    $display("a = %b b = %b | NOT = %b AND = %b OR = %b NOR = %b NAND = %b XOR = %b XNOR = %b",
    a,b,not_gate,and_gate,or_gate,nor_gate,nand_gate,XOR_gate,XNOR_gate);
    
    a = 1; b = 1;
    #10;    
    $display("a = %b b = %b | NOT = %b AND = %b OR = %b NOR = %b NAND = %b XOR = %b XNOR = %b",
    a,b,not_gate,and_gate,or_gate,nor_gate,nand_gate,XOR_gate,XNOR_gate);

    $finish;
end

endmodule
