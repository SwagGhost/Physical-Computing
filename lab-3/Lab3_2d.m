% We downloaded the sound we needed from Canvas.
% We saved it as ?fishmusic.wav?.
% Then, we read the soundwave file.
% s is the vector with samples.
% fs is the sampling frequency:
[s, fs] = audioread('fishmusic.wav');
% We know what we have 416879 samples.
% We make another vector var with
% the elements of vector s:
var = s(1:416879);
% The total number of samples is equal to 1024:
N = 1024;
% We apply FFT on vector s with N = 1024 samples.
% The returned vector is fft_vector with 1024 elements:
fft_vector = fft(s,N);
% fft_vector is a complex function, so we only take the real part:
m = abs(fft_vector);
% Only the first half is useful:
halfN = N/2;
% We make the frequency axis for
% the first half of the returned vector:
x = (0:halfN-1)*fs/N;
m = m(1:halfN);
% A general frequency spectrum plot:
plot(x,m);
% For 3 seconds:
pause(10);
% We want to plot only the harmonics from 0 to 2500 Hz:
x=x(1:50);
m=m(1:50);
% Plot frequency spectrum:
stem(x,m);
% For 3 seconds:
pause(3);
xlabel('Frequency Hz');
ylabel('Amplitude');
fft_vector=fft(x,N);
% We are only interested in the amplitude:
m = abs(fft_vector);
% The frequency axis with the first 1000 elements:
x = (0:999)*fs/N;
% We plot the frequency spectogram:
stem(x, m(1:1000));
% For 1 second:
pause(1);
xlabel ('Frequency [Hz]');
spectrogram (var,256,128,256,fs,'xaxis');