work_dir = "C:/Users/user/Desktop/R/"
setwd(work_dir)


library("ggplot2")
library("tidyverse")
library("readxl")



as_tibble(iris)

tibble(
  x = 1:5,
  y = 1,
  z = x ^ 2 + y
)


tribble(
  ~x, ~y, ~z,
  #--|--|----
  "a", 2, 3.6,
  "b", 1, 8.5
)

tibble(
  a = lubridate::now() + runif(1e3) * 86400,
  b = lubridate::today() + runif(1e3) * 30,
  c = 1:1e3,
  d = runif(1e3),
  e = sample(letters, 1e3, replace = TRUE)
)
tibble.width = Inf

package?tibble



df <- tibble(
  x = runif(5),
  y = rnorm(5)
)
# Extract by name
df$x
df[["y"]]
# Extract by position
df[[2]]

df %>% .$x
df %>% .[["x"]]
?runif
?rnorm


class(as.data.frame(tb))
#turn a tibble back to a data frame


#Exercises
#1
print(mtcars)
# Tibble has names of variables in the first row. 
# Tibble will also tell you the type of each variable.



#2
#2.1
df <- data.frame(abc = 1, xyz = "a")
df$x
df[, "xyz"]
df[, c("abc", "xyz")]
###Result###
#[1] "a"
#[1] "a"
#abc xyz
#1   1   a
###Result###
#In the default data frame, df$x returns all the value of variable names that contains"x".
#When searching by names, the "" will stay with the result.
#But sometimes the "" disappear. There's no consistency in the use of "".
#
#2.2
df <- tibble(abc = 1, xyz = "a")
df$x
df[, "xyz"]
df[, c("abc", "xyz")]
###
#NULL
#Warning message:
#  Unknown or uninitialised column: `x`. 
#
# A tibble: 1 x 1
#xyz  
#<chr>
#  1 a 
#
# A tibble: 1 x 2
#abc xyz  
#3<dbl> <chr>
#  1     1 a 
###
#When using tibble, df$x only returns variable names that's exactly the same.
#Tibble returns values without "".
#It always explicitly tell you it's a tibble and gives the size, variable names and their types.



#3




