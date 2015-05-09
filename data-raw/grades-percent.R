library(dplyr)
library(devtools)

grades_percent <- read.csv("data-raw/grades-percent.csv",
                       stringsAsFactors = FALSE) %>%
  tbl_df()
use_data(grades_percent, overwrite = TRUE)
