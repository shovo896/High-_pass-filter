% Create synthetic 3D volume (like a cube)
volSize = [50, 50, 50];
volume = zeros(volSize);
volume(20:30, 20:30, 20:30) = 100; % A cube in the center

% Create 3D Gaussian Low-Pass Filter
sigma = 2;
[x, y, z] = ndgrid(-5:5, -5:5, -5:5);
h = exp(-(x.^2 + y.^2 + z.^2) / (2 * sigma^2));
h = h / sum(h(:));  % Normalize

% Apply Low-Pass Filter
low_pass = convn(volume, h, 'same');

% High-Pass Filter = Original - Low-Pass
high_pass = volume - low_pass;

% Display slices
slice_idx = 25;

figure;
subplot(1,3,1);
imagesc(volume(:,:,slice_idx)); title('Original Slice'); axis image; colormap gray

subplot(1,3,2);
imagesc(low_pass(:,:,slice_idx)); title('Low-Pass Slice'); axis image; colormap gray

subplot(1,3,3);
imagesc(high_pass(:,:,slice_idx)); title('High-Pass Slice'); axis image; colormap gray
