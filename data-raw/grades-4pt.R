library(dplyr)
library(devtools)

grades_4pt <- read.csv("data-raw/grades-4pt.csv", stringsAsFactors = FALSE) %>%
  tbl_df()
use_data(grades_4pt, overwrite = TRUE)
