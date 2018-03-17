?airmiles

head(airmiles) # first 6 rows
tail(airmiles) # last 6 rows

summary(mtcars) # print basic statistics on each of the variable

plot(mtcars)
hist(airmiles) # histogram

head(mtcars)


sum(mtcars$wt) # sum of column wt

attach(mtcars) # attach to R session environment
sum(wt) # noe R knows which data frame to use it is attahced
detach(mtcars) # remove it from environment
sum(wt) # error


mtcars[2,6]
mtcars[c(2,5,8),6]


