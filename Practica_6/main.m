% Limpieza del entorno de trabajo
clc
clear all
close all
warning off all

I = imread('peppers.png');
ref = imread('sky_water_rock.jpg');

while (true)
    J = histmatch(I, ref);
    plot(I, ref, J);
    figure;
    imshow(J);
    figure;
    equalized = cat(3, histeq_custom(J,1), histeq_custom(J,2), histeq_custom(J,3));
    imhist(equalized);
    option = input('¿Desea intercambiar? (S/N): ', 's');
    if option == 'S' || option == 's'
        [ref, I] = deal(I, ref);
        close all;
    else
        return;
    end

end
