function label = classify_signal(new_signal, model)
    Y = abs(fft(new_signal));
    Xnew = Y(1:20);  % Match feature format
    label = predict(model, Xnew);
end
