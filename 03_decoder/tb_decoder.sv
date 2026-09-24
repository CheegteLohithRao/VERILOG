module tb_decoder;
    logic a;
    logic b;
    logic y0;
    logic y1;
    logic y2;
    logic y3;

    logic expected_y0;
    logic expected_y1;
    logic expected_y2;
    logic expected_y3;

    decoder dut(
        .a(a),
        .b(b),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3)
    );

    initial begin

        $dumpfile("tb_dec.vcd");
        $dumpvars(0, tb_dec);

        for (integer a0 = 0; a0 <= 1; a0 = a0 + 1) begin
            for (integer b0 = 0; b0 <= 1; b0 = b0 + 1) begin
                a = a0[0];
                b = b0[0];
                #10;

                expected_y0 = ~a & ~b;
                expected_y1 = ~a & b;
                expected_y2 = a & ~b;
                expected_y3 = a & b;

                if ((y0 !== expected_y0) || (y1 !== expected_y1) || (y2 !== expected_y2) || (y3 !== expected_y3)) begin
                    $display("Test failed for a=%b, b=%b: y0=%b (expected %b), y1=%b (expected %b), y2=%b (expected %b), y3=%b (expected %b)", 
                        a, b, y0, expected_y0, y1, expected_y1, y2, expected_y2, y3, expected_y3);
                end 
                else begin
                    $display("Test passed for a=%b, b=%b: y0=%b, y1=%b, y2=%b, y3=%b", 
                        a, b, y0, y1, y2, y3);
                end
            end
        end
        
        $finish;
    end
endmodule
