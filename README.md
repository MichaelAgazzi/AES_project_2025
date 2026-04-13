# AES Project 2025 — Power System Frequency Control

> **Course project** for the Advanced Energy Systems (AES) course, Academic Year 2024–2025.  
> Authors: **Leva & Dolci**

This project models and simulates the **three-level hierarchical frequency control** (primary, secondary, and tertiary) of a small power system composed of three generators, following a realistic demand profile with step disturbances.

---

## Table of Contents

- [Problem Overview](#problem-overview)
- [System Model](#system-model)
- [Control Hierarchy](#control-hierarchy)
- [Repository Structure](#repository-structure)
- [Tools & Requirements](#tools--requirements)
- [How to Run](#how-to-run)
- [Key Results](#key-results)
- [References](#references)

---

## Problem Overview

The goal is to design and simulate a complete power system control stack that:

1. **Minimises generation cost** (tertiary control — economic dispatch)
2. **Restores nominal frequency** after load changes (secondary control — integral action)
3. **Limits frequency nadir** during transients (primary control — droop)

The total electrical demand `P_e` varies over time, and the system must track it while keeping the frequency deviation `Δω` within acceptable bounds and settling within **600 seconds** (10 minutes).

---

## System Model

### Generators

Three thermal generators with nonlinear cost curves:

| Generator | P_nom (MW) | P_opt (MW) | P_mml (MW) | c_opt (€/MWh) | c_mml (€/MWh) |
|-----------|-----------|-----------|-----------|--------------|--------------|
| G1        | 50        | 45        | 10        | 50           | 80           |
| G2        | 100       | 90        | 20        | 50           | 120          |
| G3        | 120       | 105       | 50        | 60           | 90           |

Each generator is modeled with a **second-order dynamic transfer function**:

$$G(s) = \frac{P_n}{(1 + s\,\tau_1)(1 + s\,\tau_2)}, \quad \tau_1 = 20\,\text{s},\; \tau_2 = 4\,\text{s}$$

### Network Dynamics

Frequency deviation evolves according to:

$$\dot{\Delta\omega} = \frac{1}{J\,\omega_0^2}(\Delta P - \Delta P_e)$$

where `J` is the network inertia and `ω₀ = 2πf₀` is the nominal angular frequency.

### Cost Model

The per-generator cost function used in the economic dispatch is:

$$C_i(P_i) = \left[c_{opt,i} + \frac{c_{mml,i} - c_{opt,i}}{(P_{opt,i} - P_{mml,i})^2}(P_i - P_{opt,i})^2\right] P_i$$

---

## Control Hierarchy

### Tertiary Control (Economic Dispatch)
Solves the following mixed-integer nonlinear optimisation at each dispatch interval:

$$\min_{\{P_i,\,u_i\}} \sum_{i=1}^{3} C_i(P_i)\,u_i$$

subject to:

$$P_{mml,i}\,u_i \leq P_i \leq P_{nom,i}\,u_i, \quad \sum_{i=1}^{3} P_i = P_e, \quad u_i \in \{0,1\}$$

Since the problem is nonlinear with binary variables, **brute-force enumeration** over all generator ON/OFF combinations is used, with `fmincon` solving the continuous subproblem for each combination.

### Secondary Control
An **integral controller** tracks the Area Control Error (ACE) to restore frequency to its nominal value after any persistent deviation.

### Primary Control
A **droop controller** provides an immediate proportional response to frequency deviations, limiting the frequency nadir before secondary action takes over.

---

## Repository Structure

```
AES_project_2025/
│
├── matlab/
│   ├── optimization_AES.m          # Tertiary control: economic dispatch via fmincon
│   ├── project_regulators.m        # Primary & secondary regulator design
│   └── prim_sec_tert_control.slx   # Simulink model: full three-level control loop
│
├── AES_project.mo                  # Modelica/OpenModelica system model
│
├── csv/                            # Simulation output data (CSV format)
├── png/                            # Result plots (frequency, power, control signals)
│
├── AES_project.pptx                # Presentation slides
├── AES-project-2024.2025-E.pdf     # Official project specification
├── Speech_Leva_Dolci.txt           # Oral presentation script
└── README.md
```

---

## Tools & Requirements

| Tool | Purpose |
|------|---------|
| **MATLAB R2023+** | Optimisation scripts (`fmincon`), regulator design |
| **Simulink** | Dynamic simulation of the three-level control system |
| **OpenModelica** (optional) | Alternative simulation via the `.mo` model |

No additional MATLAB toolboxes beyond **Optimization Toolbox** are required.

---

## How to Run

### Tertiary Control Optimisation (MATLAB)
```matlab
cd matlab
run('optimization_AES.m')
```
This sweeps all demand levels, finds the optimal generator dispatch, and produces cost and power allocation plots.

### Full Dynamic Simulation (Simulink)
1. Open MATLAB and navigate to the `matlab/` folder.
2. Run `project_regulators.m` first to initialise regulator parameters in the workspace.
3. Open `prim_sec_tert_control.slx` and click **Run**.
4. Simulation results (frequency deviation, power outputs, control signals) are saved to the `csv/` and `png/` directories.

### Modelica Simulation (optional)
Open `AES_project.mo` in **OpenModelica** or any compatible Modelica environment and simulate directly.

---

## Key Results

- **Frequency nadir** remains within acceptable limits under all tested demand disturbances.
- **Settling time** is within the 600-second requirement.
- Tertiary control successfully minimises total generation cost by selecting the cheapest feasible generator combination at each demand level.
- Beyond 36 ks in the long-horizon simulation, tertiary control is disabled and the system relies solely on primary + secondary control — a transient spike in frequency is observed at that switchover point.

Result plots are available in the [`png/`](./png) folder.

---

## References

- Official project specification: [`AES-project-2024.2025-E.pdf`](./AES-project-2024.2025-E.pdf)
- Presentation: [`AES_project.pptx`](./AES_project.pptx)
