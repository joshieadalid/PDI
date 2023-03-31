function [representative, distance] = class_distance(pixel, classes)
    distances = pdist2(pixel, classes);
    [distance, idx] = min(distances);
    representative = classes(idx, :);
end
