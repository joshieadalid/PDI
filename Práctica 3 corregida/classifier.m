function rep_classes = classifier(m, n_classes)
    m = sortrows(m, 1);
    rep_classes = mean_each_class(m, class_sections(length(m), n_classes));
end
