# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R
setwd("~/R")
read.csv("SPTimePeriods.csv")

# 2. Peek at the top few rows
SPTimePeriods <- read.csv("SPTimePeriods.csv")
head(SPTimePeriods, 10)

# 3. Peek at the top few rows for only a few columns
head(SPTimePeriods, 10) [c(1,2,3)]

# 4. How many rows does your data have?
# there are 292 rows in the dataset

# 5. Get a summary for every column
summary(SPTimePeriods)

# 6. Get a summary for one column
summary(SPTimePeriods[3])

# 7. Are any of the columns giving you unexpected values?
#    - missing values? (NA)

# Michelle Answer: none of the values are incorrect, however, some of the formatting around the column headers is a little odd because of the spaces and parentheses. Those will have to be fixed.

# 8. Select a few key columns, make a vector of the column names

TurningPoint <- .

# 9. Create a new data.frame with just that subset of columns
#    from #7
#    - do this in at least TWO different ways


# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from #8


# 11. Create a new data.frame that is a random sample of half of the rows.


# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test for that comparison
#     - decide whether you need a non-default test
#       (e.g., Student's, paired)
#     - run the t.test with BOTH the formula and "vector"
#       formats, if possible
#     - if one is NOT possible, say why you can't do it


# 13. Repeat #10 for TWO more comparisons
#     - ALTERNATIVELY, if correlations are more interesting,
#       do those instead of t-tests (and try both Spearman and
#       Pearson correlations)


# 14. Save all results from #12 and #13 in an .RData file


# 15. Email me your version of this script, PLUS the .RData
#     file from #14
