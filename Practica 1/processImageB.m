function processedImage = processImageB(image)
    % Obtener tamaño de la imagen
    width = size(image, 2);

    % Dividir la imagen en cuadrantes
    redChannel = image(:, 1:floor(width / 3), 1);
    greenChannel = image(:, floor(width / 3) + 1:floor(2 * (width / 3)), 2);
    blueChannel = image(:, floor(2 * (width / 3)) + 1:end, 3);
    
    R = cat(3, redChannel, zeros(size(redChannel)), zeros(size(redChannel)));
    G = cat(3, zeros(size(greenChannel)), greenChannel, zeros(size(greenChannel)));
    B = cat(3, zeros(size(blueChannel)), zeros(size(blueChannel)), blueChannel);
    
    % Concatenar las cuatro partes de la imagen
    processedImage = [R, G, B];
end
