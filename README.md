The AU’s library of R functions
================

R package for MLITSD’s Analytics Units.

## Installation

Install the most updated version using `remotes::install_github()`

    remotes::install_github("ETDAU/aulib")

Or, a source package using `devtools::install_github()`

    devtools::install_github("https://github.com/ETDAU/aulib/releases/tag/v0.0.0.9000")

## Functions

### `au_palette()`

`au_palette()` provides a palette of accessible colours that are
recommended by the [OPS](https://intra.ontario.ca/tbs/ontario-logo)
(`palette = "ops"`) and are commonly used in the analytics units
(`palette = "au"`).

``` r
# create fake data 
tibble(w = sample(LETTERS[1:6], size = 100, replace = T)) %>%
  count(w) %>% 
  # create a bar graph with the fake data  
  ggplot(aes(x = w,
             y = n,
             fill = w)) +
  geom_bar(stat = "identity",
           position = position_dodge(.8)) + 
  scale_fill_manual(guide = "none",
                    # using AU palette (Or leave the argument blank; `au_palette()`)
                    values = au_palette(palette = "au")) +
  scale_y_continuous("Count") +
  scale_x_discrete("") + 
  theme_classic()
```

![](README_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

You can use both `ops` and `au` palettes by leaving the argument empty:
`au_palette()`.

### `make_ca_connection()`

`make_ca_connection()` creates a connection object using an ODBC driver
with the log-in credentials saved as the system environment variables as
“userid” (user ID) and “pwd” (password). For saving your credentials in
your `.Renviron`, check this
[instruction](https://github.com/ETDAU/aulib/blob/main/vignettes/odbc-credentials.Rmd).

    con = make_ca_connection()

### `rm_dup_response()`

`rm_dup_response()` is a helper function for cleaning duplicated
responses that are concatenated (e.g., “yes, yes”).

``` r
# create a vector of strings with some duplicated responses
tibble(duplicated_response = c("yes, yes", "no", "yes, no", "YES, yes",
                               "hello world, hello WORLD",
                               "hello world, bye world")) %>% 
  # apply `rm_dup_responses()` to clean the duplicated_response column  
  mutate(clean_response = rm_dup_responses(duplicated_response, 
                                           sep = ","))
```

    # A tibble: 6 × 2
      duplicated_response      clean_response        
      <chr>                    <chr>                 
    1 yes, yes                 yes                   
    2 no                       no                    
    3 yes, no                  yes, no               
    4 YES, yes                 YES                   
    5 hello world, hello WORLD hello world           
    6 hello world, bye world   hello world, bye world

### `binary_to_numeric()`

`binary_to_numeric()` converts “yes” and “no” responses to numeric
values of 1 and 0, respectively.

``` r
# create a string of binary responses
tibble(binary_response = c(sample(c("yes", "no"), 6, replace = TRUE), "YES")) %>% 
  # apply `binary_to_numeric()` to convert into numeric values 
  mutate(numeric_response = binary_to_numeric(binary_response))
```

    # A tibble: 7 × 2
      binary_response numeric_response
      <chr>                      <int>
    1 yes                            1
    2 no                             0
    3 no                             0
    4 no                             0
    5 no                             0
    6 no                             0
    7 YES                            1

### `cross_validate()`

`cross_validate()` allows you to cross-validate recoding (e.g.,
dicotomizing, converting to numeric values) by comparing levels in the
original and transformed columns side by side.

Create a fake data set with some columns and recode these columns.

``` r
(data =
  data.frame(x = sample(c("yes", "no", "maybe"),
                        100,
                        replace = TRUE),
             y = sample(LETTERS[1:5],
                        size = 100,
                        replace = TRUE),
             z = sample(LETTERS,
                        size = 100,
                        replace = TRUE),
             xy = sample(1:100,
                         100)) %>%
  #' transform variables 
  mutate(x_yn = # dichotomize "x"
           ifelse(x == "yes", 1,
                       ifelse(x == "no", 0, NA)),
         across(y, # convert "y" into numeric
                ~case_when(. == "A" ~ 1L,
                           . == "B" ~ 2L,
                           . == "C" ~ 3L,
                           . == "D" ~ 4L,
                           . == "E" ~ 5L,
                           TRUE ~ NA_integer_),
                .names = "{.col}_num")))
```

            x y z  xy x_yn y_num
    1   maybe E E  94   NA     5
    2     yes B Z  80    1     2
    3      no D Q  41    0     4
    4     yes E R  33    1     5
    5   maybe B N   7   NA     2
    6   maybe B T  81   NA     2
    7      no A S  13    0     1
    8   maybe B X  56   NA     2
    9     yes D P  76    1     4
    10     no E I   5    0     5
    11  maybe B V  89   NA     2
    12    yes C D   8    1     3
    13    yes A T 100    1     1
    14  maybe B L   1   NA     2
    15     no C D  93    0     3
    16    yes E S  75    1     5
    17     no C R  71    0     3
    18    yes E E  92    1     5
    19     no C Q  22    0     3
    20    yes C P  97    1     3
    21    yes C N  52    1     3
    22  maybe E F  68   NA     5
    23     no C K  69    0     3
    24  maybe B Y  44   NA     2
    25    yes E B  66    1     5
    26  maybe C L  27   NA     3
    27     no D L  30    0     4
    28    yes E I  47    1     5
    29     no D B  28    0     4
    30     no E D  50    0     5
    31    yes D H  58    1     4
    32     no D W  90    0     4
    33  maybe A P  88   NA     1
    34    yes A P  70    1     1
    35  maybe E M  61   NA     5
    36  maybe D H  63   NA     4
    37  maybe D F  49   NA     4
    38    yes B G  83    1     2
    39     no A U  48    0     1
    40  maybe D U  62   NA     4
    41    yes E B  32    1     5
    42    yes E N  39    1     5
    43     no A U  98    0     1
    44    yes A U  59    1     1
    45  maybe D F  86   NA     4
    46    yes D F  45    1     4
    47     no C H  87    0     3
    48  maybe A U  85   NA     1
    49    yes A J  67    1     1
    50  maybe E A  26   NA     5
    51  maybe A U  51   NA     1
    52    yes B T  24    1     2
    53    yes C J  35    1     3
    54    yes B F  73    1     2
    55    yes E R  91    1     5
    56  maybe D V  37   NA     4
    57     no D G  20    0     4
    58     no D H  43    0     4
    59    yes E A  84    1     5
    60  maybe A E  57   NA     1
    61    yes A B  99    1     1
    62    yes D I  64    1     4
    63    yes E V  18    1     5
    64  maybe C F   9   NA     3
    65  maybe B B  65   NA     2
    66    yes B M  96    1     2
    67     no C W  74    0     3
    68  maybe D A  23   NA     4
    69     no E P  46    0     5
    70     no A P  77    0     1
    71    yes B U   6    1     2
    72     no A U  79    0     1
    73     no B L  34    0     2
    74     no D S  21    0     4
    75    yes D V  14    1     4
    76    yes A R  40    1     1
    77    yes D H  95    1     4
    78    yes C H  25    1     3
    79  maybe E N   4   NA     5
    80     no D I  82    0     4
    81    yes B F  42    1     2
    82    yes A G  19    1     1
    83    yes C T  72    1     3
    84     no E U  78    0     5
    85  maybe E U  38   NA     5
    86  maybe B Z  55   NA     2
    87  maybe E F  53   NA     5
    88    yes B Y  17    1     2
    89  maybe A F  29   NA     1
    90  maybe E G   2   NA     5
    91    yes E W   3    1     5
    92     no B X  10    0     2
    93    yes D O  31    1     4
    94  maybe B R  12   NA     2
    95    yes B E  36    1     2
    96  maybe C U  15   NA     3
    97    yes E P  60    1     5
    98    yes C Q  16    1     3
    99    yes C G  11    1     3
    100    no D W  54    0     4

To inspect whether/how the transformed levels correspond to the original
levels, use `codebook = FALSE`:

``` r
data %>% 
  # exclude untransformed columns
  select(-c(z, xy)) %>% 
  cross_validate(data = .,
                 suffix = c("yn", "num"),
                 codebook = FALSE)
```

    [[1]]
      x_yn     x
    1    0    no
    2    1   yes
    3   NA maybe

    [[2]]
      y_num y
    1     1 A
    2     2 B
    3     3 C
    4     4 D
    5     5 E

To create a codebook with both original and transformed variables with
their corresponding levels, use `codebook = TRUE`:

``` r
cross_validate(data,
               suffix = c("yn", "num"),
               codebook = TRUE)
```

    Warning in cross_validate(data, suffix = c("yn", "num"), codebook = TRUE):
    Column(s) with too many levels (xy) were excluded.

    # A tibble: 5 × 2
      variable response_options                                                     
      <chr>    <chr>                                                                
    1 x        maybe, no, yes                                                       
    2 x_yn     0 = no, 1 = yes, maybe                                               
    3 y        A, B, C, D, E                                                        
    4 y_num    1 = A, 2 = B, 3 = C, 4 = D, 5 = E                                    
    5 z        A, B, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X,…

### `clean_query()`

`clean_query()` is a function created by [Tori
Oblad](https://stackoverflow.com/a/58446028) that facilitates importing
`.sql` queries into R by removing comment lines and line breaks from
queries.
