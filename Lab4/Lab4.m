%% Lab 4
%% Initial Loading
%%% Load the image
img = imread('shapes.png');

%%% Label the image to get the connected components
limg = bwlabel(img);

%%% Process each connected component in the image
N = max(max(limg));
for k = 1:N
    %%% Get the connected component
    cc = limg == k;
    %%% Get the covarience matrix
    [r,c] = find(cc == 1);
    
end


