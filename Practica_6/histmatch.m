% La función devuelve la imagen de salida con un histograma que coincide con la imagen objetivo.
function output_image = histmatch(input_image, target_image)

    % Calcular el histograma de la imagen de entrada y objetivo
    input_hist = imhist(input_image);
    target_hist = imhist(target_image);
    % Calcular la función de distribución acumulativa (CDF) de la imagen de entrada y objetivo
    input_cdf = cumsum(input_hist) / numel(input_image);
    target_cdf = cumsum(target_hist) / numel(target_image);

    % Calcular la tabla de búsqueda para mapear las intensidades de la imagen de entrada a las intensidades de la imagen de salida
    lookup_table = zeros(256, 1);

    for i = 1:256
        [~, index] = min(abs(target_cdf - input_cdf(i)));
        lookup_table(i) = index - 1;
    end

    % Mapear las intensidades de la imagen de entrada a la imagen de salida utilizando la tabla de búsqueda
    output_image = uint8(lookup_table(double(input_image) + 1));
end
