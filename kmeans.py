#!/usr/bin/env python3

# manhattan distance
def manhattan(p1, p2):
    return abs(p1-p2)

# euclidean distance
def euclidean(p1, p2):
    return (p1-p2)**0.5

# calcuate the centroid from the data point
def calculate_centroid(points, integer=True):
    return round(sum(points)/len(points)) if integer else sum(points)/len(points)

"""
    real kmeans resursive function
    centroids : list of centroid points
    points : real data points
    dist_metric : as the name applies
"""
def kmeans(centroids, points, dist_metric=manhattan):
    # create cluster centered around the centroid
    clusters = [ [c] for c in centroids ]
    # for every point, calculate nearest centroid
    for x in points:
        d = [ (dist_metric(x, c), idx) for idx, c in enumerate(centroids) ]
        close = min(d, key = lambda x : x[0])
        c_idx = close[1]
        clusters[c_idx].append(x)
    # recalculate centroid for each cluster
    new_centroids = [ calculate_centroid(cluster) for cluster in clusters ]
    print("centroids:  {} || clusters : {}". format(centroids, clusters))
    # base condition
    if centroids == new_centroids:
        return clusters
    return kmeans(new_centroids, points, dist_metric=manhattan)

def main():
    points = [11, 8, 13, 10, 13, 5, 4, 12, 6, 10, 11, 6, 7, 13]
    centroids = [1, 2, 3]
    clusters = kmeans(centroids, points, dist_metric=manhattan)
    print("final clusters: ", clusters)

if __name__ == "__main__":
    main()

