function pixels_plot(n_figure, v)
    figure(n_figure)
    hold on
    etiquetas = cell(size(v, 1), 1); % Crear un arreglo de celdas para almacenar las etiquetas

    for i = 1:size(v, 1)
        scatter3(v(i, 1), v(i, 2), v(i, 3), [], v(i, :) ./ 255, 'filled');
        etiquetas{i} = sprintf('clase%d', i);
    end

    % Agregar la leyenda
    legend(etiquetas, 'Location', 'Best');

    hold off
    grid on

    % Agregar etiquetas y título
    xlabel('R')
    ylabel('G')
    zlabel('B')
    title('Representative colors')

    % Cambiar límites de los ejes para mejorar la visualización
    xlim([0 255])
    ylim([0 255])
    zlim([0 255])

    % Ajustar el tamaño de la figura para una mejor visualización
    set(gcf, 'Position', [100 100 800 600]);
end
