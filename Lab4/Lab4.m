%% Lab 4
%% Initial Loading
%%% Load the image
img = imread('shapes.png');

%%% Label the image to get the connected components
limg = bwlabel(img);

%%% Process each connected component in the image
N = max(max(limg));
for k = 1:N
    %%% Get the covarience matrix
    cc = limg == k;
    [r,c] = find(cc == 1);
    cMean = mean(c);
    cNorm = c - cMean;
    
    rMean = mean(r);
    rNorm = r - rMean;
    
    M = [cNorm,rNorm];
    % Multiply M by its transpose, then divide by N to get the covariance
    % matrix.
    cvm = 1/sum(sum(cc)) .* (M.'*M);
    
    [V,D] = eig(cvm);
     % If two eigenvectors are the same, we don't care which one we get.
     % Just pick the first.
    direc = V(min(D == max(D(:))))
    elong = sqrt(max(max(D))/min(max(D)))
    
end
