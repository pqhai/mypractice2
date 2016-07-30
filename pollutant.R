pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    directory <- "C:/Users/Hai Pham/Desktop/Coursera/specdata"
   
    files_full <- list.files(directory, full.names = TRUE) 
    
    dat <- data.frame()
    
    for (i in id) {
        dat <- rbind(dat, read.csv(files_full[i]))
    }
    
    mean(dat[, pollutant], na.rm = TRUE)
}
