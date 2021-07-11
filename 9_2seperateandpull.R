###seperate()###unite()###

library(tidyverse)
library(tidyr)

table3 %>%
  separate(
    rate, 
    into = c("cases", "population"),
    # specify the separator
    sep="/", 
    #convert the new variables to better types
    convert=TRUE  
    )


table3 %>%
  separate(
    year, 
    into = c("century", "year"),
    # specify the separator
    sep=2, 
    # if convert=TRUE, then 00 will be 0, it's stored as int, not chr
    convert=FALSE
  )


table5%>%
  unite(newyear,century,year,sep="")

# Exercises
# 1. What do the extra and fill arguments do in separate()?
# Experiment with the various options for the following two toy datasets:

# if there's extra elements after separation, extra="drop" decides to drop the value, 
# extra="merge" merges it with the nearest value.
tibble(x = c("a,b,c", "d,e,f,g", "h,i,j"))%>%
  separate(x, c("one", "two", "three"),sep=",",extra="drop")

# if there's not enough elements after separation, fill="left" put NA on the left, 
# fill="right", put NA on the right.
tibble(x = c("a,b,c", "d,e", "f,g,i")) %>%
  separate(x, c("one", "two", "three"),sep = ",",fill = "left")

# 2. Both unite() and separate() have a remove argument. What does it do?
# Why would you set it to FALSE?

# If remove=TRUE, it removes input column from output data frame

tibble(x = c("a,b,c", "d,e,f,g", "h,i,j"))%>%
  separate(x, c("one", "two", "three"),sep=",",extra="drop",remove = FALSE)

# 3. Compare and contrast separate() and extract(). Why are there three variations of separation
# (by position, by separator, and with groups), but only one unite?
?separate

# Separator between columns.
# If character, sep is interpreted as a regular expression. The default value 
# is a regular expression that matches any sequence of non-alphanumeric values.
# If numeric, sep is interpreted as character positions to split at. Positive 
# values start at 1 at the far-left of the string; negative value start at -1 
# at the far-right of the string. The length of sep should be one less than into.

?extract()
# Given a regular expression with capturing groups, extract() turns each group into a new column. 
# If the groups don't match, or the input is NA, the output will be NA.

# extract(
#  data,
#  col,
#  into,
#  regex = "([[:alnum:]]+)",
#  remove = TRUE,
#  convert = FALSE,
#  ...
#)

#Examples
df <- data.frame(x = c(NA, "a-b", "a-d", "b-c", "d-e"))
df %>% extract(x, "A")
df %>% extract(
  x, 
  c("A", "B"), 
  "([[:alnum:]]+)-([[:alnum:]]+)"
               )

# If no match, NA:
df %>% extract(x, c("A", "B"), "([a-d]+)-([a-d]+)")

# regex	is a regular expression used to extract the desired values. 
# There should be one group (defined by ()) for each element of into.

# Because unite doesn't need to split things, you only need to put them side by side. 
# But how to separate is a question.

# complete() usage
stocks <- tibble(
  year = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr = c( 1, 2, 3, 4, 2, 3, 4),
  return = c(1.88, 0.59, 0.35, NA, 0.92, 0.17, 2.66)
)%>%
  complete(year,qtr)
stocks


# NA value should be carried over
treatment <- tribble(
  ~ person, ~ treatment, ~response,
  "Derrick Whitmore", 1, 7,
  NA, 2, 10,
  NA, 3, 9,
  "Katherine Burke", 1, 4
)%>%
  fill(person, .direction="down")
# down means top value passed down. up means bottom values passed up
treatment
?fill


#Exercises
# 1. Compare and contrast the fill arguments to spread() and complete().
?fill
fill(data, ..., .direction = c("down", "up", "downup", "updown"))
# Fills missing values in selected columns using the next or previous entry. 
# This is useful in the common output format where values are not repeated, and are only recorded when they change.

?spread
spread(data, key, value, fill = NA, convert = FALSE, drop = TRUE, sep = NULL)
# Development on spread() is complete, and for new code we recommend switching to pivot_wider(), which is easier to use, more featureful, and still under active development. 
# df %>% spread(key, value) is equivalent to df %>% pivot_wider(names_from = key, values_from = value)

?complete
complete(data, ..., fill = list())
# Turns implicit missing values into explicit missing values. This is a wrapper around expand(), 
# dplyr::left_join() and replace_na() that's useful for completing missing combinations of data.


# 2. What does the direction argument to fill() do?
# decide which value to fill in NA.



