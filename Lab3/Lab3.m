%% Lab3
%% Gaussian Filters
gfilter = [1 2  3 2 1;
           2 4  5 4 2;
           3 5 20 5 3;
           2 4  5 4 2;
           1 2  3 2 1]/88;
%% Read Image
img = imread('images\biking.png');
gimg = rgb2gray(img);

[hEdges,vEdges,sumEdges,magEdges,rDir,dir] = sobel(gimg);

imtool(hEdges*3);
imtool(vEdges*3);
imtool(sumEdges*3);
imtool(magEdges);
imtool(rDir);
imtool(dir);

imwrite(hEdges,'imgout\h_edges.png');
imwrite(vEdges,'imgout\v_edges.png');
imwrite(sumEdges,'imgout\edge_sum.png');
imwrite(magEdges,'imgout\edge_mag.png');
imwrite(rDir,'imgout\raw_direction.png');
imwrite(dir,'imgout\edge_direction.png');

