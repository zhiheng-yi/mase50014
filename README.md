# mase50014
This repository contains learning materials and experimental work for the course **MASE50014 (Synthesis of Polymers for A Better World)** at Fudan University.

## Repository Structure

```
├── notes/                      # Course notes
│   ├── *.tex                   # LaTeX source files
│   └── *.pdf                   # Compiled lecture notes
│
└── water-beads-experiment/     # Lab project: hydrogel water beads study
    ├── Visualization_Codes.R   # R code for data visualization
    ├── Raw_Data.xlsx           # Raw experimental measurements
    └── README.md
```

## Contents

### `notes/`
- **LaTeX source code** of course notes.
- **Compiled PDFs** for easy reading and printing.

### `water-beads-experiment/`
- An experimental investigation on the swelling, deswelling, and recovery behaviors of cross-linked sodium polyacrylate hydrogel water beads.
- Includes R scripts for data visualization (swelling kinetics, deswelling comparison, recovery behavior, volume swelling ratios), and raw data (Excel).
- For detailed instructions, please see the [README](water-beads-experiment/README.md) inside that folder.

## How to Use

1. **Clone the repository**  
   ```bash
   git clone https://github.com/zhiheng-yi/mase50014.git
   ```

2. **View the notes** – Open the PDF files in `notes/` directly.

3. **Reproduce the experiment figures** – Navigate to `water-beads-experiment/` and run:
   ```r
   source("Visualization_Codes.R")
   ```
   Make sure required R packages (`ggplot2`, `dplyr`, `tidyr`, `gridExtra`, `scales`) are installed.

## Requirements

- **For the experiment part:** R (≥ 4.0) with the packages listed above.
- **For the notes:** A LaTeX compiler (XeLaTeX recommanded) if you wish to recompile the source files. Otherwise, the PDFs are ready to read.

## Author

Zhiheng Yi, GitHub: [@zhiheng-yi](https://github.com/zhiheng-yi)

## License

This repository is for educational purposes. The code and data are shared under the MIT License.

---

*Last updated: 2026-05-07*
