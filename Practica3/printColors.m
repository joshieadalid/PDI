function m = printColors(m)
for i = 1:length(m)
    cprintf(m(i,:), 'Clase %f %f %f\n', m(i,1),m(i,2),m(i,3));
end
end