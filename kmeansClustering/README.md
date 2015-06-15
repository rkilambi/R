#R/kmeans Clustering algoithm/README.md

commands to usage:
randomData<-gendata(10000,30,1000)
clusteredResult<-myKmeans(randomData1$all_points,randomData$centers,150)

viewing results:
clusteredResult$new_centers
clusteredResult$labels

for timing the result use:
p<-proc.time()
randomData<-gendata(10000,30,1000)
clusteredResult<-myKmeans(randomData1$all_points,randomData$centers,150)
print(proc.time()-p)

This project is an implementation of the kmeans clustering algorithm using matrix multiplication for efficient use

The algorithm contains three methods:
1.genData(N,D,K)
2.closestCenters(all_points,centers)
3.myKmeans(all_points,centers,niter)

Assume the data to be an input of D by N matrix (each of N points have D-dimeansions)

1.GenData:

It takes three inputs 
D-dimensions
N-Number of points
K-Number of centers

returns a list of two components:
all_points- a D by N matrix generated in random with replacements
centers   - an matrix of  D by k,choosen random from all_points

2.closestCenters

It takes the ouput of the previous method gendata
all_points and centers

returns
labels - find the closest center for each point in all_point and store their center id in labels
new_centers-a D by K matrix obtained by averagint the point in the label   

3.mykmeans(power Iteration method)

It takes all_points, centers and niter as its arguments
niter - specifies the number of possible iterations to be run on the points

returns a list of the new_centers and labels
