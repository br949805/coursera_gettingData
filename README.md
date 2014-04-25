Please see original_README.txt for information regarding data collection.

Data Treatment:

The original data obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  has been merged to obtain a single dataset consisting of subjects (referred to in the data as ID), their activities, and the movement data points collected by the research team. The original data set has been limited to only those variable ending in either mean(), mean()-x/y/z or std(), std()-x/y/z in order to facilitate analysis on those variables. The results of these transformations can be found in the dataset labeled "tidy" created by utilizing the function found in the tidy.R script.

The "tidy" dataset is then used as input to calculate means for all measurement datapoints by subject and activity. The results of these calculations can be found in the dataset labeled "final" created by utilizing the final() function found in the sec5.R script.

Both of these functions can be easily accessed through the run_analysis.R script included in this repository.


Key Assumptions when using the run_anaylsis script:
    1). The file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
        has been unzipped and the resulting folder set as your working directory. 
    2). The 3 R script files [create_tidy.R, create_sec5.R, and run_analysis.R] have been placed inside your
        working directory.
    3). Replace the directory argument of the tidy() function to the full path of your working directory.
