context("Check for Checkers")

test_that("check_prob with passing values", {

  expect_true(check_prob(c(0.1,0.2,0.3,0.4)))
  expect_true(check_prob(c(0.5,0.6,0.7,0.8,0.9)))
})

test_that("check_prob will be a length 1 ", {
  expect_length(check_prob(0.6),1)
})

test_that(" check_prob with negative values", {
  expect_error(check_prob(-0.5))
})

test_that("check_prob with non-numeric value",{
  expect_error(check_prob('a'))
})

#Context("Check for check_trials")

test_that("check_trials with n < 0", {
  expect_error(check_trials(-1:-5))
})

test_that("check_trials with non-whole numbers",{
  expect_error(check_trials(0.1:0.9))
})

test_that("check_trials with non-numeric values",{
  expect_error(check_trials('one','two'))
})


#Context("check for check_success")

test_that("'success' is 1 or higher", {
  expect_error(check_success(5,-3))
  expect_error(check_success(2,0.4))
})

test_that("'success' cannot be larger than 'trials'",{
  expect_error(check_success(4,5))
})

test_that("both 'n' and 'k' are numeric objects", {
  expect_error(check_success(4,'d'))
  expect_error(check_success('four',3))
})


#Context("Check for Summary Measures")

test_that("aux_mean works", {
  expect_equal(aux_mean(5,0.5),2.5)
  expect_is(aux_mean(5,0.4),"numeric")
})

test_that("aux_mean with higher 'p' than 'n'", {
  expect_error(aux_mean(5,9))
})

test_that("aux_mean with negative values", {
  expect_error(aux_mean(5,-2))
  expect_error(aux_mean(-6,1))
  expect_error(aux_mean(-5,-2))
})

test_that("aux_varience returns numeric object", {
 expect_is(aux_variance(5,0.2),"numeric")
})

test_that("aux varience with negative 'p'  or 'n'", {
  expect_error(aux_variance(-4,0.5))
  expect_error(aux_variance(5,-0.3))
  expect_error(aux_variance(-6,-0.5))
})

test_that("aux variance with invalid input",{
  expect_error(aux_variance('w',0.3))
  expect_error(aux_variance(5,'i'))
})

test_that("aux mode length equals 1, returns a 'numeric', cannot take negative",{
  expect_length(aux_mode(),1)
  expect_is(aux_mode(),"numeric")
  expect_error(aux_mode(-12,0.4))
})

test_that("aux skewness is not larger than 1, cannot take negative n or p",{
  expect_lt(aux_skewness(10,0.9),1)
  expect_error(aux_skewness(10,-0.9))
  expect_error(aux_skewness(-12,0.9))

})

test_that("aux kurtosis cannot take negative, is less than 1, is greater than 0",{
  expect_error(aux_kurtosis(1:10,-4))
  expect_equal(aux_kurtosis(10,0.5), -0.2)
  expect_gt(aux_kurtosis(10,0.2),0)
})

#Context("Check for Main Binomial Functions")

test_that("bin_choose proper values",{
  expect_equal(bin_choose(5,3), 10)
  expect_equal(bin_choose(6,2),15)
  })

test_that("bin_choose cannot take negative values",{
  expect_error(bin_choose(-4,2))
  expect_error(bin_choose(5,-2))
  expect_error(bin_choose(-4,-1))
})

test_that("bin_choose cannot take 'k' larger than 'n'",{
  expect_error(bin_choose(4,1:5),"successes cannot be larger than trials")
  expect_error(bin_choose(4,6),"successes cannot be larger than trials")
})

test_that("bin_probability can proper values", {
  expect_equal(bin_probability(2,5,0.5),0.3125)
  expect_equal(bin_probability(2,5,0.9),0.0081)
})

test_that("bin_probability cannot take k's larger than n",{
  expect_error(bin_probability(5,2,0.5))
  expect_error(bin_probability(6,5,0.5))
})

test_that("bin_probability cannot take improper 'p'",{
  expect_error(bin_probability(3,5,5))
  expect_error(bin_probability(3,5,-.01))
})

test_that("bin_distribution cannot take characters",{
  expect_error(bin_distribution('g',0.4))
  expect_error(bin_distribution(6,'g'))
})

test_that("bin_distribution cannot take improper 'p'",{
  expect_error(bin_distribution(5,5))
  expect_error(bin_distribution(5,-0.2))
  expect_error(bin_distribution(5,-3))
})

test_that("bin_distribution fails when given improper vector",{
  expect_error(bin_distribution(5,(4:6)))
  expect_error(bin_distribution((-2:4),3))
})

test_that("bin_cumulative cannot take improper 'p'",{
  expect_error(bin_cumulative(5,-0.5))
  expect_error(bin_cumulative(5,5))
  expect_error(bin_cumulative(5,-5))
})

test_that("bin_cumulative cannot take improper 'n'",{
  expect_error(bin_cumulative(0.5,.03))
  expect_error(bin_cumulative(-4,0.5))
  expect_error(bin_cumulative('a',0.5))
})

test_that("bin_cumulative errors with improper vectors",{
  expect_error(bin_cumulative(c(5,-4),0.5))
  expect_error(bin_cumulative(9,c(-0.1:-0.9)))
})
