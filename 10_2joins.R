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

# Exercises
# 1. Compute the average delay by destination, then join on the air
# ports data frame so you can show the spatial distribution of
# delays. Here’s an easy way to draw a map of the United States:

flightsx <- flights%>%
  group_by(dest)%>%
  summarise(avrdelaytime=mean(arr_delay,na.rm=TRUE))%>%
  left_join(airports,c("dest"="faa"))%>%
  # airports %>%
  #  semi_join(flightsx, c("faa" = "dest")) %>%
  ggplot(aes(lon, lat)) +
  borders("state") +
  geom_point(aes(color=avrdelaytime)) +
  coord_quickmap()

# 2. Add the location of the origin and destination (i.e., the lat and lon) to flights.
airports2 <- airports%>%
  select(faa,lat, lon)
airports2

flights <- flights%>%
  left_join(airports2,c("dest"="faa"))%>%
  rename(destlon=lon,destlat=lat)

# 3. Is there a relationship between the age of a plane and its delays?
flights2 %>%
  left_join(planes, by = "tailnum")%>%
  group_by(year.y)%>%
  summarize(n(),arvdelay=mean(dep_delay,na.rm=TRUE))%>%
  ggplot()+
  geom_point(aes(x=year.y,y=arvdelay))+
  geom_smooth(aes(x=year.y,y=arvdelay))
# according to the graph, there's no obvious connection between age of a plane and its delays.

# 4. What weather conditions make it more likely to see a delay?
weather
view(weather)
# HYPOTHESE 1: visb=visibility
flightsw <- flights%>%
  left_join(weather)
view(flightsw)
as_tibble(flightsw)%>%
  group_by(visib)%>%
  summarize(meandep_delay=mean(dep_delay,na.rm=TRUE))%>%
  ggplot()+
  geom_point(aes(visib,meandep_delay))+
  geom_smooth(aes(visib,meandep_delay),se=FALSE)

# According to hte graph, visibility does affect delay.

#HYPOTHESE2:precip=raining
flightsw <- flights%>%
  left_join(weather)
as_tibble(flightsw)%>%
  group_by(precip)%>%
  summarize(meandep_delay2=mean(dep_delay,na.rm=TRUE))%>%
  ggplot()+
  geom_point(aes(precip,meandep_delay2))+
  geom_smooth(aes(precip,meandep_delay2),se=FALSE)

# According to the graph, rain doesn't affect delay.


# 5. What happened on June 13, 2013? Display the spatial pattern of delays, 
# and then use Google to cross-reference with the weather.
#JUNE13 <- flights%>% 
#IF YOU USE <- TO STORE THE MAP,IT WILL NOT AUTOPLAY THE GRAPHIC IN THE PLOTS WINDOW!!!
flights%>% 
  filter(year==2013,month==6,day==13)%>%
  group_by(dest)%>%
  summarize(arrdelay=mean(arr_delay,na.rm=TRUE))%>%
  inner_join(airports,c("dest"="faa"))%>%
  ggplot(aes(x=lon, y=lat,size=arrdelay,colour=arrdelay)) +
  borders("state") +
  geom_point() +
  coord_quickmap()+
  scale_colour_viridis()


####Exercises_filtering joins

# 1. What does it mean for a flight to have a missing tailnum? What
# do the tail numbers that don’t have a matching record in planes
# have in common? (Hint: one variable explains ~90% of the problems.)

view(flights)
