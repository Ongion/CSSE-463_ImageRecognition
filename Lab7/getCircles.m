function [ circs,rads ] = getCircles( voting, thresh, bucketScale,minRad)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    tmp_vote = voting;
    i = 0;
    while max(tmp_vote(:)) > thresh
        i = i+1;
        [x,y,r] = ind2sub(size(tmp_vote),find(tmp_vote == max(tmp_vote(:))));
        % Only care about first for now. If second is far away, we'll get
        % it next. If it's really close, probably same circle.
        x = x(1);
        y = y(1);
        r = r(1);
        circs(i,:) = bucketScale * [y,x];
        rads(i) = r+minRad;
        tmp_vote(x-1:x+1,y-1:y+1,:)=0;
    end
end

