# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R
setwd("~/R/Homework")
read.csv("SPTimePeriods.csv") #SPTimePeriods.csv is the Time Periods tab of the dataset sent for HW1 with the key row and assumptions column removed.

# 2. Peek at the top few rows
SPTimePeriods <- read.csv("SPTimePeriods.csv")
head(SPTimePeriods, 10)

# 3. Peek at the top few rows for only a few columns
head(SPTimePeriods, 10) [c(1,2,3)]

-----#notes from review of homework: head(SPTimePeriods[10,1:5]) 
-----#length(SPTimePeriods) gives you the number of columns

# 4. How many rows does your data have?
# there are 292 rows in the dataset
  
-----#nrow(SPTimePeriods) is the best method

# 5. Get a summary for every column
summary(SPTimePeriods)

# 6. Get a summary for one column
summary(SPTimePeriods$Relationship)

-----#Other options: in general the $ is the best method and using the name of the column is better because numbers can change. The list below is in order of preference after $
  #summary(SPTimePeriods[, "Relationship"])
  #summary(SPTimePeriods[, "ID", "Relationship", T2])
  #summary(SPTimePeriods[["Relationship"]])
  #summary(SPTimePeriods["Relationship"])
  #summary(SPTimePeriods[,1])
  #summmary(SPTimePeriods[[1]])
  #summary(SPTimePeriods[1])


  
  # 7. Are any of the columns giving you unexpected values?
#    - missing values? (NA)

#D'Ippolito_Answer: no data are missing - however because the column headers have spaces and parentheses their formatting is a little off and will need to be changed.

# 8. Select a few key columns, make a vector of the column names
ID <- SPTimePeriods$ID
Relationship <- SPTimePeriods$Relationship
T2 <- SPTimePeriods$T2..Jan.June.1992.
T3 <- SPTimePeriods$T3..July.Dec.1992.
T4 <- SPTimePeriods$T4..Jan.Feb.1993.
T5 <- SPTimePeriods$T5..March.April.1993.
T6 <- SPTimePeriods$T6..May.June.1993.
T7 <- SPTimePeriods$T7..July.Aug.1993.

c(ID, Relationship, T2, T3, T4, T5, T6, T7)

----#Other Options:
  #mycols <- c("Relationship", "ID", T2, T3, T4, T5, T6, T7)
  #mycolumns <- c(1:4)
  #colnames(SPTimePeriods)[mycolumns]
  #summary(SPTimePeriods[, mycols])

# 9. Create a new data.frame with just that subset of columns
#    from #7
#    - do this in at least TWO different ways

# Michelle: Do you mean from #8? If so, see below.
mydf <- data.frame(ID, Relationship, T2, T3, T4, T5, T6, T7)
mydf

mydf2 <- data.frame(ID, Relationship,SPTimePeriods$T2..Jan.June.1992.,SPTimePeriods$T3..July.Dec.1992.,SPTimePeriods$T4..Jan.Feb.1993.,SPTimePeriods$T5..March.April.1993.,SPTimePeriods$T6..May.June.1993.,SPTimePeriods$T7..July.Aug.1993.)
mydf2

----#Other Options:
  #new.SPTimePeriods <- SPTimePeriods[, mycols]
  #new.SPTimePeriods <- data.frame(minpair[, mycols]) - helps to ENSURE that it is a data frame and not a vector
  #head(new.SPTimePeriods)

# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from #8
mydf2[c(1:10,283:292),] #this is the least robust way to do this because the row labels are not always constant and ordered

----#other options:
  #top <- head(SPTimePeriods, 10)
  #bottom <- tail(SPTimePeriods, 10) - descriptive variable names are really good
  #top.and.bottom <- rbind(top, bottom) - rbind binds rows together and is the best option but no one knew about it before this homework
  #nrows <- nrow(SPTimePeriods)
  #top.and.bottom <- SPTimePeriods[c(1:10, nrows-9:nrows)] - semantics are unclear here

# 11. Create a new data.frame that is a random sample of half of the rows.
mydf3 <- mydf[sample(146:nrow(mydf),replace=FALSE),]
mydf3

---#other options:
  #number.of.rows <- nrow(SPTimePeriods)
  #sample.rows <- sample(number.of.rows,3)
  #SPTimePeriods.sample <- SPTimePeriods[sample.rows, ]
  #SPTimePeriods.half <- SPTimePeriods[sample(1:nrow(SPTimePeriods), nrow(SPTimePeriods)/2),] - this combines all the steps above

# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test for that comparison
#     - decide whether you need a non-default test
#       (e.g., Student's, paired)
#     - run the t.test with BOTH the formula and "vector"
#       formats, if possible
#     - if one is NOT possible, say why you can't do it

# A comparison of individuals between the two time periods
T2 <- SPTimePeriods$T2..Jan.June.1992.
T3 <- SPTimePeriods$T3..July.Dec.1992.
t.test(T2,T3)

#This does not require a non-default test
#The formula format is not possible because the grouping factor does not have exactly 2 levels.

# 13. Repeat #10 for TWO more comparisons
#     - ALTERNATIVELY, if correlations are more interesting,
#       do those instead of t-tests (and try both Spearman and
#       Pearson correlations)

#I am not sure if you mean #10 or #12, because #10 did not involve any t.tests or correlation tests. As such, I am going to repeat #12 with two more comparisons

T4 <- SPTimePeriods$T4..Jan.Feb.1993.
T5 <- SPTimePeriods$T5..March.April.1993.
t.test(T4,T5)

#SPTimePeriods$T2[SPTimePeriods$Alan]

T6 <-SPTimePeriods$T6..May.June.1993.
T7 <-SPTimePeriods$T7..July.Aug.1993.
t.test(T6,T7)

# 14. Save all results from #12 and #13 in an .RData file
test.1992 <- t.test(T2,T3)
test.1993a <- t.test(T4,T5)
test.1993b <- t.test(T6,T7)
save(test.1992,test.1993a,test.1993b,file = "D'Ippolito_HW2.RData")

# 15. Email me your version of this script, PLUS the .RData
#     file from #14
