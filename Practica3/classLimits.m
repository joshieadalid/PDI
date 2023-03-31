function limit = classLimits(color_channel)
    limit = zeros(1, length(color_channel)); % prealocación del vector limit
    contador = 0;
    secciones = 1;
    mean_diff = 1.2*std(color_channel);
    fprintf('La diferencia media es: %f\n', mean_diff)
    for i = 1:length(color_channel) -1
        if color_channel(i) > mean_diff
            limit (secciones) = contador;
            contador = 1;
            secciones = secciones + 1;
        else
            contador = contador + 1;
        end
    end

    limit(end) = contador;
    limit(limit == 0) = []; % eliminar los ceros sobrantes de la prealocación
        fprintf('Limites: %f\n',limit);

end
