module tb_2mux;
    logic sel;
    logic i0;
    logic i1;
    logic y;
    logic expected;

    mux dut(
        .sel(sel),
        .i0(i0),
        .i1(i1),
        .y(y)
    );

    initial begin
        $dumpfile("tb_2mux.vcd");
        $dumpvars(0, tb_2mux);


for (integer sel_value = 0; sel_value <=1 ; sel_value = sel_value + 1) begin
    for (integer i0_value = 0; i0_value <=1 ; i0_value = i0_value + 1) begin
        for (integer i1_value = 0; i1_value <=1 ; i1_value = i1_value + 1) begin
            sel = sel_value[0];
            i0 = i0_value[0];
            i1 = i1_value[0];
            #10;

    expected = (~sel & i0) | (sel & i1);

    if (y !== expected) begin
        $error("Test failed: sel=%b, i0=%b, i1=%b, y=%b, expected=%b", sel, i0, i1, y, expected);

    end

    else begin
        $display("Test passed: sel=%b, i0=%b, i1=%b, y=%b", sel, i0, i1, y);

                    end
                end
            end
        end

    $finish;

end

endmodule
