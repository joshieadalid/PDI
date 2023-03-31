function [rep_classes] = classifier(m)
sorted_pixels = sortrows(m, 1);

% Sorted red
r_diff = [0; diff(sorted_pixels(:, 1))];
% Sorted green
g_diff = [0; diff(sorted_pixels(:, 2))];
% Sorted blue
b_diff = [0; diff(sorted_pixels(:, 3))];

% Ordenando respecto al rojo, ver las diferencias en azul
printColors(sorted_pixels);

abs_mean= (abs(g_diff) + abs(b_diff))./2;
disp([r_diff, g_diff, b_diff, abs_mean]);

rep_classes = mean_each_class(sorted_pixels, classLimits(abs_mean));
end

