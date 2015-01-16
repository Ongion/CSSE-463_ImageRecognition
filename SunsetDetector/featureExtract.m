function [ features ] = featureExtract( img )
%FEATUREEXTRACT Summary of this function goes here
%   Detailed explanation goes here

[height, width, ~] = size(img);

blockHeight = floor(height/7);
blockWidth = floor(width/7);

features = zeros([1,294]);

for i = 0:6
    blockTop = i*blockHeight+1;
    blockBottom = (i+1)*blockHeight;
    for j = 0:6
        blockLeft = j*blockWidth+1;
        blockRight = (j+1)*blockWidth;

        block = double(img(blockTop:blockBottom,blockLeft:blockRight,:));
        
        L = sum(block,3);
        R = block(:,:,1) - block(:,:,3);
        T = block(:,:,1) - 2*block(:,:,2) + block(:,:,3);
 
        Lmean = mean(L(:));
        Rmean = mean(R(:));
        Tmean = mean(T(:));

        Ldev = std(L(:));
        Rdev = std(R(:));
        Tdev = std(T(:));
        
        insertAt = i*7*6+j*6+1;
        
        features(insertAt:insertAt+5) = [Lmean,Ldev,Rmean,Rdev,Tmean,Tdev];
    end
end

end

