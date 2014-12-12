function [ h, v, sum, mag, rdir, dir] = sobel( img )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

hSobel = 1/8 * [-1 0 1;
                -2 0 2;
                -1 0 1];
vSobel = 1/8 * [ 1  2  1;
                 0  0  0;
                -1 -2 -1];
            
magThresh = 8;

h = uint8(filter2(hSobel,img));
v = uint8(filter2(vSobel,img));
sum = h + v;
mag = uint8(sqrt(double(h).^2 + double(v).^2));
rdir = uint8((atan2(double(v),double(h)) + pi)*(255/(2*pi)));
dir = rdir;
dir(mag < magThresh) = 127;

end

