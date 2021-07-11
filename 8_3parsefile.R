fruit <- c("apple", "banana")
parse_factor(c("apple", "banana", "bananana"), levels = fruit)

?locale
??data.table


library(tidyverse)
challenge <- read_csv(readr_example("challenge.csv"),
                      col_types = cols(
                        x=col_integer(),
                        y=col_character()
                      )
                      )

##
challenge <- read_csv(
  readr_example("challenge.csv"),
  col_types = cols(
    x = col_double(),
    y = col_character()
  )
)
##



##直接在read_csv中定义好col_types=cols()，即可自定义每一行的数据类型，免去猜测过程
challenge <- read_csv(
  readr_example("challenge.csv"),
  col_types = cols(
    x = col_double(),
    y = col_date()
  )
)
##

tail(challenge)
problems(challenge)
view(problems(challenge))

?col_double
?parse_double



#readr会默认搜所前1000条case，然后对其进行猜测，若需要设置猜测case的最大条数，可用guess——max=设定
challenge2 <- read_csv(
  readr_example("challenge.csv"),
#  guess_max = 1001
)
challenge2


#分组符号和小数点符号必须不同
parse_double("1,23", locale = locale(decimal_mark = ",",grouping_mark="."))
#Error: `decimal_mark` and `grouping_mark` must be different


?date_format


d1 <- "January 1, 2010"
d2 <- "2015-Mar-07"
d3 <- "06-Jun-2017"
d4 <- c("August 19 (2015)", "July 1 (2015)")
d5 <- "12/30/14" # Dec 30, 2014
t1 <- "1705"
t2 <- "11:15:10.12 PM"



df <- tribble(
  ~x, ~y,
  "1", "1.21",
  "2", "2.32",
  "3", "4.56"
)
type_convert(df)





library(tidyverse)
table2
