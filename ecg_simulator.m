function ecg = ecg_simulator(t)
    ecg = sin(2*pi*1.7*t) + 0.5*sin(2*pi*50*t);
    ecg = ecg + 0.2*randn(size(t));
end