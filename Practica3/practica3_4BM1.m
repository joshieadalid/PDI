clc
clear all
close all
warning off all

img = imread("peppers.png");
m = impixel(img);
rep_classes = classifier(m);
printColors(rep_classes);
disp('Ingrese un pixel para clasificar: ')
figure(2)
p = impixel(img);
p = p(1,:);
most_representative = class_distance(p, rep_classes);
rep_classes(end+1,:) = p(1,:);
pixels_plot(10, rep_classes);

fprintf('El pixel pertenece a la clase %f %f %f\n', most_representative(1:1),most_representative(1:2),most_representative(1:3))