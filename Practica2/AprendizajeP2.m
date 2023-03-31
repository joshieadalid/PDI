clc;
clear all;
warning off;


imagen = imread("peppers.png");
pixel = impixel(imagen);
disp(pixel);

clase1 = pixel(1:5,:);
clase2 = pixel(6:10,:);
clase3 = pixel(11:15, :);

red_clase1 = clase1(:, 1);
green_clase1 = clase1(:, 2);
blue_clase1 = clase1(:, 3);

red_clase2 = clase2(:, 1);
green_clase2 = clase2(:, 2);
blue_clase2 = clase2(:, 3);

red_clase3 = clase3(:, 1);
green_clase3 = clase3(:, 2);
blue_clase3 = clase3(:, 3);

promedioR1 = mean(red_clase1);
promedioR2 = mean(red_clase2);
promedioR3 = mean(red_clase3);

promedioG1 = mean(green_clase1);
promedioG2 = mean(green_clase2);
promedioG3 = mean(green_clase3);

promedioB1 = mean(blue_clase1);
promedioB2 = mean(blue_clase2);
promedioB3 = mean(blue_clase3);

dist1 = sqrt((promedioR1 - pixel(16,1))^2 + (promedioG1 - pixel(16,2))^2 + (promedioB1 - pixel(16,3))^2);
dist2 = sqrt((promedioR2 - pixel(16,1))^2 + (promedioG2 - pixel(16,2))^2 + (promedioB2 - pixel(16,3))^2);
dist3 = sqrt((promedioR3 - pixel(16,1))^2 + (promedioG3 - pixel(16,2))^2 + (promedioB3 - pixel(16,3))^2);

m = min([dist1, dist2, dist3]);

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
plot3(red_clase1, green_clase1, blue_clase1, '.', 'Color', [1 0 0]) % Matriz 1 en rojo
plot3(red_clase2, green_clase2, blue_clase2, '.', 'Color', [0 1 0]) % Matriz 2 en verde
plot3(red_clase3, green_clase3, blue_clase3, '.', 'Color', [0 0 1]) % Matriz 3 en azul
plot3(pixel(16,1), pixel(16,2), pixel(16,3), '.', 'Color', [1 1 0], 'MarkerSize', 20) % Punto en amarillo
hold off


% Agregar etiquetas y título
xlabel('R')
ylabel('G')
zlabel('B')
title('Puntos RGB en un espacio 3D')