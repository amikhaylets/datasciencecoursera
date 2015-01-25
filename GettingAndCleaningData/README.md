GettingAndCleaningDataCourseProject
========================================
Description of the run_analysis.R script work flow.

1.  Unzip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and put it into the folder called "data".
2.  Put run_analysis.R script in the same directory with "data"
3.  Run run_analysis.R 
4.  Third, you will find two output files are generated in the current working directory:
* merged_data.txt
* data_with_means.txt

5.  Use data <- read.table("data_with_means.txt") command to read the file. 
