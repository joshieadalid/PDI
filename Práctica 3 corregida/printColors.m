function m = printColors(m)

    for i = 1:size(m, 1)
        cprintf(m(i, :), '%f %f %f\n', m(i, :).');
    end

end
