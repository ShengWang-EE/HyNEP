# HyNEP

Hydrogen-blended nodal energy price modeling for integrated electricity and gas systems in MATLAB.

This repository contains the MATLAB scripts, case data, and solver implementations used to study nodal energy pricing in hydrogen-blended integrated electricity and gas systems (IEGS). The codebase includes both a smaller study case and a larger north-west system case.

## Repository Structure

- `scripts/` main runnable scripts and path bootstrap helpers
- `src/cases/` electricity and gas network case definitions
- `src/solvers/` optimization models and supporting constraint/objective functions
- `src/utils/` shared utility functions
- `data/raw/` original input data files
- `data/processed/` processed MATLAB data files used by the scripts
- `docs/` supplementary project documentation and citation guidance
- `external/matpower/` vendored MATPOWER dependency used by the project
- `archive/` local backup or legacy files retained for reference

## Requirements

- MATLAB
- YALMIP
- MATPOWER
- One supported optimizer for YALMIP
  - MOSEK is preferred
  - Gurobi is used as a fallback when available

## Quick Start

1. Open MATLAB and set the current folder to the repository root.
2. Ensure YALMIP is available in your MATLAB path.
3. Ensure MOSEK or Gurobi is installed.
4. Run:

```matlab
run_main_steady
```

The startup script will call `scripts/setup_paths.m`, add the local source folders, and add the vendored MATPOWER paths under `external/matpower/`.

## Main Entry Points

- `run_main_steady.m` root-level launcher
- `scripts/main_steady.m` main experiment script
- `src/solvers/alternative_gas/GEopf_alternativeGas.m` main hydrogen-blended steady-state solver
- `src/solvers/alternative_gas/GEopf_alternativeGas_largeCase.m` large-case solver

## Data and Dependencies

- Wind and demand input files are stored in `data/raw/`
- Processed wind data used by the script is stored in `data/processed/windData.mat`
- MATPOWER is currently included under `external/matpower/`
- `docs/supporting_document_v1.pdf` contains supporting project material

## Citation

If you use this repository in academic work, please cite the associated paper:

- Wang, S.; Hui, H.; Zhai, J.; Siano, P., "Carbon-Embedded Nodal Energy Price in Hydrogen-Blended Integrated Electricity and Gas Systems with Heterogeneous Gas Compositions," `IEEE Transactions on Sustainable Energy`, vol. 15, no. 3, pp. 1729-1742, 2024.
- DOI: `10.1109/TSTE.2024.3372628`
- IEEE Xplore page: `https://ieeexplore.ieee.org/abstract/document/10458410`
- Citation files in this repository:
  - `CITATION.cff`
  - `docs/citation.md`

## License

This repository is released under the MIT License. See `LICENSE`.
