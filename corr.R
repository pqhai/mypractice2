corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating the location of
    ## the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the number of
    ## completely observed observations (on all variables) required to compute
    ## the correlation between nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    directory <- "C:/Users/Hai Pham/Desktop/Coursera/specdata"
    files_full <- list.files(directory, full.names = TRUE)
    
    df <- complete(directory)
    ## link to complete.R 
    
    ids <- df[df["nobs"] > threshold, ]$id
    ## only access id having "nobs" greater than threshold
    
    corrr <- numeric()
    
    for (i in ids) {
        
        newRead <- read.csv(files_full[i])
        ## read all .CSV file
        dff <- newRead[complete.cases(newRead), ]
        ## dff is a single element in "newRead". Use [] to extract a single element
        corrr <- c(corrr, cor(dff$sulfate, dff$nitrate))
        ## combine a value into a vector
        ## use function cor(x,y)
    }
    return(corrr)
}