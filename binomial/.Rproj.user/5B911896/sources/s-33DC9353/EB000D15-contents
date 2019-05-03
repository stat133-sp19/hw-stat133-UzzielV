# aux_mean
# computes mean (expected number) of successes in a given number of trials (under certain probability of success). It is
# basically saying, 'given the probabilty of succes, and the given number of trials,
# we are expecting 'x' number of successes
# takes two arguments n (trials) and p (prob)
# return mean (arithmetic)
aux_mean <- function(n = 10, p = 0.3){
  check_trials(n)
  check_prob(p)

  n*p
}

#aux_mean(10,0.3)


# aux_variance
# computes the variance of a given probability and number of trials
# takes two arguments n (trials) and p (prob)
# returns variance in the probability distribution
aux_variance <- function( n = 10, p = 0.3){
  check_trials(n)
  check_prob(p)

  (n*p)*(1-p)
}

#aux_variance(10,0.3)


# aux_mode
# finds mode of distribution
aux_mode <- function(n = 10, p = 0.3){
  check_trials(n)
  check_prob(p)

  floor((n*p)+p)
}

#aux_mode()

# aux_skewness
# tells the skewness of the distribution
# takes two arguments n (trials) and p (prob)
# returns the skewness of the distribution given as a value
aux_skewness <- function(n = 10, p = 0.3){
  check_trials(n)
  check_prob(p)

  (1-(2*p))/sqrt((n*p)*(1-p))
}

#aux_skewness(10,0.9)

# aux_kurtosis
# tells you the taildness of the distribution; it is a descriptor of the shape of the distribution
# takes two arguments n (trials) and p (prob)
# returns the kurtosis or tailedness of the distribution
aux_kurtosis <- function(n = 10, p = 0.3){
  check_trials(n)
  check_prob(p)

  (1- ((6*p)*(1- p))) / ((n*p)*(1- p))
}

#aux_kurtosis(10,0.3)

