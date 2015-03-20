s <- c(1,1,2,2,3,3,1,2,3)
lookup <- data.frame(id=c(1:3), value=c("a", "b", "c"))
sapply(s, function(x) lookup$value[x])

s <- data.frame(col1 = c(1,1,2,2,3,3,1,2,3,1),
                col2 = c(1:10),
                col3 = c(101:110))

# applies to all columns -- not what we want
# sapply(s, function(x, y) y[x], y=lookup$value)
#
# apply(s[,c('col1')], 1, function(x) lookup$value[x])
# This one does not work.  Use of dim(x) returns null
#   because class(s[,c('col1')]) is numeric, not a data frame
#   this needs to be a data,frame cast.
# 

apply(as.data.frame(s[,c('col1')]), 1, function(x) lookup$value[x])

dat <- data.frame (x=c(1,2), y=c(3,4), z=c(5,6))
apply(dat[,c('x','z')], 1, function(x) sum(x))
