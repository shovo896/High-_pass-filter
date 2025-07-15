img = imread('cameraman.tif');
img = double(img);

% Create a low-pass filter (e.g., Gaussian)
h = fspecial('gaussian', [5 5], 1);

% Apply low-pass filter
low_pass = imfilter(img, h, 'replicate');

% High-pass = Original - Low-pass
high_pass = img - low_pass;

% Show results
subplot(1,3,1), imshow(uint8(img)), title('Original');
subplot(1,3,2), imshow(uint8(low_pass)), title('Low-Pass');
subplot(1,3,3), imshow(uint8(high_pass + 128)), title('High-Pass');
