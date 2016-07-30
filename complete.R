complete <- function(directory, id = 1:332) {
    
    directory <- "C:/Users/Hai Pham/Desktop/Coursera/specdata"
    files_full <- list.files(directory, full.names = TRUE) 
    
    dat <- data.frame()
    nobs = numeric()
    
    for (i in id) {
        newRead <- read.csv(files_full[i])
        ## read each CSV file
        
        nobs <- sum(complete.cases(newRead))
        ## sum all complete cases, note: NA case are removed automatically
        
        tmp <- data.frame(i, nobs)
        ## create a temporary vector
        
        dat <- rbind(dat, tmp)
        ## rbind temporary vector to original data.frame
    }
    
    colnames(dat) <- c("id", "nobs")
    ## set the row or column names of a matrix-like object.
    dat
}

