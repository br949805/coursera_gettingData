# Section 5: Creates a second, independent tidy data set with the average of each
# variable for each activity and each subject.


finalData <- function() {
## Subset based on tidy$id in loop for all id's ##
id <- 1:30
ACode <- 1:6

final <- data.frame()

for(i in id) {
  a <- subset(tidy,tidy$ID == i)
  
  ### Subset Each Activity Code based on tidy$Activity_Code ###
    for(x in ACode) {
    b <- subset(a, a$Activity_Code == x)
    
    #### Preserve Character Variables in Columns 1 and 2 ####
    h <- b[1,1:2]
    
    #### Calculate Means for Numeric Columns 3:69 ####
    z <- t(as.data.frame(colMeans(b[3:69])))
    
    #### Recombine Character variables and Numeric variables ####
    ap <- cbind(h,z)
    
    #### Append to final data frame ####
    final <- rbind(final,ap)
  }
}
return(final)
}