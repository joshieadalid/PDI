function processedImage = processImageD(image)
    %dimensiones de imagen
    [y, x] = size(image(:,:,1));
    
    %Cuadricular imagen
    gray11 = image(1:floor(y/4) , 1:floor(x/5) , 2);
    gray12 = image(1:floor(y/4) , floor(x/5)+1:floor(2*x/5) ,1);
    gray13 = image(1:floor(y/4) , floor(2*x/5)+1:floor(3*x/5) ,1);
    gray14 = image(1:floor(y/4) , floor(3*x/5)+1:floor(4*x/5) ,1);
    gray15 = image(1:floor(y/4) , floor(4*x/5)+1:end ,3);
    
    gray21 = image(floor(y/4)+1:floor(2*y/4) , 1:floor(x/5) , 2);
    gray22 = image(floor(y/4)+1:floor(2*y/4) , floor(x/5)+1:floor(2*x/5), 1);
    gray23 = image(floor(y/4)+1:floor(2*y/4), floor(2*x/5)+1:floor(3*x/5), 2);
    gray24 = image(floor(y/4)+1:floor(2*y/4), floor(3*x/5)+1:floor(4*x/5), 1);
    gray25 = image(floor(y/4)+1:floor(2*y/4), floor(4*x/5)+1:end, 3);
    
    gray31 = image(floor(2*y/4)+1:floor(3*y/4), 1:floor(x/5), 2);
    gray32 = image(floor(2*y/4)+1:floor(3*y/4), floor(x/5)+1:floor(2*x/5), 1);
    gray33 = image(floor(2*y/4)+1:floor(3*y/4), floor(2*x/5)+1:floor(3*x/5), 1);
    gray34 = image(floor(2*y/4)+1:floor(3*y/4), floor(3*x/5)+1:floor(4*x/5), 1);
    gray35 = image(floor(2*y/4)+1:floor(3*y/4), floor(4*x/5)+1:end, 3);
    
    gray41 = image(floor(3*y/4)+1:end, 1:floor(x/5), 2);
    gray42 = image(floor(3*y/4)+1:end, floor(x/5)+1:floor(2*x/5), 1);
    gray43 = image(floor(3*y/4)+1:end, floor(2*x/5)+1:floor(3*x/5), 3);
    gray44 = image(floor(3*y/4)+1:end, floor(3*x/5)+1:floor(4*x/5), 1);
    gray45 = image(floor(3*y/4)+1:end, floor(4*x/5)+1:end, 3);
    
    %Rojo
    R12 = cat(3, gray12, zeros(size(gray12)), zeros(size(gray12)));
    R13 = cat(3, gray13, zeros(size(gray13)), zeros(size(gray13)));
    R14 = cat(3, gray14, zeros(size(gray14)), zeros(size(gray14)));
    
    R22 = cat(3, gray22, zeros(size(gray22)), zeros(size(gray22)));
    R24 = cat(3, gray24, zeros(size(gray24)), zeros(size(gray24)));
    
    R32 = cat(3, gray32, zeros(size(gray32)), zeros(size(gray32)));
    R33 = cat(3, gray33, zeros(size(gray33)), zeros(size(gray33)));
    R34 = cat(3, gray34, zeros(size(gray34)), zeros(size(gray34)));
    
    R42 = cat(3, gray42, zeros(size(gray42)), zeros(size(gray42)));
    R44 = cat(3, gray44, zeros(size(gray44)), zeros(size(gray44)));
    
    %Verde
    R11 = cat(3, zeros(size(gray11)), gray11, zeros(size(gray11)));
    R21 = cat(3, zeros(size(gray21)), gray21, zeros(size(gray21)));
    R31 = cat(3, zeros(size(gray31)), gray31, zeros(size(gray31)));
    R41 = cat(3, zeros(size(gray41)), gray41, zeros(size(gray41)));
    
    R23 = cat(3, zeros(size(gray23)), gray23, zeros(size(gray23)));
    
    %Azul
    R15 = cat(3, zeros(size(gray15)), zeros(size(gray15)), gray15);
    R25 = cat(3, zeros(size(gray25)), zeros(size(gray25)), gray25);
    R35 = cat(3, zeros(size(gray35)), zeros(size(gray35)), gray35);
    R45 = cat(3, zeros(size(gray45)), zeros(size(gray45)), gray45);
    
    R43 = cat(3, zeros(size(gray43)), zeros(size(gray43)), gray43);
    
    %Unir imagen
    imagenResultante = [R11 R12 R13 R14 R15; 
                        R21 R22 R23 R24 R25;                   
                        R31 R32 R33 R34 R35;
                        R41 R42 R43 R44 R45
                        ];
    
    % imshow(imagenResultante);
    %imshow(gray32);
    
    
    %Rayas verticales Y X Color
    Rgray = image(:, 1:floor(x/3) , 1);
    Ggray = image(: ,floor(x/3)+1:floor(2*(x/3)) ,2);
    Bgray = image(: ,floor(2*(x/3)+1):end , 3);
    
    %concatenar las partes
    processedImage = imagenResultante;
end