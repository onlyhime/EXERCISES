#Exercises
library(tidyverse)
library(tidyr)
library(dplyr)
#2 with table2
#2.a
xcases <- table2 %>%
  filter(type=="cases")%>%
  arrange(country,year)%>%
rename(cases=count)

#2.b
xpopulation <- table2 %>%
  filter(type=="population")%>%
  arrange(country,year)%>%
  rename(population=count)

#2.c

t2_cases_per_cap <- tibble(
  year = xcases$year,
  country = xcases$country,
  cases = xcases$cases,
  population = xpopulation$population
) %>%  #use $ !!!
  mutate(cases_per_cap = (cases / population) * 10000) %>%
  select(country, year, cases_per_cap)

#2.d
t2_cases_per_cap <- t2_cases_per_cap %>%
  mutate(type = "cases_per_cap") %>%
  rename(count = cases_per_cap)
  
bind_rows(table2,t2_cases_per_cap)%>%
  arrange(country, year, type,count)


##########################################
#2 with table4a+ table4b  

table4acases99 <- table4a%>%
  mutate(year="1999",cases=`1999`)%>%
  select(country,year,cases)
table4acases99  

table4acases20 <- table4a%>%
  mutate(year="2000",cases=`2000`)%>%
  select(country,year,cases)
table4acases20  

combined <- bind_rows(table4acases99,table4acases20)
combined

table4bpopulation99 <- table4b%>%
  mutate(year="1999",population=`1999`)%>%
  select(country,year,population)
table4bpopulation99  

table4bpopulation20 <- table4b%>%
  mutate(year="2000",population=`2000`)%>%
  select(country,year,population)
table4bpopulation20 

combined2 <- bind_rows(table4bpopulation99 ,table4bpopulation20)
combined2

combinedall <- combined%>%
  mutate(population=combined2$population)%>%
  arrange(country,year,cases,population)%>%
  mutate(rate=cases/population*10000)
combinedall





#4Recreate the plot showing change in cases over time using table2 instead of 
#table1. What do you need to do first?
#You need to filter the type to cases.

library(ggplot2)
table2%>%
  filter(type=="cases")%>%
  ggplot(aes(year,count))+
  geom_line(aes(group=country,color="grey50"))+
  geom_point(aes(color=country))+
  scale_x_continuous(breaks=unique(table2$year))+
  ylab("cases")

















  