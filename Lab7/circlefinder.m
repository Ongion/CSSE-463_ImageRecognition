function [mod_image, voting] = circlefinder(image)
%CIRCLEFINDER Summary of this function goes here
%   Detailed explanation goes here
    [h, v, sum, mag, rdir, dir] = sobel(image);
    [w, h] = size(image);
    output = zeros(w,h);
    voting = zeros(w,h,41);
    mag = mag > 10;
    [r,c] = find(mag==1);
    for k = 1:length(r)
        for t = 1:pi/100:pi
            for rad = 10:50
                dx = rad*cos(t);
                dy = rad*sin(t);
                x1 = uint16(c(k) + dx)+1;
                x2 = uint16(c(k) - dx)+1;
                y1 = uint16(r(k) + dy)+1;
                y2 = uint16(r(k) - dy)+1;
                if x1 > h
                    x1 = h;
                end
                if x2 > h
                    x2 = h;
                end
                if y1 > w
                    y1 = w;
                end
                if y2 > w
                    y2 = w;
                end
                voting(y1,x1,rad-9) = voting(y1,x1,rad-9)+1;
                voting(y2,x2,rad-9) = voting(y2,x2,rad-9)+1;
            end
        end
    end
    mod_image = 0;
end

