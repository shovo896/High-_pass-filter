% Parameters
Fs = 1000;           % Sampling frequency (Hz)
Fc = 100;            % Cutoff frequency (Hz)
order = 4;           % Filter order

% Design high-pass Butterworth filter
[b, a] = butter(order, Fc/(Fs/2), 'high');

% Sample signal
t = 0:1/Fs:1;
x = sin(2*pi*20*t) + sin(2*pi*200*t);  % Mixed signal

% Apply filter
y = filter(b, a, x);

% Plot
figure;
subplot(2,1,1); plot(t, x); title('Original Signal');
subplot(2,1,2); plot(t, y); title('High-Pass Filtered Signal');
