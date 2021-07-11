library(readr)

# To fix the encoding problem you have to specify the encoding in parse_character()
# readr provides guess_encoding() to help you figure the encoding out



x1 <- "El Ni\xf1o was particularly bad this year"
x2 <- "\x82\xb1\x82\xf1\x82\xc9\x82\xbf\x82\xcd"


parse_character(x1, locale = locale(encoding = "Latin1"))
#> [1] "El Niño was particularly bad this year"
parse_character(x2, locale = locale(encoding = "Shift-JIS"))
#> [1] "こんにちは"



guess_encoding(charToRaw(x1))
guess_encoding(charToRaw(x2))


