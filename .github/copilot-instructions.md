<!-- Use this file to provide workspace-specific custom instructions to Copilot. For more details, visit https://code.visualstudio.com/docs/copilot/copilot-customization#_use-a-githubcopilotinstructionsmd-file -->

# Grid Memory (grid_mem) - Verilog Project

## Project Overview
This is a Verilog HDL project for designing and simulating a grid-based memory system. The project structure follows standard hardware design practices with separate directories for source code, testbenches, and documentation.

## Directory Structure
- `src/` - Main Verilog source files
- `tb/` - Testbench files for simulation
- `docs/` - Project documentation
- `.vscode/` - VS Code workspace configuration

## Development Guidelines

### Verilog Coding Standards
- Use consistent indentation (2 or 4 spaces)
- Include descriptive module comments
- Follow IEEE Verilog naming conventions
- Use meaningful signal and variable names

### File Organization
- Source modules in `src/` directory
- One module per file when possible
- Testbenches in `tb/` directory with `_tb.v` suffix

### Simulation
- Use ModelSim, Vivado, or compatible Verilog simulator
- Create comprehensive testbenches for all modules
- Include waveform analysis capabilities

## Getting Started
1. Create Verilog source files in `src/`
2. Write testbenches in `tb/`
3. Run simulations with your preferred simulator
4. Document designs in `docs/`

## Recommended Extensions
- Verilog-HDL/SystemVerilog (for syntax highlighting and linting)
