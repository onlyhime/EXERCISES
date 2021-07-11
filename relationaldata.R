library(tidyverse)
library(nycflights13)
library(tidyr)
library(ggplot2)
library(tibble)
library(Lahman)
library(babynames)
library(fueleconomy)
library(maps)
library(tibble)
library(dplyr)
library(viridis)
airlines
airports
planes
weather


#1 Add a surrogate key to flights.
flights2 <- flights%>%
  mutate(key=row_number())
view(flights2)



#2. Identify the keys in the following datasets:
Lahman::Batting
# For Lahman::Batting, the primary key is playerID. 
babynames::babynames
# For babynames::babynames, the primary key is name.
fueleconomy::vehicles
# For fueleconomy, the primary key is id.
view(ggplot2::diamonds)
# For ggplot2::diamonds, there's no primary key.



#3 Draw a diagram illustrating the connections between the Bat
# ting, Master, and Salaries tables in the Lahman package.
# Draw another diagram that shows the relationship between Mas
# ter, Managers, and AwardsManagers.
Batting
Master
Salaries
# The primary key of these three is playerID.

Master
Managers
AwardsManagers

Batting
Pitching
Fielding

airlines
flights

flights2 %>%
  select(-origin, -dest) %>%
  left_join(airlines, by = "carrier")

flights2 %>%
  select(-origin, -dest) %>%
  mutate(name = airlines$name[match(carrier, airlines$carrier)])


# 1 inner join doesn't include unmatched rows in the result.

x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3"
)

y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  4, "y3"
)


x%>%
  inner_join(y, by="key")


# there are 3 types of outer joins:

# • A left join keeps all observations in x.
x%>%
  left_join(y, by="key")


# • A right join keeps all observations in y.
x%>%
  right_join(y, by="key")

# • A full join keeps all observations in x and y.
x%>%
  full_join(y, by="key")


# Unless you have other strong reasons, left join should be your default join.

# The examples above all have the assumption that the keys are unique. 
# What if the keys are not unique?


# e.g.1 if x contains duplicate keys but y contains unique keys.
#(key is primary key in y but foreign key in x)
x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  2, "x3",
  1, "x4"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2"
)

left_join(x, y, by = "key")


# e.g.2 both x and y contains duplicate keys.
# When you join duplicated keys, you get all possible combinations, the Cartesian product:

x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  2, "x3",
  3, "x4"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  2, "y3",
  3, "y4"
)
left_join(x, y, by = "key")



########### Defining the Key Columns

# natural join
# by=NULL
weather
flights2
# they have the same variable: year month day hour origin time_hour

flights2 %>%
  left_join(weather)

# by="x" this will match the key in two tables with the same varibale name.
flights2 %>%
  left_join(planes, by = "tailnum")


# by=c("a"="b") this means will join a in x and b in y, the output will be named a.
flights2 %>%
  left_join(airports, c("dest" = "faa"))

flights2 %>%
  left_join(airports, c("origin" = "faa"))


