clc
clear all
close all
image = imread("PatricioBob.jpg");
processedImageA = processImageA(image);
processedImageB = processImageB(image);
processedImageC = processImageC(image);
processedImageD = processImageD(image);
figure;

subplot(1,4,1);
imshow(processedImageA);
title('Image A');
subplot(1,4,2);
imshow(processedImageB);
title('Image B');
subplot(1,4,3);
imshow(processedImageC);
title('Image C');
subplot(1,4,4);
imshow(processedImageD);
title('Image D');
