## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(collapse = TRUE,comment = "#>")
library(binomial)
#shift+command+B

## ------------------------------------------------------------------------
bin_choose()

## ---- fig.show='hold'----------------------------------------------------
plot(1:10)
plot(10:1)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(mtcars, 10))

