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
     % direc = V(min(D == max(D(:))))
    direc = V(min(find(max(max(D)))));
    elong = sqrt(max(max(D))/min(max(D)));
    minPerimRow = min(r);
    minPerimCol = min(c(find(r==min(r))));
    perimcoords = bwtraceboundary(cc, [minPerimRow, minPerimCol], 'W',8);
    perim = 0;
    for j = 1:length(perimcoords)-1
        diff = perimcoords(j,1) + perimcoords(j,2) - perimcoords(j+1,1) - perimcoords(j+1,2);
        if abs(diff)==1
            perim = perim + 1;
        else
            perim = perim + sqrt(2);
        end
    end
    circ = perim^2/bwarea(cc);
    
    % Output
    fprintf('Shape: %i Elong: %4.2f Circ: %4.2f ',k,elong,circ)
    imtool(cc)
    if abs(elong-1) < 0.03
        if circ < 14
            fprintf('Guess: Circle\n')
        else
            fprintf('Guess: Square\n')
        end
    else
        if circ^1.8/elong > 80
            fprintf('Guess: Rectangle\n')
        else
            fprintf('Guess: Oval\n')
        end
    end
    imwrite(cc,strcat('shapeout\',num2str(k),'.png'))
end
