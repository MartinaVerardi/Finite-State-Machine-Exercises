# <!-- PROJECT LOGO -->
<br />
<div align="center">

  <h3 align="center">Finite State Machine - FSMprob</h3>

  <p align="center">
    A SystemVerilog implementation of a Moore finite state machine (FSM).
    <br />
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#state-transition-diagram">State Transition Diagram</a></li>
    <li><a href="#inputs">Inputs</a></li>
    <li><a href="#outputs">Outputs</a></li>
    <li><a href="#example-workflow">Example Workflow</a></li>
    <li><a href="#usage">Usage</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

The `FSMprob` module is a Moore finite state machine (FSM) implemented in SystemVerilog. It consists of four states (A, B, C, and D) and transitions based on two inputs (`i` and `j`). The outputs (`x` and `y`) depend only on the current state, making it a Moore machine.

This FSM is explicitly coded using an enumerated type for state representation and separate combinational and sequential logic blocks for state transitions and outputs.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- STATE TRANSITION DIAGRAM -->
## State Transition Diagram

![WhatsApp Image 2025-02-12 at 18 02 00_c0c24998](https://github.com/user-attachments/assets/d63aa335-5cae-4b36-9608-78a8743891da)


<p align="right">(<a href="#top">back to top</a>)</p>

<!-- INPUTS -->
## Inputs
1. **clk**: Clock signal (positive edge triggered).
2. **rstN**: Active-low reset signal.
3. **i**: Control input affecting state transitions.
4. **j**: Control input affecting state transitions.

<!-- OUTPUTS -->
## Outputs
1. **x**: FSM output dependent on the current state.
2. **y**: FSM output dependent on the current state.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- EXAMPLE WORKFLOW -->
## Example Workflow

1. The FSM starts in state `A` when `rstN` is deasserted.
2. When `i = 1`, the FSM transitions from `A` to `B`.
3. If `j = 1` in state `B`, the FSM moves to state `C`.
4. If neither `i` nor `j` is asserted in `C`, the FSM transitions to state `D`.
5. The outputs `x` and `y` change based only on the current state, following Moore machine behavior.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- USAGE -->
## Usage

To instantiate and use the `FSMprob` module:

```verilog
module top;
    logic clk, rstN, i, j;
    logic x, y;
    
    FSMprob fsm_inst (
        .clk(clk), .rstN(rstN), .i(i), .j(j), .x(x), .y(y)
    );
endmodule
```

Provide clock and input signals to observe the FSM behavior.

<p align="right">(<a href="#top">back to top</a>)</p>
