work_dir = "C:/Users/user/Desktop/R/"
setwd(work_dir)


library("ggplot2")
library("tidyverse")
library("readxl")
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

file_name = ""
data0 = read_excel(file_name, sheet = "ç®å")
library(tidyverse)
mpg

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data =diamonds, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 0.1)
