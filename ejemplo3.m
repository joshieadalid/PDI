clc
clear all
close all
warning off all

% leyendo la imagen
figure(1)
image = imread("peppers.png");
imshow(image);

figure(2)
gray = rgb2gray(image);
imshow(gray);

figure(3);
histogram(gray)

figure(4);
imhist(gray);

[veces, pixeles] = imhist(gray);

figure(5);
bar(pixeles,veces);
disp('fin proceso');