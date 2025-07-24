% Signal Classification using FFT

%% Step 1: Generate Signals
n = 50;  % Number of samples per class
[signals, labels] = generate_signals(n);

%% Step 2: Plot Sample Signals
figure;
subplot(3,1,1); plot(signals(1,:)); title('Sine Signal Sample');
subplot(3,1,2); plot(signals(2*n+1,:)); title('Square Signal Sample');
subplot(3,1,3); plot(signals(n+1,:)); title('Noisy ECG Signal Sample');
saveas(gcf, 'figures/sample_signals.png', 'png');

%% Step 3: Extract FFT Features
X = extract_features(signals);

%% Step 4: Train Classifier
model = train_model(X, labels, 'tree');

%% Step 5: Evaluate Classifier
preds = predict(model, X);
labels_cat = categorical(labels);
preds_cat = categorical(preds);
figure;
confusionchart(labels_cat, preds_cat);
title('Confusion Matrix');
saveas(gcf, 'figures/confusion_matrix.png', 'png');

%% Step 6: Classify New Signal Examples
Fs = 1000;
t = 0:1/Fs:1-1/Fs;
% Sine wave
new_sine = sin(2*pi*12*t);
label_sine = classify_signal(new_sine, model);
fprintf('Predicted label for sine: %s\n', string(label_sine));
% Square wave
new_square = square(2*pi*12*t);
label_square = classify_signal(new_square, model);
fprintf('Predicted label for square: %s\n', string(label_square));
% Noisy ECG-like
new_ecg = sin(2*pi*1.7*t) + 0.5*sin(2*pi*50*t) + 0.2*randn(size(t));
label_ecg = classify_signal(new_ecg, model);
fprintf('Predicted label for noisy ECG: %s\n', string(label_ecg));

%% Step 7: Plot FFT of Each Signal Type
N = size(signals, 2);
f = Fs*(0:(N/2))/N;
signal_names = {'Sine', 'Square', 'ECG'};
sample_indices = [1, n+1, 2*n+1];
figure;
for i = 1:3
    Y = abs(fft(signals(sample_indices(i), :)));
    Y = Y(1:N/2+1);
    subplot(3,1,i);
    plot(f, Y);
    title([signal_names{i}, ' Signal FFT']);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
end
saveas(gcf, 'figures/signal_fft.png', 'png');