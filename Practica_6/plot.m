function [] = plot(I, ref, J)
    % Mostrar las imágenes originales y modificadas
    subplot(3, 5, 1), imshow(I), title('Imagen original');
    subplot(3, 5, 2), imhist(I), title('Histograma original RGB');
    subplot(3, 5, 3), imhist(I(:, :, 1)), title('Histograma original R');
    subplot(3, 5, 4), imhist(I(:, :, 2)), title('Histograma original G');
    subplot(3, 5, 5), imhist(I(:, :, 3)), title('Histograma original B');

    subplot(3, 5, 6), imshow(ref), title('Imagen referencia');
    subplot(3, 5, 7), imhist(ref), title('Histograma referencia RGB');
    subplot(3, 5, 8), imhist(ref(:, :, 1)), title('Histograma referencia R');
    subplot(3, 5, 9), imhist(ref(:, :, 2)), title('Histograma referencia G');
    subplot(3, 5, 10), imhist(ref(:, :, 3)), title('Histograma referencia B');

    subplot(3, 5, 11), imshow(J), title('Imagen modificada');
    subplot(3, 5, 12), imhist(J), title('Histograma modificado RGB');
    subplot(3, 5, 13), imhist(J(:, :, 1)), title('Histograma modificado R');
    subplot(3, 5, 14), imhist(J(:, :, 2)), title('Histograma modificado G');
    subplot(3, 5, 15), imhist(J(:, :, 3)), title('Histograma modificado B');

    figure;
    imshow(J)
end
