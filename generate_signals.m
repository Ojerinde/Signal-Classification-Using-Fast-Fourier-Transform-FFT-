function [signals, labels] = generate_signals(n)
    Fs = 1000; % Sampling frequency
    t = 0:1/Fs:1-1/Fs; % 1 second duration

    signals = [];
    labels = [];

    for i = 1:n
        f = randi([5, 20]);
        
        % Sine wave
        sig1 = sin(2*pi*f*t);
        signals = [signals; sig1];
        labels = [labels; "sine"];

        % Square wave
        sig2 = square(2*pi*f*t);
        signals = [signals; sig2];
        labels = [labels; "square"];

        % ECG-like noisy signal
        ecg = ecg_simulator(t);
        signals = [signals; ecg];
        labels = [labels; "ecg"];
    end
end

