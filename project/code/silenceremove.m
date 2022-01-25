function [array] = silenceremove(voice)
% first we normalize the filtered signal
%voice = voice/voice1;
% then we have to divide it into small frames of 0.025 seconds
% we check each frame and if its amplitude is less than the threshold we
% remove it from the vector
fs = 44100; % we need the total number of samples to calculate the total number of frames
frame = 0.02;
sizeframe = floor(frame*fs);    % floor rounds the result up to integer 
numframes = floor( length(voice)/sizeframe);
% to create the frames we use a loop
n=0;
for i=1:numframes   % this creates a matrix with rows equal to the number of frames 
    frames (i,:) = voice (n+1:n+sizeframe); % we denote the corresponding data to each frame
    n = n + sizeframe;
end
% then we apply the algorithm to remove the silent frames
threshold = 0.15;   % we use 0.05 as minimum amplitude to indicate frames as silent
maxvalue = max(frames, [], 2);
id = find (abs(maxvalue) > threshold);
loong = (id); % gives number of frames with an amplitude greater than the threshold
framesnosilence = frames (id);
% finally we create a new array containing only the frames with no silence
array = reshape (framesnosilence', 1, []);
plot (array);
