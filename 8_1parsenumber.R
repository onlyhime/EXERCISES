parse_logical()

str(parse_logical(c("TRUE", "FALSE", "NA")))

str(parse_integer(c("1", "2", "3")))

str(parse_date(c("2010-01-01", "1979-10-14")))



parse_integer(c("1", "231", ".", "456"), na = ".")


# parsing failure
x <- parse_integer(c("123", "345", "abc", "123.45"))
x


## different types of parsing ##

#logic,integer
parse_logical()
parse_integer()

# number
parse_double()
parse_number()

# date and time
parse_datetime()
parse_date()
parse_time()

# character and encoding problem
parse_character()

#categorical variable
parse_factor()

# vector
parse_vector()



##1 parse_double solve the different decimal marks in different places
parse_double("1.23")

parse_double("1,23", locale = locale(decimal_mark = ","))

##2 numbers are always surrounded by other characters like currencies or percentages,
##2 but it is also useful to extract numbers

parse_number("$100")
parse_number("20%")
parse_number("It cost $123.45 and we have some over 1000 customers")

##3 different grouping characters around the world

# Used in America
parse_number("$123,456,789")

# Used in many parts of Europe
parse_number(
  "123.456.789",
  locale = locale(grouping_mark = ".")
)

# Used in Switzerland
parse_number(
  "123'456'789",
  locale = locale(grouping_mark = "'")
)








