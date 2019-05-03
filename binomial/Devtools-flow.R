# =====================================================
# Devtools workflow
# =====================================================

devtools::document()          # generate documentation
devtools::test()              # run tests
devtools::use_vignette()      # build vignettes
devtools::check_man()         # checks manual

Working_one
devtools::document()          # generate documentation
devtools::check_man()         # check documentation
devtools::test()              # run tests
devtools::build_vignettes()   # build vignettes
devtools::build()             # build bundle
devtools::install()           # install package
