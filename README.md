The AU’s library of R functions
================

R package for MLITSD’s Analytics Units.

# Functions

## `au_palette()`

`au_palette()` provides a palette of accessible colours that are
recommended by the [OPS](https://intra.ontario.ca/tbs/ontario-logo)
(`palette = "ops"`) and are commonly used in the analytics units
(`palette = "au"`).

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

You can use both `ops` and `au` palettes by leaving the argument empty:
`au_palette()`.

## `make_ca_connection()`

`make_ca_connection()` creates a connection object using an ODBC driver
with the log-in credentials saved as the system environment variables as
“userid” (user ID) and “pwd” (password). For saving your credentials in
your `.Renviron`, check this
[instruction](https://github.com/ETDAU/aulib/blob/main/vignettes/odbc-credentials.Rmd).

    con = make_ca_connection()

## `rm_dup_response()`

`rm_dup_response()` is a helper function for cleaning duplicated
responses that are concatenated (e.g., “yes, yes”).

``` r
# create a vector of strings with some duplicated responses
duplicated_response = c("yes, yes", "no", "yes, no")
```

``` r
rm_dup_responses(response = duplicated_response, sep = ",")
```

    ## [1] "yes"     "no"      "yes, no"

## `binary_to_numeric()`

`binary_to_numeric()` converts “yes” and “no” responses to numeric
values of 1 and 0, respectively.

``` r
# create a string of binary responses
response = c(sample(c("yes", "no"), 6, replace = TRUE), "YES")
```

``` r
binary_to_numeric(response)
```

    ## [1] 0 0 0 1 1 0 1

## `clean_query()`

`clean_query()` is a function created by [Tori
Oblad](https://stackoverflow.com/a/58446028) that facilitates importing
`.sql` queries into R by removing comment lines and line breaks from
queries.
