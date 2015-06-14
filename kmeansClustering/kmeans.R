#function gendata
gendata<-function(N,D,K){
  D<-D 
  N<-N 
  K<-K
  #random normal distribution with rounding to nearest decimal
  all_points<-matrix(abs(round(100*rnorm(D*N))),nrow=D,ncol=N)
  l<-sample(c(1:N),K,replace = FALSE)
  centers<-subset(all_points,select = c(l))
  result<-list(all_points=all_points,centers=centers)
  return(result)
}

#function closestCenters
closestCenters<-function(all_points,centers){
  a<-matrix(t(colSums(all_points^2)),nrow=ncol(all_points),ncol=ncol(centers))
  b<-matrix(colSums(centers^2),nrow=ncol(all_points),ncol=ncol(centers),byrow=TRUE)
  x<-(-2*t(all_points) %*% centers)
  label<-matrix(NA,nrow=1,ncol=ncol(all_points))
  y<-a+b+x
  #finding minimum
  for(i in 1:ncol(all_points)){
    label[1,i]<-which.min(y[i,])
  }
  new_centers<-matrix(NA,nrow=nrow(all_points),ncol=ncol(centers))
  for(i in 1:ncol(centers)){
    z<-c(which(label == i))
    if(length(z)==1) z<-rep(z,2)
    new_centers[,i]<-rowMeans(all_points[,z])
  }
  #decreasing number of iterations
  if(length(centers) == length(which(centers==new_centers))){
    loop<<-niter
  }
  result<-list(new_centers = new_centers,label=label)
  return(result)
}

#function myKmeans
myKmeans<-function(all_points,centers,niter){
  environment(closestCenters)<-environment()
  for(loop in 1:niter){
    result2<-closestCenters(all_points,centers)
    centers<-result2$new_centers
    label<-result2$label
    loop<-loop+1
  }
  result<-list(new_centers=centers,label=label)
}

