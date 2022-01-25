t=0; 
while t==0
disp('Speak in the microphone when "speak" shows up.'); % 
pause(3);
% Shows up to inform the user to speak:
disp('Speak now');
record(rec,5);
pause(4);
disp('Recording finished');
% We store the recorder signal in the variable sample:
sample = getaudiodata(rec);
% We use the butter filter to get a less noisy signal:
[b,a] = butter(4,4000/44100);
% After applying the filter, the signal should contain only the
% spoken command 
voice = filter(b, a, sample);
% We create a plot of the filtered signal:
plot(voice);
% We normalize the input sound:
voice=voice/abs(max(voice)); 
% Remove silenced part(s) between spoken command:
y=silenceremove(voice);
% Get lebgth of signal:
j = length(y);
% We remove the end part silence:
while (y(j) < 0.2)
   j = j - 1;
end
command = y(1:j);
plot(command);
% Extract features:
features = mfcc_calc(command);
recognition(features,samples,numwords);
end


