module tb_fulladder;
    logic a;
    logic b;
    logic cin;
    logic sum;
    logic cout;
    logic expected_s;
    logic expected_c;
    
    fulladder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

initial begin

    $dumpfile("tb_fulladder.vcd");
    $dumpvars(0, tb_fulladder);

    for (integer a0 = 0; a0 <= 1; a0 = a0 + 1) begin
        for (integer b0 = 0; b0 <= 1; b0 = b0 + 1) begin
            for (integer cin0 = 0; cin0 <= 1; cin0 = cin0 + 1) begin
                a = a0[0];
                b = b0[0];
                cin = cin0[0];
                #10; 

                expected_s = a ^ b ^ cin;
                expected_c = (a & b) | (b & cin) | (a & cin);

                if (sum !== expected_s || cout !== expected_c) begin
                    $display("Test failed for a=%b, b=%b, cin=%b: sum=%b (expected %b), cout=%b (expected %b)", 
                        a, b, cin, sum, expected_s, cout, expected_c);
                end 
                else begin
                    $display("Test passed for a=%b, b=%b, cin=%b: sum=%b, cout=%b", 
                        a, b, cin, sum, cout);
                end
            end
        end
    end
$finish;
end

endmodule
