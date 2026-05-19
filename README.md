# Vivado Data Selector

This repository contains the Verilog HDL implementation, simulation testbenches, and AMD Xilinx Vivado synthesis configurations for digital data selectors. The primary focus is the behavioral and structural design of combinational multiplexer ICs scaled for implementation on physical FPGA development boards.

##  Project Overview

Data selectors, or Multiplexers (MUX), form the backbone of routing infrastructure in digital systems and ALU designs. This project implements a hardware-validated data selector, detailing the end-to-end design flow in Xilinx Vivado:

* **Hardware Description:** Writing clean, synthesis-friendly Verilog code using both behavioral (`always` blocks, `case` statements) and structural modeling techniques.
* **Verification:** Designing rigorous testbenches to simulate all input permutations and verify functional correctness before flashing to hardware.
* **FPGA Deployment:** Mapping design ports to physical I/O pins (switches, buttons, and LEDs) using Xilinx Design Constraints (XDC).

---

##  Features

* **Dual-Modeling Paradigms:** Includes both behavioral descriptions (ideal for high-level synthesis) and structural descriptions (ideal for understanding gate-level mapping).
* **Fully Automated Testbenches:** Simulation files featuring exhaustive stimulus generation to visually verify line switching on Vivado's behavioral simulator waveform viewer.
* **Synthesis & Implementation Ready:** Configured to compile seamlessly through the Vivado synthesis pipeline, optimizing Look-Up Table (LUT) utilization on target FPGA architectures.

---

##  Design Specification Example: 8-to-1 Multiplexer

For multi-line data selectors (such as an 8-line to 1-line multiplexer), the circuit selects one of $N$ data inputs based on a binary select code:

* **Data Inputs:** $I_0$ through $I_7$ (8-bit vector)
* **Select Lines:** $S_0, S_1, S_2$ (3-bit control vector to decode $2^3 = 8$ states)
* **Output:** $Y$ (Single scalar bit routing the active input channel)

### Block Diagram

```
              8-to-1 Data Selector
               ┌───────────────┐
     I[7:0] ───┤ 0             │
 (Data In)     │ 1             │
               │ .             ├─► Y (Data Out)
               │ 7             │
               └───────┬───────┘
                       ▲
                       │ S[2:0] (Select Lines)

```

---

##  Repository Structure

```text
├── src/
│   ├── data_selector.v       # Main Verilog module (Behavioral/Structural design)
│   └── data_selector_tb.v    # Testbench file containing clock/stimulus blocks
├── constraints/
│   └── target_board.xdc      # Xilinx Design Constraints mapping ports to FPGA pins
└── README.md                 # Project documentation

```

---

##  Vivado Deployment Workflow

### 1. Project Setup

1. Open AMD Xilinx Vivado (2020.1 or later recommended).
2. Create a new RTL Project and select your target FPGA board (e.g., Basys 3, Nexys A7, or Artix-7).
3. Add the source files from `src/` and the constraints file from `constraints/`.

### 2. Behavioral Simulation

Before synthesizing, run a behavioral simulation to confirm the data routing logic acts as expected:

1. Set `data_selector_tb.v` as the top-level simulation module.
2. Click **Run Simulation** ──► **Run Behavioral Simulation**.
3. Check the waveform viewer to verify that output `Y` changes exactly alongside changes to select bits `S`.

### 3. Synthesis, Implementation, and Bitstream Generation

1. Click **Run Synthesis** to convert the Verilog description into netlist gates.
2. Click **Run Implementation** to handle floorplanning, placement, and routing across FPGA slices.
3. Click **Generate Bitstream** to compile the final `.bit` file.
4. Open the **Hardware Manager**, connect your physical board via USB, and click **Program Device** to flash the hardware.
