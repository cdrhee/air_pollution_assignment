corr <- function(directory, threshold = 0) {
        
        ## Determines number of complete rows for directory
        complete.monitors <- complete (directory)
        
        ## Determines monitors that meet the threshold requirement in a data
        ## frame with ids & nobs as a result
        above <- complete.monitors$nobs > threshold
        monitors.above <- complete.monitors[above, ] 

        ## Create empty vector for correlation values
        correlations <- c()
        
        ## Builds a list of all CSV within 'directory'
        files_list <- list.files(directory, full.names=TRUE) 

        ## Vector of good monitors' ids
        ids.above <- monitors.above[,1]
        
        ## For each good monitor, run corr
        ## cor(x, y = NULL, use = "everything",
        ##      method = c("pearson", "kendall", "spearman"))
        ## use = "complete.obs" removes NAs
        for (i in ids.above) {
                id.data <- read.csv(files_list [i])
                id.cor <- cor(id.data$sulfate, id.data$nitrate, use = "complete.obs")
                correlations <- append(correlations, id.cor)
        }
        return(correlations)
}