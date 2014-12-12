%% Lab3
%% Gaussian Filters
gfilter = [0 0  0 0 0;
           0 1  8 1 0;
           0 8 40 8 0;
           0 1  8 1 0;
           0 0  0 0 0];
%% Read Image
img = imread('images\board.jpg');
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

