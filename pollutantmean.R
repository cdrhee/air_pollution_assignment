pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## Builds a list of all CSV within 'directory'
        files_list <- list.files(directory, full.names=TRUE) 
        
        ## Builds a blank data frame
        dat <- data.frame()
        
        ## For 'id' builds a data frame of applicable CSVs
        for (i in id) {
                dat <- rbind(dat, read.csv(files_list[i]))
        }
        
        ## Subsets data frame specific to 'pollutant'
        dat.pollutant <- dat[ ,pollutant]
        
        ## Mean of all values specific to 'pollutant' removing NAs
        mean(dat.pollutant, na.rm=TRUE)
}
