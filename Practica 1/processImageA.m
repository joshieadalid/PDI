function processedImage = processImageA(image)
    % Redimensiona la imagen a la mitad
    resizedImage = imresize(image, 0.5);

    % Divide la imagen redimensionada en cuatro partes iguales
    [height, width, ~] = size(resizedImage);
    color = resizedImage(1:height/2, 1:width/2, :);
    R = resizedImage(1:height/2, width/2+1:end, 1);
    G = resizedImage(height/2+1:end, 1:width/2, 2);
    B = resizedImage(height/2+1:end, width/2+1:end, 3);

    % Crea las imágenes R, G y B con 3 canales de color
    R = cat(3, R, zeros(size(R)), zeros(size(R)));
    G = cat(3, zeros(size(G)), G, zeros(size(G)));
    B = cat(3, zeros(size(B)), zeros(size(B)), B);

    % Combina las cuatro imágenes
    processedImage = [color, R; G, B];
end


