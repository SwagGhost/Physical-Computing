% This function gets the filename ('applekeycoin.bmp').
% We do this by typing the following command in the command window:
% myfunction('applekeycoin.bmp')
% (Because we named the file with omage 'applekeycoin.bmp'.)

function [im] = getimage(filename)
    % We saved the obtained image as 'applekeycoin.bmp'.
    % We use the following line of code to obtain it in MATLAB:
    im = imread(filename);
    % We look at the (original) image:
    imshow(im);
    title('Photo we took');
    % For two seconds:
    pause(2);

    % We cropped the original image. 
    im1 = imcrop(im, [0, 0, 635, 435]);
    % We look at the cropped image:
    imshow(im1);
    title('Cropped image');
    % For two seconds
    pause(2);

    % We make a grayscale image of im1:
    im2 = rgb2gray(im1);
    % We look at the grayscale image:
    imshow(im2);
    title('Grayscale image');
    pause(2);

    % We obtain the histogram of the grayscale image.
    % We look at the histogram:
    imhist(im2);
    title('Histogram of the grayscale image');
    % For two seconds:
    pause(2);

    % We use the MATLAB function to obtain the thresholds of the 
    % grayscale image. We store the value we obtain in the variable 
    % called level:
    level = graythresh(im2);
    % We display the threshold:
    disp(['Threshold: ', num2str(level)]);
    disp([' ']);
    
    % We use the threshold we obtained, of which the value is stored in 
    % the variable level, to get a black and white image. The threshold
    % used to determine what level of gray is considered as black and 
    % what level of gray is considered as white. We get a black and white
    % image:
    im3 = im2bw(im2, level);
    % We look at the black and white image:
    imshow(im3);
    title('Black and white image');
    % For two seconds:
    pause(2);

    % We use the MATLAB function, STREL, in order to get disk-shaped 
    % structuring elements:
    im4 = imopen(im3, strel('disk', 13));
    % We look at im4:
    imshow(im4);
    title('STREL of black and white image');
    % For 2 seconds:
    pause(2);

    % We use the MATLAB imcomplement function in order to complement im4:
    im5 = imcomplement(im4);
    % We look at im5:
    imshow(im5);
    title('Complemented black and white image');
    % For two seconds:
    pause(2);

    % We use the MATLAB function, STREL, in order to get disk-shaped 
    % structuring elements:
    im6 = imopen(im5, strel('disk', 8));
    % We look at im6:
    imshow(im6);
    % For two seconds:
    pause(2);

    % We want use labels to get to know how many there are in the image:
    [labels, numlabels] = bwlabel(im6);
    % We want to use the variables 'labels' and 'numlabels' also
    % when we use the Classifier function to classify objects, so make
    % them global variables:
    global labels;
    global numlabels;

    % We use the variable L to label each object. L is an integer and 
    % starts at 1. We give each found object from the image (im6) a 
    % label, which is defined by a value (1, ..., n where n = numlabels):
    L = bwlabel(im6);
    
    % We use a for-loop to look at each labeled object separately:
    for (var = 1:numlabels)
        % We look at an object using the labeling variable L. So, if 
        % var = 1, then we look at the object which is labeled with the 
        % value L = 1 and the same goes for the rest of the objects:
        imshow(L == var);
        title(['Object ', num2str(var)]);
        % We look at each object for one second:
        pause(1);
    % We end the for-loop:
    end

    % We look at all the labeled objects using the vislabels function:
    vislabels(L);
    title('All the objects');
    % For two seconds:
    pause(2);

    % We subplot im, ..., im6, each labeled object separately,
    % and all labeled objects, using the subplot function:
    title('Mosaic');
    subplot(3, 3, 1); imshow(im);
    subplot(3, 3, 2); imshow(im1);
    subplot(3, 3, 3); imshow(im2);
    subplot(3, 3, 4); imshow(im3);
    subplot(3, 3, 5); imshow(im4);
    subplot(3, 3, 6); imshow(im5);
    subplot(3, 3, 7); imshow(im6);
    subplot(3, 3, 8); imshow(L);
    % We use a for-loop to look at each labeled object separately:
    for (var = 1:numlabels)
        % We look at an object using the labeling variable L. So, if 
        % var = 1, then we look at the object which is labeled with the 
        % value L = 1 and the same goes for the rest of the objects:
        imshow(L == var);
        title(['Object ', num2str(var)]);
        % We look at each object for half a second:
        pause(0.5);
    % We end the for-loop:
    end
    subplot(3, 3, 9); imshow(L);
    % We look at all the labeled objects using the vislabels function:
    vislabels(L);
    % We determine how we want to show the window with the mosaik
    % of subplots:
    set(figure(1), 'Position', [100, 100, 1000, 800]);
% We end the function:
end