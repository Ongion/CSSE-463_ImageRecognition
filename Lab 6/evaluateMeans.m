function [means] = evaluateMeans(clusters, image)
%EVALUATEMEANS Summary of this function goes here
%   Detailed explanation goes here
    red = image(:,:,1);
    green = image(:,:,2);
    blue = image(:,:,3);
    means = zeros(max(max(clusters)),3);
    for k = 1:max(max(clusters))
        pixels = find(clusters==k);
        means(k,1) = mean(red(pixels));
        means(k,2) = mean(green(pixels));
        means(k,3) = mean(blue(pixels));
    end
end

