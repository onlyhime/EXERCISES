library(tidyverse)
library(tidyr)
library(dplyr)
library(ggplot2)

table4a%>%
gather(`1999`,`2000`,key = "year",value = "count")


#the newly recommended substitute of gather() is 
#pivot_longer(c(x, y, z), names_to = "key", values_to = "value")

table4a%>%
  pivot_longer(c(`1999`,`2000`),names_to = "year",values_to = "count")





# Exercises
# 1
stocks <- tibble(
  year = c(2015, 2015, 2016, 2016),
  half = c( 1, 2, 1, 2),
  return = c(1.88, 0.59, 0.92, 0.17)
)
stocks
stocks %>%
  spread(year, return)%>%
  gather("year", "return", `2015`:`2016`)
# Because when you spread a dbl and gather it again, the variable type changes
# from dbl to chr. So it wasn't a perfectly same symmetrical process.


#2
?gather
# If TRUE will automatically run type.convert() on the key column. This is useful 
# if the column types are actually NUMERIC, INTERGER, or LOGICAL

stocks <- tibble(
  year = c(2015, 2015, 2016, 2016),
  half = c( 1, 2, 1, 2),
  return = c(1.88, 0.59, 0.92, 0.17)
)
stocks
stocks %>%
  spread(year, return)%>%
  gather("year", "return", `2015`:`2016`,convert = TRUE)

#3

people <- tribble(
  ~name, ~key, ~value, ~number,
  #-----------------|--------|------|----
  "Phillip Woods", "age", 45,1,
  "Phillip Woods", "height", 186,1,
  "Phillip Woods", "age", 50,2,
  "Jessica Cordero", "age", 37,1,
  "Jessica Cordero", "height", 156,1,
)
people
  people2 <- people %>%
  group_by(name, key) %>%
  mutate(obs = row_number())%>%
  spread(key = "key",value = "value")
people2

#4
preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes", NA, 10,
  "no", 20, 12
)%>%
pivot_longer(c("male","female"),names_to = "gender",values_to = "count",values_drop_na = TRUE)
preg

# Apart from some minor memory savings, representing these variables as 
# logical vectors results in more clear and concise code.
preg_tidy3 <- preg %>%
  mutate(
    female = gender == "female",
    pregnant = pregnant == "yes"
  ) %>%
  select(female, pregnant, count)
preg_tidy3

# storing as logical vectors helps to save space and improve speed.
preg_tidy3%>%
  filter(female,!pregnant)
