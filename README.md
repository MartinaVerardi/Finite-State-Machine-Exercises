# <!-- PROJECT LOGO -->
<br />
<div align="center">

  <h3 align="center">Finite State Machine (FSM) Implementations</h3>

  <p align="center">
    A collection of SystemVerilog FSM implementations, including Mealy and Moore machines.
    <br />
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#folder-contents">Folder Contents</a></li>
    <li><a href="#usage">Usage</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

This repository contains three different implementations of a finite state machine (FSM) written in SystemVerilog:

1. **Mealy Machine FSM** - Outputs depend on both the state and the inputs.
2. **Moore Machine FSM** - Outputs depend only on the state.
3. **8 Bit Register FSM** 

Each implementation demonstrates different approaches to FSM design, including state transitions, output logic, and sequential vs. combinational logic separation.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- FOLDER CONTENTS -->
## Folder Contents

- `3_1__8_bit_register` - SystemVerilog implementation of an 8 bit Register.
- `3_2__FSM_1` - SystemVerilog implementation of a Mealy machine FSM.
- `3_3__FSM_2` - SystemVerilog implementation of a Moore machine FSM.
- `README.md` - Documentation for the FSM implementations.

<p align="right">(<a href="#top">back to top</a>)</p>


## Usage

To simulate the FSMs, use a SystemVerilog simulator such as ModelSim, QuestaSim, or Vivado.

### Example Compilation and Simulation
```shell
vlog FSMprob_mealy.sv FSMprob_testbench.sv
vsim -c -do "run -all" work.FSMprob_testbench
```

Replace `FSMprob_mealy.sv` with `FSMprob_moore.sv` to test the Moore machine instead.

<p align="right">(<a href="#top">back to top</a>)</p>
