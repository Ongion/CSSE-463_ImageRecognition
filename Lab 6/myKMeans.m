%x = 255;
%SAMPLE_IMAGE(:,:,1) = [x x x x x 0 0 0 0 0;
%                       x x x x x 0 0 0 0 0;
%                       x x x x x 0 0 0 0 0;
%                       x x x x x 0 0 0 0 0;
%                       x x x x 0 0 0 0 0 0;
%                       x x x 0 0 0 0 0 0 0;
%                       x x x 0 0 0 0 0 0 0;
%                       x x x 0 0 0 0 0 0 0;
%                       x x 0 0 0 0 0 0 0 0;
%                       x 0 0 0 0 0 0 0 0 0];
%SAMPLE_IMAGE(:,:,2) = [0 0 0 0 0 x x x x x;
%                       0 0 0 0 0 x x x x x;
%                       0 0 0 0 0 x x x x x;
%                       0 0 0 0 0 x x x x x;
%                       0 0 0 0 0 0 x x x x;
%                       0 0 0 0 0 0 0 x x x;
%                       0 0 0 0 0 0 0 x x x;
%                       0 0 0 0 0 0 0 x x x;
%                       0 0 0 0 0 0 0 0 x x;
%                       0 0 0 0 0 0 0 0 0 x];
%SAMPLE_IMAGE(:,:,3) = [0 0 0 0 0 0 0 0 0 0;
%                       0 0 0 0 0 0 0 0 0 0;
%                       0 0 0 0 0 0 0 0 0 0;
%                       0 0 0 0 0 0 0 0 0 0;
%                       0 0 0 0 x x 0 0 0 0;
%                       0 0 0 x x x x 0 0 0;
%                       0 0 0 x x x x 0 0 0;
%                       0 0 x x x x x x 0 0;
%                       0 x x x x x x x x 0];
%                   
%SAMPLE_IMAGE = uint8(SAMPLE_IMAGE);

SAMPLE_IMAGE = imread('fruit\fruit_tray.tiff');

k = 5;
seed = 0;
rand('state', seed);
means = floor(rand(k,3)*255);

height = size(SAMPLE_IMAGE,1);
width = size(SAMPLE_IMAGE,2);

clusters = zeros([height,width]);

for iter = 1:5
    for r = 1:height
        for c = 1:width
            pixel = double(squeeze(SAMPLE_IMAGE(r,c,:)))';
            clusters(r,c) = find_distance(pixel,means);
        end
    end
    means = evaluateMeans(clusters, SAMPLE_IMAGE);
end
for r = 1:height
    for c = 1:width
        SAMPLE_IMAGE(r,c,:) = means(clusters(r,c),:);
    end
end

