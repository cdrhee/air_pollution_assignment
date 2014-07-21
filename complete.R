complete <- function(directory, id = 1:332) {
        
        ## Builds a list of all CSV within 'directory'
        files_list <- list.files(directory, full.names=TRUE)  
        
        ## Creates empty data frame for results
        total_nobs <- data.frame()
        for (i in id) {
                ## Reads each applicable CSV
                id.dat <- read.csv(files_list [i])
                
                ## Removes NAs and adds complete case rows
                nobs <- sum(complete.cases (id.dat))
                
                ## Creates a single row data frame of obs for single CSV
                id.nobs <- data.frame (i, nobs)
                
                ## Adds individual results into a data frame 
                total_nobs <- rbind (total_nobs, id.nobs)
        }
        ## Renames columns to "id" and "nobs"
        colnames(total_nobs) <- c("id","nobs")
        
        ## Prints total_nobs
        return (total_nobs)
}        