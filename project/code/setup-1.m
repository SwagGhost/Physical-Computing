% We use a sampling frequency of 44100 Hz:
fs = 44100;
% We use 44100 Hz and 16 bit rate for sampling:
rec = audiorecorder(fs, 16, 1);  
% Number of samples to be taken:
samples = 2;
% We use four words (forward, left, right and stop), thus the 
% number of words equals four:
numwords = 4;
% Number of sound files that will be generated must be equal to 
% the number of samplessamples
soundfiles = 4 * 2;
mfcc=cell(1, soundfiles); 
% We use a for-loop for recording, compressing and saving each of the recorder signals separately:
for n=1:8        
disp('Say the following words in order: forward, stop, left, right.')
disp('Speak the command in the microphone when "speak" shows up.');
pause(1);
disp('3');
pause(1);
disp('2');
pause(1);
disp('1');
pause(0.5);
% Shows up to inform the user to speak:
disp('Speak now.');
record(rec, 5);
pause(4);
disp('Recording has finished.');
% We store the recorded signal in the variable called 'sample':
sample = getaudiodata(rec);
% We use the butter filter to get a less noisy signal.
% We use the butter filter to get rid of the noise between words
% which has a high frequency:
[b,a] = butter(4,4000/44100);
% After applying the filter, the signal should contain only the 
% spoken command: 
voice = filter(b, a, sample);
% We create a plot of the filtered signal:
plot(voice);
% We normalize the input sound:
voice = voice/abs(max(voice));
 
% Remove silenced part between words spoken
y = silenceremove(voice);
% We obtain the length of the signal without silence and we store 
% that value in the variable called 'j':
j = length(y);
% Remove the end part silence:
while (y(j) < 0.2)
j = j - 1;
end
% Array containing values of the sound from the beginning until j:
array = y(1:j);
plot(array);
% index equals variable we use to iterate the for-loop:
index = n;
% We use the index of the for-loop to save each signal:
filename = ['sample', num2str(index)];
% We calculate the mfcc of the array we obtained:
variable = mfcc_calc(array);
% We save the variables of the mfcc in the file whose name 
% corresponds to the signal: 
save(filename, 'variable')
disp('Samples have been saved.');     
end
disp('Setup has succeeded!');


