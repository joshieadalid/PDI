function output_image = histeq_custom(input_image, n_channel)

% Convert input image to grayscale
if size(input_image, 3) == 3
    input_image = input_image(:,:,n_channel);
end

% Compute histogram of input image
num_pixels = numel(input_image);
histogram = imhist(input_image) / num_pixels;

% Compute cumulative distribution function (CDF)
cdf = cumsum(histogram);

% Compute transformation function
T = uint8(255 * cdf);

% Apply transformation to input image
output_image = zeros(size(input_image), 'uint8');
for i = 1:numel(input_image)
    output_image(i) = T(input_image(i)+1);
end

end
