function processedImage = processImageC(image)
    % Obtener tamaño de la imagen
    height = size(image, 1);

    % Dividir la imagen en tres franjas horizontales
    redChannel = image(1:floor(height / 3), :, 1);
    greenChannel = image(floor(height / 3) + 1:floor(2 * (height / 3)), :, 2);
    blueChannel = image(floor(2 * (height / 3)) + 1:end, :, 3);

    % Reordenar los canales de color para obtener R, G y B en ese orden
    R = cat(3, redChannel, zeros(size(redChannel)), zeros(size(redChannel)));
    G = cat(3, zeros(size(greenChannel)), greenChannel, zeros(size(greenChannel)));
    B = cat(3, zeros(size(blueChannel)), zeros(size(blueChannel)), blueChannel);

    % Concatenar las tres partes de la imagen
    processedImage = [R; G; B];
end
