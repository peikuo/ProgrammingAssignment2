## To shorten the cauculation time, 
## These function is used to store previous result in cache.

## cache function that make matrix cached

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <- y
    s <- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This function is to cache the result that has been executed 'solve'

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
