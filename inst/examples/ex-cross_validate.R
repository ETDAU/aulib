library(tidyverse)

# create a fake data set with original columns (x & y) and their transformed columns (x_yn and y_num)
data =
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
  # apply transformation
  mutate(x_yn =  # dichotomize "x"
           ifelse(x == "yes", 1,
                  ifelse(x == "no", 0, NA)),
         across(y, # convert "y" into numeric
                ~case_when(. == "A" ~ 1L,
                           . == "B" ~ 2L,
                           . == "C" ~ 3L,
                           . == "D" ~ 4L,
                           . == "E" ~ 5L,
                           TRUE ~ NA_integer_),
                .names = "{.col}_num"))

# To create a codebook of both original and transformed columns of their unique levels
cross_validate(data,
               suffix = c("yn", "num"),
               codebook = TRUE)

# To inspect transformed columns
