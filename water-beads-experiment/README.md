# Water Beads Experiment – Data and Visualization

This flie contains R code and raw data for generating figures from the course experimental study

> **Swelling, Deswelling, and Recovery Behaviors of Cross-linked Sodium Polyacrylate Hydrogel Beads: An Experimental Investigation**  

The course experiment measures the size change of commercial sodium polyacrylate water beads in response to:
- Swelling in deionized water
- Deswelling in NaCl and CaCl<sub>2</sub> solutions
- Recovery upon returning to pure water

## Contents

| File | Description |
|------|-------------|
| `Visualization_Codes.R` | R script that generates all figures in the paper|
| `Raw_Data.xlsx` | Original experimental measurements (swelling, deswelling, and recovery)|
| `swelling_kinetics.png` | Time‑course of bead diameter in pure water (output) |
| `deswelling_comparison.png` | Diameter before/after 12 h in salt solutions (output) |
| `recovery_behavior.png` | Reswelling kinetics after salt treatment (output) |
| `volume_ratios.png` | Volume swelling ratios on a log scale (output) |

## Requirements

Install the following R packages before running the script:

```r
install.packages(c("ggplot2", "dplyr", "tidyr", "gridExtra", "scales"))
```

## Usage

### Option 1: Run the R script directly (hard‑coded data)

```r
source("Visualization_Codes.R")
```

All figures will be saved as PNG files in the current working directory.
The image sizes (width, height, dpi, etc.) in the code can be adjusted as needed.
The figures presented in the report were resized for publication.
You can also preview the figures interactively in the RStudio plot panel.

### Option 2: Use the raw Excel data

The file `Raw_Data.xlsx` contains the original measurement sheets.
You can modify the R script to read from this file instead of the hard‑coded values.

## Data Sources

All data are transcribed from the experimental record sheets (Appendix‑1 of the original report):

- **Dry diameter**: 2.04 ± 0.05 mm (n = 5)
- **Swelling kinetics**: 12 time points from 0 to 1440 min (n = 5 per time point)
- **Deswelling**: 720 min in NaCl solution (n = 5) and in CaCl<sub>2</sub> solution (n = 5)
- **Recovery**: 360 min and 1440 min in deionized water with periodic water replacement (n = 5)

The complete dataset is provided in `Raw_Data.xlsx`.

## Key Results

- Equilibrium volume swelling ratio: **531‑fold** (Q = 531)
- NaCl deswelling: diameter reduced to **38.1%** of original (reversible)
- CaCl<sub>2</sub> deswelling: diameter reduced to **44.8%** of original (partially irreversible)
- Recovery after 24 h: **100.5%** (NaCl) vs. **46.5%** (CaCl<sub>2</sub>) of original

## License

This code and data are provided for academic and open‑source use under the MIT License.

## Author

Zhiheng Yi, GitHub: [@zhiheng-yi](https://github.com/zhiheng-yi)
