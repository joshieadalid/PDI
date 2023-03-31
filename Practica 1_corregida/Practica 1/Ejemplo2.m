clc 
clear all
close all
warning off all

figure(1)
a=inread('Bob.png');
imshow(a)
figure(2)
b=rgb2gray(a);
imshow(b)

figure(3)
[veces,pixeles]=histogram(b)