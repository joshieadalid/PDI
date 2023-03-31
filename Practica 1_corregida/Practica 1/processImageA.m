function processedImage = processImageA(image)
    % Redimensiona la imagen a la mitad
    color = imresize(image, 0.25);

    R=color;
    R(:,:,1);
    R(:,:,2)=0;
    R(:,:,3)=0;

    G=color;
    G(:,:,1)=0;
    G(:,:,2);
    G(:,:,3)=0;

    B=color;
    B(:,:,1)=0;
    B(:,:,2)=0;
    B(:,:,3);

    % Combina las cuatro imágenes
    processedImage = [color, R; G, B];
end


