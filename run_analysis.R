# Key Assumptions:
    # 1). The file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
    #     has been unzipped and the resulting folder set as your working directory. 
    # 2). The 3 R script files [create_tidy.R, create_sec5.R, and run_analysis.R] have been placed inside your
    #     working directory.
    # 3). Replace the directory argument on line 13 below to the full path of your working directory.
 

source("create_tidy.R")
source("create_sec5.R")

# Corresponds to Questions 1-4 #
tidy <- create_tidy(directory) # <- example: "~/Documents/UCI HAR Dataset"

# Corresponds to Question 5 #
final <- finalData() # <- no arguments needed