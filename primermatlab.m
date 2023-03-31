clc
clear all all all
close all
warning off all

disp('holi');
disp('holi sin ;')
a = imread('peppers.png');
if all(a(:,:,1) == a(:,:,2)) && all(a(:,:,2) == a(:,:,3))
  disp('La imagen es en escala de grises')
else
  disp('La imagen es en color')
end

[m,n] = size(a)

figure(1)
imshow(a)
% imshow(a)

figure(2)
b = rgb2gray(a);
imshow(b);

figure(3)
c = im2bw(b)
imshow(c)

disp('fin del proceso')
