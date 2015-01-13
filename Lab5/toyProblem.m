function [tp, fp, tn, fn, tpr, fpr] = toyProblem()
% toyProblem.m
% Written by Matthew Boutell, 2006.
% Feel free to distribute at will.

clear all;

% We fix the seeds so the data sets are reproducible
seedTrain = 137;
seedTest = 138;
% This tougher data set is commented out.
%[xTrain, yTrain] = GenerateGaussianDataSet(seedTrain);
%[xTest, yTest] = GenerateGaussianDataSet(seedTest);

% This one isn't too bad at all
[xTrain, yTrain] = GenerateClusteredDataSet(seedTrain);
[xTest, yTest] = GenerateClusteredDataSet(seedTest);


% Add your code here.
% KNOWN ISSUE: the linear decision boundary doesn't work 
% for this data set at all. Don't know why...
net = svm(size(xTrain,2),'rbf', [5], 41);
net = svmtrain(net, xTrain, yTrain);

f1 = figure;
x1ran = [0 20];
x2ran = [0 20];
plotboundary(net, x1ran, x2ran);
plotdata(xTrain, yTrain, x1ran, x2ran);
plotsv(net, xTrain, yTrain);
title(['SVM with RBF kernel: decision boundary (black) plus Support' ...
       ' Vectors (red)']);
% pause
[Y, Y1] = svmfwd(net, xTest);

tp = sum((Y == 1) & (yTest == 1));
fn = sum((Y == -1) & (yTest == 1));
fp = sum((Y == 1) & (yTest == -1));
tn = sum((Y == -1) & (yTest == -1));
tpr = tp / (tp + fn);
fpr = fp / (fp + tn);

% Run this on a trained network to see the resulting boundary 
% (as in the demo)
% plotboundary(net, [0,20], [0,20]);

function plotdata(X, Y, x1ran, x2ran)
% PLOTDATA - Plot 2D data set
% 

hold on;
ind = find(Y>0);
plot(X(ind,1), X(ind,2), 'ks');
ind = find(Y<0);
plot(X(ind,1), X(ind,2), 'kx');
text(X(:,1)+.2,X(:,2), int2str([1:length(Y)]'));
axis([x1ran x2ran]);
axis xy;
function plotsv(net, X, Y)
% PLOTSV - Plot Support Vectors
% 

hold on;
ind = find(Y(net.svind)>0);
plot(X(net.svind(ind),1),X(net.svind(ind),2),'rs');
ind = find(Y(net.svind)<0);
plot(X(net.svind(ind),1),X(net.svind(ind),2),'rx');
function [x11, x22, x1x2out] = plotboundary(net, x1ran, x2ran)
% PLOTBOUNDARY - Plot SVM decision boundary on range X1RAN and X2RAN
% 

hold on;
nbpoints = 100;
x1 = x1ran(1):(x1ran(2)-x1ran(1))/nbpoints:x1ran(2);
x2 = x2ran(1):(x2ran(2)-x2ran(1))/nbpoints:x2ran(2);
[x11, x22] = meshgrid(x1, x2);
[dummy, x1x2out] = svmfwd(net, [x11(:),x22(:)]);
x1x2out = reshape(x1x2out, [length(x1) length(x2)]);
contour(x11, x22, x1x2out, [-0.99 -0.99], 'b-');
contour(x11, x22, x1x2out, [0 0], 'k-');
contour(x11, x22, x1x2out, [0.99 0.99], 'g-');