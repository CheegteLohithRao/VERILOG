# Full Adder Design in SystemVerilog

This project demonstrates a 1-bit full adder implemented by instantiating a 1-bit half adder module. The design is verified using a testbench that covers all possible input combinations for `a`, `b`, and `cin`.

## Project Files

- `halfadder.sv` — 1-bit half adder used as a reusable submodule
- `fulladder.sv` — 1-bit full adder built using two half adders
- `tb_fulladder.sv` — Testbench that verifies the full adder functionality
- `tb_fulladder.vcd` — Generated waveform file during simulation
- `images/wav.png` — Simulation waveform screenshot
- `images/cmd.png` — Terminal output screenshot

## Design Overview

A full adder adds three single-bit inputs:

- `a` — first input bit
- `b` — second input bit
- `cin` — carry-in from the previous stage

It produces:

- `sum` — result bit
- `cout` — carry-out bit

The functionality is implemented in a hierarchical manner:

1. The first half adder computes `sum1 = a ^ b` and `carry1 = a & b`
2. The second half adder computes `sum = sum1 ^ cin` and `carry2 = sum1 & cin`
3. Final carry is `cout = carry1 | carry2`

This uses the fact that a full adder can be built from two half adders and an OR gate for the carry combination.

## Half Adder Module

`halfadder.sv` implements the basic addition of two 1-bit inputs:

```systemverilog
module halfadder(
    input logic a,
    input logic b,
    output logic sum,
    output logic carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule
```

## Full Adder Module

`fulladder.sv` instantiates two `halfadder` modules and combines the carry outputs:

```systemverilog
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
```

## Boolean Equations

The full adder logic can also be represented as:

- `sum = a ^ b ^ cin`
- `cout = (a & b) | (b & cin) | (a & cin)`

These are equivalent to the hierarchical half-adder implementation shown above.

## Truth Table

| a | b | cin | sum | cout |
|---|---|-----|-----|------|
| 0 | 0 | 0   | 0   | 0    |
| 0 | 0 | 1   | 1   | 0    |
| 0 | 1 | 0   | 1   | 0    |
| 0 | 1 | 1   | 0   | 1    |
| 1 | 0 | 0   | 1   | 0    |
| 1 | 0 | 1   | 0   | 1    |
| 1 | 1 | 0   | 0   | 1    |
| 1 | 1 | 1   | 1   | 1    |

## Testbench Description

The testbench `tb_fulladder.sv` instantiates the `fulladder` DUT and iterates through all 8 possible input combinations.

For each case, it:

- applies values to `a`, `b`, and `cin`
- waits for a simulation delay of `#10`
- computes expected values using logical expressions
- compares actual and expected outputs
- prints either a pass or fail message using `$display`
- saves a VCD waveform using `$dumpfile` and `$dumpvars`

This confirms that the hierarchical implementation behaves exactly like a standard full adder.

## Simulation Waveforms

The images below show the waveform output and command output from the simulation.

![Waveform output](images/wav.png)
![Console output](images/cmd.png)


## Learning Value

This project helps in understanding:

- module-based design in SystemVerilog
- hierarchical digital design using submodules
- half adder and full adder logic
- RTL verification through testbenches
- waveform analysis for combinational logic

## Summary

The full adder is built using two half adders connected together. This modular design demonstrates how larger digital arithmetic circuits can be created by reusing smaller blocks, making the design easier to understand, verify, and extend.
