library(readr)


# use skip=n to skip the first n lines
read_csv("The first line of metadata
The second line of metadata
x,y,z
1,2,3", skip = 2)


# use comment="#" to skip comments
read_csv("a,b,c
1,2,3
4,5,6
#this is a comment,0,0",comment="#")


# use col_names=FALSE not to treat the first row as headings
read_csv("0,0,0
1,2,3
4,5,6",col_names=FALSE)


# "\n" is a convenient shortcut for adding a new line
read_csv("a,b,c\n1,2,3\n4,5,6\n7,8,9")


# use col_names=c("a","b","c") and character vectors to name the column
read_csv("1,2,3\n4,5,6", col_names = c("x", "y", "z"))

# use na = "" to represent missing values
read_csv("a,b,c\n1,2,.\n4,.,.", na = ".")




#Exercises
#1. What function would you use to read a file where fields are separated with “|”?
?read_delim()
#read_delim(
#  file,
#  delim,
#  quote = "\"",
#  escape_backslash = FALSE,
#  escape_double = TRUE,
#  col_names = TRUE,
#  col_types = NULL,
#  locale = default_locale(),
#  na = c("", "NA"),
#  quoted_na = TRUE,
#  comment = "",
#  trim_ws = FALSE,
#  skip = 0,
#  n_max = Inf,
#  guess_max = min(1000, n_max),
#  progress = show_progress(),
#  skip_empty_rows = TRUE
#)



#2. Apart from file, skip, and comment, what other arguments do 
#read_csv() and read_tsv() have in common?
?read_delim()
#files,
#col_names = TRUE,
#col_types = NULL,
#locale = default_locale(),
#na = c("", "NA"),
#quoted_na = TRUE,
#quote = "\"",
#comment = "",
#trim_ws = TRUE,
#skip = 0,
#n_max = Inf,
#guess_max = min(1000, n_max),
#progress = show_progress(),
#skip_empty_rows = TRUE
#)


#3. What are the most important arguments to read_fwf()?
?read_fwf
read_fwf(col_positions)

#col_positions	
#Column positions, as created by fwf_empty(), fwf_widths() or fwf_positions(). 
#To read in only selected fields, use fwf_positions(). 
#If the width of the last column is variable (a ragged fwf file), supply the last end position as NA.


#4
read_delim("x,y\n1,'a,b'",',',quote="\'")



#5 Identify the problem
read_csv("a,b\n1,2,3\n4,5,6")
#automatically throw away 3 and 6

read_csv("a,b,c\n1,2\n1,2,3,4")
#automatically fill in NA in the second line, and throw away 4

read_csv("a,b\n\"1")
# automatically fill in NA in line one.

read_csv("a,b\n1,2\na,b")
# value and variable name are the same.

read_csv("a;b\n1;3")
# do not recognize ; as delimiter.




