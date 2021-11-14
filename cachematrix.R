## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}
## This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {## define the argument with default mode of "matrix"
	inv <- NULL                            ## set inv as NULL
	set <- function(y) {                   ## define the set function to assign new
		x <<- y                            ## value of matrix in parent environment
		inv <<- NULL                       ## if there is a new matrix, reset inv to NULL
	}
	get <- function() x                    ## Define the get function, return value of matrix argument
	
	setinverse <- function(inverse) inv <<- inverse     ## Assign value of inv in parent environment
	getinverse <- function() inv                         ## Get the value of inv when it is called
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)  ## Refer to functions with the $ operator
}

## Write a short comment describing this function
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed)
## Then cacheSolve will retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
     inv <- x$getinverse()
     if(!is.null(inv)){
     	message("getting cached data")
     	return(inv)
     }
     data <- x$get()
     inv <- solve(data,...)
     x$setinverse(inv)
     inv
 }