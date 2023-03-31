function representative = mean_each_class(pixel_samples, sections)
    num_classes = length(sections);
    representative = zeros(num_classes, 3);
    from = 1;

    for i = 1:num_classes
        to = from + sections(i) - 1;
        representative(i,:) = mean(pixel_samples(from:to,:),1);
        fprintf('Desde hasta: %f %f\n', from, to);
        from = to + 1;
    end
end
