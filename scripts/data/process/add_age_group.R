# add_age_group.R
# Adds derived columns needed downstream:
#   category = age group ("Under 40" / "40 and over")
#   value    = number of cases (the outcome analysed later)

library(readr)
library(dplyr)

df <- read_csv("data/processed/dummy.csv", show_col_types = FALSE)

df <- df %>%
  mutate(
    category = if_else(age < 40, "Under 40", "40 and over"),
    value    = cases
  )

write_csv(df, "data/processed/dummy.csv")

message("Added 'category' (age group) and 'value' (cases) columns.")