function [mod_image, voting] = circlefinder(image,minRad,maxRad)
%CIRCLEFINDER Summary of this function goes here
%   Detailed explanation goes here
    if (nargin == 1)
        minRad = 10;
        maxRad = 50;
    end
    [h, v, sum, mag, rdir, dir] = sobel(image);
    [w, h] = size(image);
    output = zeros(w,h);
    voting = zeros(w,h,maxRad-minRad+1);
    mag = mag > 10;
    mag(1,:) = 0;
    mag(w,:) = 0;
    mag(:,1) = 0;
    mag(:,h) = 0;
    [r,c] = find(mag==1);
    for k = 1:length(r)
        % optimize searching based on dir
        minDir = double(dir(r(k),c(k)))*pi/127+pi-pi/8;
        maxDir = double(dir(r(k),c(k)))*pi/127+pi+pi/8;
        %for t = 0:pi/100:2*pi
        for t = minDir:pi/100:maxDir
            for rad = minRad:maxRad
                dx = rad*cos(t);
                dy = rad*sin(t);
                x1 = uint16(c(k) + dx)+1;
                y1 = uint16(r(k) - dy)+1;
                if x1 > h
                    x1 = h;
                end
                if y1 > w
                    y1 = w;
                end
                voting(y1,x1,rad-(minRad-1)) = voting(y1,x1,rad-(minRad-1))+1;
            end
        end
    end
    mod_image = 0;
end

