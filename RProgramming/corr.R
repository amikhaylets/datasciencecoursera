setwd("C:/Users/Aleksandr/datasciencecoursera/Rprogramming")

corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    if(grep("specdata", directory) == 1) {
        directory <- ("./specdata/")
    }
    
    # get the complete table
    complete_table <- complete("specdata", 1:332)
    nobs <- complete_table$nobs
    
    # find the valid ids
    ids <- complete_table$id[nobs > threshold]
    
    # get the length of ids vector
    id_len <- length(ids)
    corr_vector <- rep(0, id_len)
    
    # find all files in the specdata folder
    all_files <- as.character(list.files(directory))
    file_paths <- paste(directory, all_files, sep="")
    
    count <- 1
    for(i in ids) {
        file <- read.csv(file_paths[i], header=TRUE, sep=",")
        corr_vector[count] <- cor(file$sulfate, file$nitrate, use="complete.obs")
        count <- count + 1
    }
    result <- corr_vector
    return(result)   
}