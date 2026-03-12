# HyNEP

Hydrogen-blended nodal energy price modeling for integrated electricity and gas systems in MATLAB.  
基于 MATLAB 的掺氢综合电气系统节点能源价格建模代码。

This repository contains the MATLAB scripts, case data, and solver implementations used to study nodal energy pricing in hydrogen-blended integrated electricity and gas systems (IEGS). The codebase includes both a smaller study case and a larger north-west system case.  
本仓库包含用于研究掺氢综合电气系统（IEGS）节点能源价格的 MATLAB 脚本、案例数据和求解器实现。代码同时包含一个较小算例和一个大规模西北地区算例。

## Repository Structure / 项目结构

- `scripts/`: main runnable scripts and path bootstrap helpers / 主运行脚本与路径初始化脚本
- `src/cases/`: electricity and gas network case definitions / 电网与气网案例定义
- `src/solvers/`: optimization models and supporting constraint/objective functions / 优化模型及其约束与目标函数
- `src/utils/`: shared utility functions / 通用工具函数
- `data/raw/`: original input data files / 原始输入数据
- `data/processed/`: processed MATLAB data files used by the scripts / 脚本使用的预处理 MATLAB 数据文件
- `docs/`: supplementary project documentation and citation guidance / 补充说明文档与引用说明
- `external/matpower/`: vendored MATPOWER dependency used by the project / 项目使用的 MATPOWER 依赖
- `archive/`: local backup or legacy files retained for reference / 本地备份或历史遗留文件

## Requirements / 运行依赖

- MATLAB
- YALMIP
- MATPOWER
- One supported optimizer for YALMIP; MOSEK is preferred and Gurobi is used as a fallback when available.  
  一个 YALMIP 支持的优化器；优先使用 MOSEK，如不可用则回退到 Gurobi。

## Quick Start / 快速开始

1. Open MATLAB and set the current folder to the repository root.  
   打开 MATLAB，并将当前目录切换到仓库根目录。
2. Ensure YALMIP is available in your MATLAB path.  
   确保 YALMIP 已加入 MATLAB 路径。
3. Ensure MOSEK or Gurobi is installed.  
   确保已安装 MOSEK 或 Gurobi。
4. Run:  
   运行：

```matlab
run_main_steady
```

The startup script will call `scripts/setup_paths.m`, add the local source folders, and add the vendored MATPOWER paths under `external/matpower/`.  
启动脚本会调用 `scripts/setup_paths.m`，自动加入本地源码目录，并添加 `external/matpower/` 下的 MATPOWER 路径。

## Main Entry Points / 主要入口

- `run_main_steady.m`: root-level launcher / 根目录启动入口
- `scripts/main_steady.m`: main experiment script / 主实验脚本
- `src/solvers/alternative_gas/GEopf_alternativeGas.m`: main hydrogen-blended steady-state solver / 掺氢稳态主求解器
- `src/solvers/alternative_gas/GEopf_alternativeGas_largeCase.m`: large-case solver / 大规模算例求解器

## Data and Dependencies / 数据与依赖

- Wind and demand input files are stored in `data/raw/`.  
  风速和负荷输入文件存放在 `data/raw/`。
- Processed wind data used by the script is stored in `data/processed/windData.mat`.  
  脚本使用的风电预处理数据存放在 `data/processed/windData.mat`。
- MATPOWER is currently included under `external/matpower/`.  
  MATPOWER 当前放在 `external/matpower/` 目录下。
- `docs/supporting_document_v1.pdf` contains supporting project material.  
  `docs/supporting_document_v1.pdf` 为项目补充材料。

## Citation / 引用

If you use this repository in academic work, please cite the associated paper.  
如果你在学术工作中使用了本仓库，请引用对应论文。

- Wang, S.; Hui, H.; Zhai, J.; Siano, P., "Carbon-Embedded Nodal Energy Price in Hydrogen-Blended Integrated Electricity and Gas Systems with Heterogeneous Gas Compositions," `IEEE Transactions on Sustainable Energy`, vol. 15, no. 3, pp. 1729-1742, 2024.
- DOI: `10.1109/TSTE.2024.3372628`
- IEEE Xplore page: `https://ieeexplore.ieee.org/abstract/document/10458410`
- Citation files in this repository / 仓库中的引用文件:
  - `CITATION.cff`
  - `docs/citation.md`

## License / 许可证

This repository is released under the MIT License. See `LICENSE`.  
本仓库采用 MIT 许可证发布，详见 `LICENSE`。
