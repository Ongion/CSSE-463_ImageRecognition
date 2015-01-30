function [mod_image] = circlefinder(image)
%CIRCLEFINDER Summary of this function goes here
%   Detailed explanation goes here
    [h, v, sum, mag, rdir, dir] = sobel(image);
    output = zeros(size(image));
    mag = mag > 10;
    

end

