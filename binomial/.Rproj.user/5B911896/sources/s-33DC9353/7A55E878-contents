#' @title bin_choose
#' @description gives number of successes in given number of trials
#' @param n number of trials
#' @param k number of successes
#' @return the number of combinations where k successes happen in n trials
#' @export
#' @examples 10
bin_choose <- function( n = 5, k = 2){
  check_trials(n)
  check_success(n,k)

  if (sum(k - n > 0)){
    stop('k cannot be greater than n')
  }
  x <- n-k
  sapply(n,factorial) / ((sapply(k,factorial)) * sapply(x,factorial))
}

#bin_choose(5,2)

#bin_choose(5,0)

#bin_choose(5,1:3)

#bin_choose(5,5)


#' @title bin_probability
#' @description computes the binomial probability
#' @param n number of trials
#' @param k number of successes
#' @param p probability of success
#' @return binomial probability that given parameters would be true integer
#' @export
#' @examples 0.3125
bin_probability <- function (k = 2, n = 5, p = 0.5){
  check_trials(n)
  check_prob(p)
  check_success(n,k)

  bin_choose(n,k) *
    p**k * ((1-p)**(n-k))
}

#bin_probability(0:4,5,0.5)

#bin_probability(2,5,0.5)

#bin_probability(55,100,0.45)

#bin_probability(-4,5,0.3)

1.5
#' @title bin_distribution
#' @description gives a dataframe with successes and probabilities
#' @param n trials
#' @param p probability of success
#' @return returns dataframe with amount of success for each number of trials
#' @export
#' @examples
bin_distribution <- function(n = 5, p = 0.5){
  check_trials(n)
  check_prob(p)

df <- data.frame(success = 0:n, probability = bin_probability(0:n,n,p))
class(df) <- c('bindis','data.frame')
return(df)
}

#bin_distribution()



#' @export
plot.bindis <- function(x){
  barplot(x$probability,
          names.arg = x$success,
          ylab = 'Probability',
          xlab = 'Success',
          col = 'green')
  invisible(x)
}
#dis1 <- bin_distribution(n = 5, p = 0.5)
#plot(dis1)


#df <- data.frame(success = 0:n, probability = bin_probability(0:n,n,p))

#barplot(df$probability,
#        names.arg = df$success,
#        ylab = 'probability',
#        xlab = 'success')



1.6
#' @title bin_cumulative
#' @description returns dataframe with both the probabilities and the successes in the first column
#' @param n number of trials
#' @param p probability of success
#' @return dataframe with successes and cumulative successes
#' @export
#' @examples
bin_cumulative <- function(n= 5, p= 0.5){
  check_trials(n)
  check_prob(p)

  df <- data.frame(success = 0:n,
                   probability = bin_probability(0:n,n,p),
                   cumulative = cumsum(probability))
  class(df) <- c('bincum','data.frame')
  return(df)
}
#bin_cumulative()

#' @export
plot.bincum <- function(x){
  plot(x$cumulative,
       ylab = 'Probabilities',
       xlab = 'Successes',
       type= 'o',
       xaxt = "n")
  axis(1,at = 1:length(x$success),labels = x$success)
}
#bin_cum1 <- bin_cumulative()
#plot(bin_cum1)

#1.7
#' @title bin_variable
#' @description returns a bin variable
#' @param n trials
#' @param p probability
#' @return a list of named elements 'trials' and 'prob'
#' @export
#' @examples
bin_variable <- function(n,p){
  check_trials(n)
  check_prob(p)

  lst <- list(Trials = n, Probability = p)
  class(lst) <- c('binvar','list')
  return(lst)
}
#bin_variable(5,0.5)

#' @export
print.binvar <- function(x){
  cat('"Binomial Variable"')
  cat('\n')
  cat('\n')
  cat("Parameters")
  cat("\n", "Number of Trials:", x[['Trials']])
  cat("\n", "Probability of Success:", x[['Probability']])
  invisible(x)
}
#bin1 <- bin_variable(n = 10, p = 0.3)
#bin1

#' @export
summary.binvar <- function(x){
  ls <- list(trials = x[[1]],
             prob = x[[2]],
             mean = aux_mean(x[[1]],x[[2]]),
             variance = aux_variance(x[[1]],x[[2]]),
             mode = aux_mode(x[[1]],x[[2]]),
             skewness = aux_skewness(x[[1]],x[[2]]),
             kurtosis = aux_kurtosis(x[[1]],x[[2]])
             )
  class(ls) <- c("summary.binvar","list")
return(ls)
}
#summary.binvar(bin1)

#' @export
print.summary.binvar <- function(x){
  cat('"Summary Binomial"')
  cat('\n')
  cat('\n')
  cat("Parameters")
  cat("\n","-number of trials:", x[[1]])
  cat("\n","-prob of success:", x[[2]])
  cat('\n')
  cat('\n')
  cat("Measures")
  cat("\n","-mean:",x[[3]])
  cat("\n","-variance:",x[[4]])
  cat("\n","-mode:",x[[5]])
  cat("\n","-skewness:",x[[6]])
  cat("\n","-kurtosis:",x[[7]])
  invisible(x)
}
#bin1 <- bin_variable(n = 10, p = 0.3)
#binsum1 <- summary(bin1)
#binsum1

#1.8 #Functions of Measures

#' @title bin_mean
#' @description gives the mean expectation of a distribution
#' @param n number of trials
#' @param p probability of success
#' @return the mean number of successes we would expect
#' @export
#' @example
bin_mean <- function(n = 10, p = 0.3){
  check_trials(n)
  check_prob(p)
  aux_mean(n,p)
}


#' @title bin_variance
#' @description gives the varies for a given distribution
#' @param n number of trials
#' @param p probability of success
#' @return the variance of a distribution
#' @export
#' @example
bin_variance <- function(n = 10, p = 0.3){
  check_trials(n)
  check_prob(p)
  aux_variance(n,p)
}


#' @title bin_mode
#' @description gives the mode for a given distribution
#' @param n number of trials
#' @param p probability of success
#' @return the mode of a distribution
#' @export
#' @example
bin_mode <- function(n = 10, p = 0.3){
  check_trials(n)
  check_prob(p)
  aux_mode(n,p)
}


#' @title bin_skewness
#' @description gives the skewness of a given distribution
#' @param n number of trials
#' @param p probability of success
#' @return the skewness of a distribution as a given value
#' @export
#' @example
bin_skewness <- function(n = 10, p = 0.3){
  check_trials(n)
  check_prob(p)
  aux_skewness(n,p)
}


#' @title bin_kurtosis
#' @description gives the kurtosis for a given distribution
#' @param n number of trials
#' @param p probability of success
#' @return the kurtosis (taildness) of a distribution as a numeric value
#' @export
#' @example
bin_kurtosis <- function(n = 10, p = 0.3){
  check_trials(n)
  check_prob(p)
  aux_kurtosis(n,p)
}

#bin_mean()
#bin_variance()
#bin_mode()
#bin_skewness()
#bin_kurtosis()
