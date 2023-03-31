clc
clear all
close all

img = imread("peppers.png");
n_classes = input('Numero de clases: ');
rep_classes = classifier(impixel(img), n_classes);
printColors(rep_classes);

fprintf('Ingrese un pixel para clasificar: ')
figure(2)
p = impixel(img);
p = p(1, :);
most_representative = class_distance(p, rep_classes);

rep_classes(end + 1, :) = p(1, :);
pixels_plot(10, rep_classes);

fprintf('El pixel pertenece a ');
printColors(most_representative)
