function result = class_sections(n_samples, n_classes)
    result = repmat(n_samples / n_classes, 1, n_classes);
end
