% We used a sampling frequency of Fs whereby FS is:
Fs = 8000;
% The total number of samples N is equal to 1000 :
N = 1000;
% We took a small segment of the signal from the 
% tuning fork and put it into a vector y1:
y1 = tuningfork4 (2000:3000);
% We apply FFT on vector y1 with N = 1000 samples.
% The returned vector is fft_vector with 1000 elements:
fft_vector = fft(y1, N);
% We take a smaller segment of our vector fft_vector.
% We store that segment into a new vector y2.
y2 = fft_vector(1:500);
% We are only interested in the amplitude:
m = abs(y2);
% The frequency axis with the first 500 elements:
x = (0:499)*Fs/N;
% Plot frequency spectrum:
stem(x, m(1:500));
% For one second
pause(1);
xlabel ('Frequency [Hz]')
% We plot the spectrogram where by the frequency is on
% the 'xaxis' and the time is on the y axis.
spectrogram (y1, 256, 128, 256, Fs, 'xaxis')