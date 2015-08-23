## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# - setM   set value of matrix
# - getM   get value of matrix
# - setInverse set cached  value of the inverse matrix
# - getInverse get the cached  value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  # At the begining there is no cach
  cached <- NULL
  
  setM <-function(yM){
    x<<- yM
    cached<<- NULL
  }
  getM <-function() {
    x
  }
  setInverse<-function(solve){
    cached<<-solve
  }
  getInverse<-function(){
    cached
    
  }
  list(setM=setM,getM=getM,setInverse=setInverse,getInverse=getInverse)
}


## Write a short comment describing this function
# matrix is created by  makeCacheMatrix this funcion calcuate the inverse.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverseMatrix <-x$getInverse()
  #Check is it chached
  if(!is.null(inverseMatrix)){
    message("getting cached data")
    return(inverseMatrix)
  }
  
  
  #calculate when there is no cached matrix
  data<-x$getM()
  inverseMatrix<-solve(data)
  x$setInverse(inverseMatrix)
  
  inverseMatrix
}
