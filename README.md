# Supercontinuum Generation in Photonic Crystal Fiber

![Supercontinuum Generation](https://www.bing.com/images/search?view=detailV2&ccid=5jNac0R7&id=8A1BE8FF8B0BE02F62C408E6500FEA83A9081120&thid=OIP.5jNac0R7bSVslRAuJ2cyCAHaHH&mediaurl=https%3a%2f%2fai2-s2-public.s3.amazonaws.com%2ffigures%2f2017-08-08%2f29e7e65f8557a12a93561f3e6ea9edfcd0ac78c2%2f1-Figure1-1.png&exph=590&expw=614&q=Supercontinuum+Generation+in+Photonic+Crystal+Fiber&simid=607990494576801660&FORM=IRPRST&ck=2A4254CDC47D162DF18E94FC5975B899&selectedIndex=15&itb=0)

## Overview


This repository explores the phenomenon of supercontinuum generation in photonic crystal fibers (PCFs), focusing on Power Spectral Density (PSD) variations and optical rogue waves (RWs) formation under different pumping conditions. It includes MATLAB simulations and experimental data analysis to validate theoretical models against practical results.

## Key Features

- **PSD Analysis:** Collaborated with PhD students to analyze PSD variations along the fiber input using MATLAB simulations. Implemented iterative averaging and direct computation methods for accurate PSD normalization.

- **Optical Rogue Waves:** Investigated RWs in nonlinear optical fibers using Gaussian spectrum models. Compared and validated models against experimental supercontinuum spectra to refine predictions under different pumping scenarios.

## Repository Structure

```
supercontinuum/
│
├── data/
│   ├── experimental_data.mat        # Experimental data in MATLAB format
│   └── simulation_results/         # Results from simulations
│
├── scripts/
│   ├── psd_analysis.m              # MATLAB script for PSD analysis
│   ├── rw_simulation.m             # MATLAB script for RW simulation
│   └── plot_utils.m                # Utility functions for plotting
│
├── images/
│   ├── supercontinuum.png          # Placeholder for supercontinuum image
│   ├── rw_simulation.gif           # Placeholder for RW simulation animation
│   ├── placeholder1.jpg            # Placeholder for additional image
│   └── placeholder2.gif            # Placeholder for additional animation
│
├── README.md                       # This README file
└── LICENSE                         # License information
```

## Getting Started

To get started with the project:

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/supercontinuum.git
   cd supercontinuum
   ```

2. Install MATLAB and required toolboxes.

3. Explore the `scripts/` directory for MATLAB scripts related to PSD analysis and RW simulations.

4. Refer to the `data/` directory for experimental datasets and simulation results.

## Usage

### PSD Analysis

Run `psd_analysis.m` to perform Power Spectral Density analysis along the PCF input. Adjust parameters and visualize results using MATLAB plotting functions.

```matlab
% Example code snippet
load('data/experimental_data.mat');
[psd, frequencies] = calculate_psd(data);
plot_psd(frequencies, psd);
```

### Optical Rogue Waves Simulation

Use `rw_simulation.m` to simulate optical rogue waves formation under different pumping conditions. Compare results with theoretical models and experimental data.

```matlab
% Example code snippet
results = simulate_rw(pump_parameters);
visualize_rw(results);
```

## Adding Animations and Pictures

### Animation 1: Supercontinuum Generation

Include an animation illustrating the supercontinuum generation process here:

```markdown
![Supercontinuum Animation](images/rw_simulation.gif)
```

### Animation 2: Optical Rogue Waves Simulation

Add another animation showing the simulation of optical rogue waves:

```markdown
![RW Simulation Animation](images/placeholder2.gif)
```

### Picture 1: Experimental Setup

Insert an image depicting the experimental setup or a key component:

```markdown
![Experimental Setup](images/placeholder1.jpg)
```

### Picture 2: Results Visualization

Include a picture that showcases visualization of results, such as a plot or graph:

```markdown
![Results Visualization](https://www.intechopen.com/media/chapter/48069/media/fig28.png)
```

## Contributing

Contributions are welcome! Please fork the repository and submit pull requests for any improvements or fixes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- Dr. Balaswamy Velpulu, Indian Institute of Science (IISc), Bangalore
- Meher Vaddi, Shantanu Dambare, for collaboration and valuable insights
