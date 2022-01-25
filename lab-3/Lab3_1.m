imshow(im);
pause(2);
% We determine the coordinates where
% we want to start cropping the image (im):
% We put imtool(im) in comments, because
% we only needed this during the process
% of counting the objects. But, as we write
% the function, we already know the coordinates
% for cropping the image. Same goes for
% imtool(im5) (later in the code).
% For im it would be:
% imtool(im);
% We crop the original image (im).
% We call the cropped image im1:
im1 = imcrop(im, [115, 60, 410, 325]);
% We look at the cropped image (im1):
imshow(im1);
% For 2 seconds:
pause(2);
% We save the cropped image (im1):
imwrite (im1, 'image1.bmp', 'bmp');
% We convert im1 to a grayscale image,
% which we call im2:
im2 = rgb2gray(im1);
% We look at im2:
imshow(im2);
% For 2 seconds:
pause(2);
% We save im2:
imwrite (im2, 'image2.bmp', 'bmp');
% We want a histogram of im2:
imhist(im2);
pause(2);
% We want MATLAB to determine
% a good threshold of im2.
% We assign the value of the threshold
% to the variable called level:
level = graythresh(im2);
% Now, we will get to know
% the threshold:
disp (['Threshold: ', num2str(level)]);
% disp(level);
% Now, we know what the threshold is (0,4588).
% So, we convert im2 to a black and white image
% using the threshold (variable called level,
% which is equal to 0,4588). The black and white image
% is called im3:
im3 = im2bw(im2, level);
% We look at im3:
imshow(im3);
% For 2 seconds:
pause(2);
% We save the black and white image (im3):
imwrite (im3, 'image3.bmp', 'bmp');
% We use an element for im3,
% we can cover the white holes:
im4 = imopen(im3, strel('disk',10));
% We look at im4:
imshow(im4);
% For 2 seconds:
pause(2);
% We save im4:
imwrite (im4, 'image4.bmp', 'bmp');
% We use the MATLAB imcomplement function
% in order to complement im4:
im5 = imcomplement(im4);
% We look at im5:
imshow(im5);
% For 2 seconds
pause(2);
% We save image im5:
imwrite (im5, 'image5.bmp', 'bmp');
% We want to identify round large objects
% (BLOBs) in our image.
% So, we use imtool to determine
% what a good radius would be:
% imtool (im5);
% We will separate only large round objects
% and we can apply an opening operation:
im6 = imopen(im5, strel('disk', 40));
% We look at im6:
imshow(im6);
% For 2 seconds:
pause(2);
imwrite (im6, 'image6.bmp', 'bmp');
% We want determine how many large round objects
% exist on the image. We use a connected
% components labeling algorithm. The MATLAB function
% bwlabel will identify the BLOBs. It will return an array
% with two elements. The first element is a labeled image.
% In this image, pixels that belong to the background are
% labeled with the value 0. Pixels belonging to the first
% BLOB are assigned a value of 1, pixels belonging to
% the second BLOB are assigned a value of 2, etc.
% The other element contains the number of BLOBs
% that are found in the image:
[labels, numlabels] = bwlabel(im6);
% We display the number of BLOBs:
disp(['Numlabels: ', num2str(numlabels)]);
disp([' ']);				
% Each BLOB will be displayed using a different color.
% To do so, we draw the label matrix in colour (im7):
im7 = label2rgb(labels);
% We look at im7:
imshow(im7);
% For 2 seconds:
pause(2);
% We save im7:
imwrite (im7, 'image7.bmp', 'bmp');
% To visualize the BLOBs according to their label,
% we use the vislabels function. The vislabels function
% can be found in the vislabels.m file on Canvas:
vislabels(labels);
pause(2);
% As the image generated is a figure we save this image
% as a new image with extension .bmp:
img = getframe(gcf);
imwrite(img.cdata, ['newimage', '.bmp']);
% We  make use of the function importfile.
% We open this new from our folder with all the saved images.
% We assign the image to im8:
im8 = imread('newimage.bmp');
% We display the sentence:
% "Number of coins found is: " <numlabels>:
disp (['Number of large objects found is: ', num2str(numlabels)]);
% We subplot im, im1 ... im8 using
% the MATLAB function subplot:
subplot(3, 3, 1); imshow(im);
subplot(3, 3, 2); imshow(im1);
subplot(3, 3, 3); imshow(im2);
subplot(3, 3, 4); imshow(im3);
subplot(3, 3, 5); imshow(im4);
subplot(3, 3, 6); imshow(im5);
subplot(3, 3, 7); imshow(im6);
subplot(3, 3, 8); imshow(im7);
subplot(3, 3, 9); imshow(im8);
set(figure(1), 'Position', [100, 100, 1000, 800]); 