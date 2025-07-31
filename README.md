# Signal Classification with FFT

## What This Project Does

This project builds a system in MATLAB to identify different types of signals—smooth sine waves, blocky square waves, and noisy ECG-like signals. It uses Fast Fourier Transform (FFT) to analyze signals and a classifier (Decision Tree or SVM) to label them correctly. Think of it as teaching a computer to recognize different "tunes" in data, which is useful for things like monitoring heart signals, analyzing audio, or improving communication systems.

The system generates sample signals, processes them, trains a model, checks its accuracy, and creates plots to show the results.

## Why FFT Is Cool

FFT turns signals into their frequency patterns, like revealing the unique "sound" of each signal type. A sine wave has one clear frequency, a square wave has multiple sharp ones, and an ECG is messy with noise. This makes it easier to tell them apart.

The FFT formula is:

\[ X(k) = \sum\_{n=0}^{N-1} x(n) e^{-j \frac{2\pi}{N} kn} \]

- \( x(n) \): Signal data over time
- \( X(k) \): Strength of each frequency
- \( N \): Number of data points
- \( k \): Specific frequency

I use the first 20 FFT values as features because they capture the main patterns, while higher ones often just show noise. FFT is super efficient, cutting computation time from millions to thousands of operations for a typical signal.

## How Classification Works

I use a Decision Tree to sort signals, like a flowchart asking yes/no questions (e.g., “Is this frequency strong?”) to decide if a signal is a sine, square, or ECG. It picks questions that reduce uncertainty, measured by entropy:

\[ H(S) = -\sum\_{i=1}^{c} p_i \log_2 p_i \]

- \( p_i \): Proportion of each signal type
- \( c \): Number of signal types (3 here)

The tree chooses splits that give the most clarity, stopping when it’s confident or hits a limit to avoid overcomplicating things.

## How I Measure Success

I use a confusion matrix to see how often the model gets it right, showing true vs. predicted labels. I also calculate accuracy, precision, and recall to gauge performance.

## How It’s Built

### Key Parts

- **Signal Creation** (`generate_signals.m`, `ecg_simulator.m`): Makes 50 samples each of sine, square, and ECG signals at 1000 Hz, with noise added to ECGs for realism.
- **Feature Extraction** (`extract_features.m`): Runs FFT and grabs the first 20 frequency values as features.
- **Training** (`train_model.m`): Teaches a Decision Tree or SVM to recognize signal patterns.
- **Classification** (`classify_signal.m`): Labels new signals using FFT and the trained model.
- **Main Script** (`main.m`): Runs the whole process from start to finish.

### Signal Types

| Signal Type | Description                 | Features Used       |
| ----------- | --------------------------- | ------------------- |
| Sine        | Smooth wave (5–20 Hz)       | First 20 FFT values |
| Square      | Blocky wave (5–20 Hz)       | First 20 FFT values |
| ECG         | Noisy heartbeat-like signal | First 20 FFT values |

## Why It Matters

- **Health Tech**: Spots ECG patterns for heart monitoring.
- **Audio**: Identifies different sounds or instruments.
- **Telecom**: Helps analyze signal types for better data transfer.
- **Fault Detection**: Catches Iird signals in machines or sensors.

## How to Run It

### What You Need

- MATLAB (R2019a or neIr)
- Signal Processing Toolbox
- Statistics and Machine Learning Toolbox

### Steps

1. Clone the project:
   ```bash
   git clone https://github.com/your-username/signal-classification-fft.git
   cd signal-classification-fft
   ```
2. Open MATLAB, go to the project folder, and run:
   ```matlab
   run('main.m')
   ```

## Visuals

The system creates plots to show what’s going on:

- **Sample Signals** (`figures/sample_signals.png`): Shows how sine, square, and ECG signals look over time.
- **FFT Spectra** (`figures/signal_fft.png`): Highlights the unique frequency patterns of each signal.
- **Confusion Matrix** (`figures/confusion_matrix.png`): A heatmap showing how accurately the model labels signals.

## Project Files

```
signal-classification-fft/
├── src/
│   ├── classify_signal.m     # Labels new signals
│   ├── generate_signals.m    # Creates sample signals
│   ├── ecg_simulator.m      # Makes ECG-like signals
│   ├── train_model.m        # Trains the classifier
│   ├── extract_features.m   # Gets FFT features
│   └── main.m               # Runs everything
├── figures/
│   ├── sample_signals.png   # Time-domain plots
│   ├── confusion_matrix.png # Accuracy heatmap
│   └── signal_fft.png       # Frequency plots
├── README.md
└── requirements.txt
```

## References

- Oppenheim, A. V., & Schafer, R. W. (2010). _Discrete-Time Signal Processing_. 3rd Ed. Prentice Hall.
- MATLAB Signal Processing Toolbox: https://www.mathworks.com/products/signal.html
- MATLAB Statistics and Machine Learning Toolbox: https://www.mathworks.com/products/statistics.html
