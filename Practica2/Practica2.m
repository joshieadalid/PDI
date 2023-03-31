% Paso 1: Carga la imagen y muéstrala
img = imread('peppers.png');
figure; imshow(img); title('Imagen');

% Paso 2: Selecciona las muestras de cada clase
num_muestras = 5;
num_clases = 3;
muestras = zeros(num_muestras, num_clases, 3);
for clase = 1:num_clases
    for muestra = 1:num_muestras
        figure; imshow(img); title(sprintf('Selecciona muestra %d de la clase %d', muestra, clase));
        pixel = impixel(img);
        % Extrae el valor de color RGB del pixel seleccionado
        color = squeeze(pixel)';
        % Asigna el valor de color a la matriz de muestras
        muestras(muestra, clase, :) = color;
        close;
    end
end


% Paso 3: Crea la matriz de características y la matriz de etiquetas
caracteristicas = zeros(num_muestras*num_clases, 3);
etiquetas = zeros(num_muestras*num_clases, 1);
index = 1;
for clase = 1:num_clases
    for muestra = 1:num_muestras
        caracteristicas(index, :) = squeeze(muestras(muestra, clase, :));
        etiquetas(index) = clase;
        index = index + 1;
    end
end

% Paso 4: Entrena el clasificador
mdl = fitcknn(caracteristicas, etiquetas, 'NumNeighbors', 1);

% Paso 5: Pide al usuario que seleccione una última muestra y clasifícala
figure; imshow(img); title('Selecciona una muestra a clasificar');
ultima_muestra = impixel(img);
clase_predicha = predict(mdl, ultima_muestra);
fprintf('La última muestra pertenece a la clase %d.\n', clase_predicha);
