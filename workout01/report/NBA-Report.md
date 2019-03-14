NBA-Report
================
Uzziel Valencia
3/13/2019

    ## Warning: Missing column names filled in: 'X1' [1]

    ## Parsed with column specification:
    ## cols(
    ##   X1 = col_double(),
    ##   name = col_character(),
    ##   team_name = col_character(),
    ##   game_date = col_character(),
    ##   season = col_double(),
    ##   period = col_double(),
    ##   minutes_remaining = col_double(),
    ##   seconds_remaining = col_double(),
    ##   shot_made_flag = col_character(),
    ##   action_type = col_character(),
    ##   shot_type = col_character(),
    ##   shot_distance = col_double(),
    ##   opponent = col_character(),
    ##   x = col_double(),
    ##   y = col_double(),
    ##   minute = col_double()
    ## )

    ## # A tibble: 4,334 x 16
    ##       X1 name  team_name game_date season period minutes_remaini…
    ##    <dbl> <chr> <chr>     <chr>      <dbl>  <dbl>            <dbl>
    ##  1     1 Step… Golden S… 12/15/16    2016      3                3
    ##  2     2 Step… Golden S… 10/28/16    2016      3                9
    ##  3     3 Step… Golden S… 11/1/16     2016      2                5
    ##  4     4 Step… Golden S… 12/1/16     2016      3                5
    ##  5     5 Step… Golden S… 4/4/17      2016      3                2
    ##  6     6 Step… Golden S… 11/19/16    2016      4                5
    ##  7     7 Step… Golden S… 11/21/16    2016      3                9
    ##  8     8 Step… Golden S… 3/29/17     2016      2                1
    ##  9     9 Step… Golden S… 11/25/16    2016      3               10
    ## 10    10 Step… Golden S… 12/28/16    2016      3                3
    ## # … with 4,324 more rows, and 9 more variables: seconds_remaining <dbl>,
    ## #   shot_made_flag <chr>, action_type <chr>, shot_type <chr>,
    ## #   shot_distance <dbl>, opponent <chr>, x <dbl>, y <dbl>, minute <dbl>

5.1) Effective Shooting Percentage
==================================

two\_ptr = two\_ptr %&gt;% group\_by(name) %&gt;% summarise(made = sum(shot\_made\_flag == 'shot\_yes'))

getwd()
