% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cross_validate.R
\name{cross_validate}
\alias{cross_validate}
\title{Cross validate categorical coding of transformed variables}
\usage{
cross_validate(data, codebook = FALSE, suffix = c("yn", "num", "stdz", "freq"))
}
\arguments{
\item{data}{dataset of original and transformed variables to be cross validated}

\item{codebook}{if TRUE, the function produces a codebook of
original and transformed variables; if false, the function returns data frames of each transformed variable}

\item{suffix}{a string vector of suffix(es) used to name transformed variables.}
}
\value{
data frame(s) or a codebook
}
\description{
Cross validate categorical coding of transformed variables
}
\examples{
library(dplyr)

# create a fake data set
fake_data =
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
                      100)) \%>\%
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
cross_validate(fake_data,
            suffix = c("yn", "num"),
            codebook = TRUE)

# To inspect transformed columns
cross_validate(fake_data,
            suffix = c("yn", "num"),
            codebook = FALSE)


}
