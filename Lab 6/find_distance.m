function [ cluster ] = find_distance( point3, means )

    distances = repmat(point3,[size(means,1),1]);
    distances = distances - means;
    distances = sum(distances.^2,2);
    cluster = find(distances == min(distances));
    if length(cluster) > 1
        cluster = cluster(1);
    end

end

