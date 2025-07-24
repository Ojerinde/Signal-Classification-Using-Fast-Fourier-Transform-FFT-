function X = extract_features(signals)
    nSignals = size(signals, 1);
    N = size(signals, 2);
    X = zeros(nSignals, 20);  % First 20 FFT magnitude features

    for i = 1:nSignals
        Y = abs(fft(signals(i, :)));
        X(i, :) = Y(1:20); % Extract first 20 components
    end
end
