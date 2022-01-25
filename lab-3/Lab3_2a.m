% We want the sum of two sinusoidal signals.
% We want a signal with a frequency of 50 Hz:
f = 50;
% And another signal with a frequency of 100 Hz:
f2 = 100;
% The period of the signal is 0,1 seconds:
Td = 0.1;
% The total number of samples is equal to 1024:
N = 1024;
% The sampling period Ts [s] is Td divided by N:
Ts = Td/N;
% Time axis, where we start at t = 0 and end at t = Td = 0.1.
% We take steps of Ts = 0,1 / 1024 seconds.
t = 0:Ts:Td;
% We generate the signal: (The amplitude A = 1,
% that is why we do not use a variable for A.)
s = sin(2*pi*f*t) + sin(2*pi*f2*t);
grid on;
xlabel ('Time t [seconds]');
% We plot the signal s as a function of t: 
plot(t,s);
% For 3 seconds:
pause(3);
% We define the sampling frequency Fs:
Fs = 1/Ts;
% We apply FFT on vector s with N = 1024 samples.
% The returned vector is fft_vector with 1024 elements:
fft_vector = fft(s,N);
% fft_vector is a complex function, so we only take the real part:
m = abs(fft_vector);
% Only the first half is useful:
halfN = N/2;
% We make the frequency axis for
% the first half of the returned vector:
x = (0:halfN-1)*Fs/N;
m = m(1:halfN);
% A general frequency spectrum plot:
plot(x,m);
% For 1 second:
pause(1);
% We want to plot only the first 12 harmonics from 0 to 110 Hz:
x=x(1:12);
m=m(1:12);
% Plot frequency spectrum from 0 to 110 Hz:
stem(x,m);
% For 3 seconds:
pause(3);
xlabel('Frequency Hz');
ylabel('Amplitude');
fft_vector = fft(x,N);
% We are only interested in the amplitude:
m = abs(fft_vector);
% The frequency axis with the first 1000 elements:
x = (0:999)*Fs/N;
% We plot the frequency spectogram:
stem(x, m(1:1000));
% For 1 second:
pause(1);
xlabel ('Frequency [Hz]');
spectrogram (s,256,128,256,Fs,'xaxis');