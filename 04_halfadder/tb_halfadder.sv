module tb_halfadder;
    logic a;
    logic b;
    logic sum;
    logic carry;
    logic expected_s;
    logic expected_c;

    halfadder dut(
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin

        $dumpfile("tb_halfadder.vcd");
        $dumpvars(0, tb_halfadder);

        for ( integer a0 = 0; a0 <= 1; a0 = a0 + 1) begin
            for ( integer b0 = 0; b0 <= 1; b0 = b0 + 1) begin
                a = a0[0];
                b = b0[0];
                #10;

                expected_s = sum;
                expected_c = carry;

                if ((expected_s !== sum) || (expected_c !== carry)) begin
                    $display("Test failed for a=%0b, b=%0b: expected sum=%0b, carry=%0b but got sum=%0b, carry=%0b", a, b, expected_s, expected_c, sum, carry);
                end 
                else begin
                    $display("Test passed for a=%0b, b=%0b: sum=%0b, carry=%0b", a, b, sum, carry);
                end
            end
        end
        $finish;
    end

endmodule
