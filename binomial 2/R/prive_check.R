# check_prob
# checks whether or not a probability is valid (0-1)
# if the probability is not within this range it returns an error
# takes one argument (p)
check_prob <- function( p = .5){
  if (sum(p > 1)){
    stop('p has to be a number between 0 and 1')
  }
  if (sum(p < 0)){
    stop('p has to be a number between 0 and 1')
  }
  if (sum(!is.numeric(p))) {
    stop ("'p' must be a numeric object")
  }
  return(TRUE)
}

#check_prob(-3)

# check_trials
# tests if input 'trials' is valid input (non-negative number & decimal)
# if given negative will error, if true will return TRUE
# takes one argument (n)
check_trials <- function( n = 5){
  if (sum(n < 0)){
    stop('invalid number of trials')
  }
  if (sum(0 < n & n < 1)){
    stop('invalid number of trials')
  }
  if (sum(!is.numeric(n))) {
    stop("'n' must be a numeric object")
  }
  return(TRUE)
}


# check_success
# tests if an input for number of success is valid (greater than 0 but smaller than trials(n))
# if invalid will error
# takes two arguments (k and n)
# n should be a vector of non-negative numbers lessthan or equal to n
check_success <- function( n = 5, k = 2){
  if (sum(k < 0)) {
    stop('invalid success value')
  }
  if (sum(k < 1 & k > 0)){
    stop('success cannot be a decimal')
  }
  if (sum(k > n)){
    stop('successes cannot be larger than trials')
  }
  if (sum(!is.numeric(n)) | (sum(!is.numeric(k)))) {
    stop ("'n' and 'k' must be numeric objects")
  }
  return(TRUE)
}

