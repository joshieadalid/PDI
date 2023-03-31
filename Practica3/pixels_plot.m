function colors = pixels_plot(n, v)
    colors = v;
    figure(n)
    scatter3(v(:,1), v(:,2), v(:,3), 20, v./255, 'filled');
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
