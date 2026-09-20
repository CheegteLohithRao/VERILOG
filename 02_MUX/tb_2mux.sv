module tb_2mux;
    logic sel;
    logic i0;
    logic i1;
    logic y;

    mux dut(
        .sel(sel),
        .i0(i0),
        .i1(i1),
        .y(y)
    );

    initial begin
        $dumpfile("tb_2mux.vcd");
        $dumpvars(0, tb_2mux);

        sel = 0; i0 = 1; i1 = 0;
         #10;

        $display("sel=%b, i0=%b, i1=%b, y=%b", sel, i0, i1, y);
        sel = 1; i0 = 0; i1 = 1;
         #10;

        $display("sel=%b, i0=%b, i1=%b, y=%b", sel, i0, i1, y);
        
    $finish;
    end
endmodule
