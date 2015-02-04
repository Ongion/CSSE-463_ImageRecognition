image = imread('c1.tiff');
voting = circlefinder(image,5,10,90);
[circles,radii] = getCircles(voting, 2100, 5, 10);
imshow(image);
viscircles(circles,radii);