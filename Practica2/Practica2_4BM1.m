clc;
clear all;
close all;
warning off;

imagen = imread('peppers.png');
%seleccion de pixeles dentro de la imagen
pixel = impixel(imagen);
disp(pixel);

%introduciendo las clases
clase1 = pixel(1:5,:);
clase2 = pixel(6:10,:);
clase3 = pixel(11:15, :);

%dividiendo las clases por sus componentes
red_clase1 = clase1(:, 1);
green_clase1 = clase1(:, 2);
blue_clase1 = clase1(:, 3);

red_clase2 = clase2(:, 1);
green_clase2 = clase2(:, 2);
blue_clase2 = clase2(:, 3);

red_clase3 = clase3(:, 1);
green_clase3 = clase3(:, 2);
blue_clase3 = clase3(:, 3);

%Obtener las medias
promedioR1 = mean(red_clase1);
promedioR2 = mean(red_clase2);
promedioR3 = mean(red_clase3);

promedioG1 = mean(green_clase1);
promedioG2 = mean(green_clase2);
promedioG3 = mean(green_clase3);

promedioB1 = mean(blue_clase1);
promedioB2 = mean(blue_clase2);
promedioB3 = mean(blue_clase3);

%Obtener las distancias
dist1 = sqrt((promedioR1 - pixel(16,1))^2 + (promedioG1 - pixel(16,2))^2 + (promedioB1 - pixel(16,3))^2);
dist2 = sqrt((promedioR2 - pixel(16,1))^2 + (promedioG2 - pixel(16,2))^2 + (promedioB2 - pixel(16,3))^2);
dist3 = sqrt((promedioR3 - pixel(16,1))^2 + (promedioG3 - pixel(16,2))^2 + (promedioB3 - pixel(16,3))^2);

%Obtener la minima distancia
m = min([dist1, dist2, dist3]);

%Mensaje que se mostrará
if dist1 == m
    disp('Clase 1');
elseif dist2 == m
     disp('Clase 2');
elseif dist3 == m
    disp('Clase 3');
end

% Graficar las matrices
figure(2)
hold on
grid on
plot3(red_clase1, green_clase1, blue_clase1, 'ro', 'MarkerSize',10,'MarkerFaceColor','r') % Matriz 1 en rojo
plot3(red_clase2, green_clase2, blue_clase2, 'go', 'MarkerSize',10,'MarkerFaceColor','g') % Matriz 2 en verde
plot3(red_clase3, green_clase3, blue_clase3, 'bo', 'MarkerSize',10,'MarkerFaceColor','b') % Matriz 3 en azul
plot3(pixel(16,1), pixel(16,2), pixel(16,3), 'ko', 'MarkerSize',10,'MarkerFaceColor','k') % Punto en negro
hold off


% Agregar etiquetas y título
xlabel('R')
ylabel('G')
zlabel('B')
title('Puntos RGB de cada clase en un espacio 3D')

legend('Clase 1', 'Clase 2', 'Clase 3','Unknown')
