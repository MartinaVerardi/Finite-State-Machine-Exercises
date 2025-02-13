# <!-- PROJECT LOGO -->
<br />
<div align="center">

  <h3 align="center">8-bit Register - regWithBenefits</h3>

  <p align="center">
    A Verilog model of an 8-bit register with multiple control inputs.
    <br />
  </p>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#inputs">Inputs</a></li>
    <li><a href="#outputs">Outputs</a></li>
    <li><a href="#example-workflow">Example Workflow</a></li>
    <li><a href="#error-handling">Error Handling</a></li>
    <li><a href="#usage">Usage</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project

The `regWithBenefits` module is an 8-bit register that supports loading data, shifting left, and clearing operations. It includes both synchronous and asynchronous clear functionalities and follows a predefined priority order when multiple control signals are asserted.

### Inputs:
1. **d [W-1:0]**: Data input to be loaded into the register.
2. **rstN**: Asynchronous active-low reset.
3. **ck**: Clock signal (positive edge triggered).
4. **clr**: Synchronous clear (sets register to zero when asserted).
5. **ld**: Load enable signal, loads `d` into the register.
6. **shl**: Shift-left enable signal, shifts data left by one bit.
7. **shIn**: Serial input for the shift-left operation.

### Outputs:
1. **q [W-1:0]**: Register output storing the current state.

### Description:
- The module updates the register on the positive edge of `ck`.
- If `rstN` is deasserted (0), the register is cleared asynchronously.
- If `clr` is asserted, the register is cleared synchronously.
- If `ld` is asserted, the register loads the value from `d`.
- If `shl` is asserted, the register shifts left and inserts `shIn` into the LSB.
- The execution order when multiple signals are asserted is: `clr` → `ld` → `shl`.

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- EXAMPLE WORKFLOW -->
## Example Workflow:

1. The register starts with an initial value of `8'b00000000`.
2. The `ld` signal is asserted with `d = 8'b10101010`, loading this value.
3. The `shl` signal is then asserted with `shIn = 1'b1`, shifting left.
4. The register updates to `8'b01010101` after shifting.

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- ERROR HANDLING -->
## Error Handling:

- If `rstN` is held low, the register remains cleared regardless of other signals.
- If multiple signals are asserted, the predefined priority order prevents conflicts.

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- USAGE -->
## Usage:

To instantiate and use the `regWithBenefits` module:

```verilog
module top;
    logic [7:0] d;
    logic rstN, ck, clr, ld, shl, shIn;
    logic [7:0] q;
    
    regWithBenefits #(.W(8)) reg_inst (
        .d(d), .rstN(rstN), .ck(ck), .clr(clr), .ld(ld), .shl(shl), .shIn(shIn), .q(q)
    );
endmodule
```

Provide clock and control signals to observe register behavior.

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[linkedin-url]: https://linkedin.com/in/MartinaVerardi
