README
================

# The AU’s library of R functions

R package for MLITSD’s Analytics Units.

## Functions

1.  `au_palette()` provides hex-codes of accessible colours that are
    recommended by the [OPS](https://intra.ontario.ca/tbs/ontario-logo)
    and are commonly used in the analytics units.

``` r
# create a fake data 
data.frame(x = rnorm(n = 60),
           y = rnorm(n = 60),
           w = as.factor(rep(LETTERS[1:6], times = 10))) %>%
  # plot 
  ggplot(aes(x = x,
             y = y,
             colour = w)) +
  geom_point() +
  scale_color_manual(values = au_palette(palette = "au")) +
  theme_classic()
```

![](README_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

1.  `make_ca_connection()` creates a connection object using an ODBC
    driver with the log-in credentials saved as the system environment
    variables as “userid” (user ID) and “pwd” (password). For saving
    your credentials in your `.Renviron`, check this
    [instruction](vignettes/odbc-credentials.Rmd)

<!-- -->

    con = make_ca_connection()

1.  `rm_dup_response()` is a helper function for cleaning duplicated
    responses that are concatenated (e.g., “yes, yes”).

``` r
# create a vector of strings with some duplicated responses
duplicated_response = c("yes, yes", "no", "yes, no")

rm_dup_responses(response = duplicated_response, sep = ",")
```

    ## [1] "yes"     "no"      "yes, no"

1.  `binary_to_numeric` converts “yes” and “no” responses to numeric
    values of 1 and 0, respectively.

``` r
# create a string of binary responses
response = c(sample(c("yes", "no"), 6, replace = TRUE), "YES")

binary_to_numeric(response)
```

    ## [1] 0 1 0 0 1 0 1

1.  `clean_query()` is a function created by [Tori
    Oblad](https://stackoverflow.com/a/58446028) that facilitates
    importing `.sql` queries into R by removing comment lines and line
    breaks from queries.
