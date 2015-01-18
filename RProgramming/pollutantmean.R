setwd("C:/Users/Aleksandr/datasciencecoursera/Rprogramming")

pollutantmean <- function(directory, pollutant = "nitrate", id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    if(grep("specdata", directory) == 1) {
        directory <- ("./specdata/")
    }
    
    mean_data <- c()

    all_files <- as.character(list.files(directory))
    file_paths <- paste(directory, all_files, sep="")
    
    for(i in id) {
        file <- read.csv(file_paths[i], header=TRUE, sep=",")
        na_removed <- file[!is.na(file[, pollutant]), pollutant]
        mean_data <- c(mean_data, na_removed)
    }
    
    return(round(mean(mean_data), 3)) 
}

pollutantmean("specdata", "sulfate", 1:10) 
pollutantmean("specdata", "nitrate", 70:72) 
pollutantmean("specdata", "nitrate", 23)