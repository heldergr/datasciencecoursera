getpollutantvalues <- function(directoryname, pollutantname, oneid) {
    filename <- sprintf("%s%03d.csv", directoryname, oneid)
    alldata <- read.csv(filename)
    pollutantidallvalues <- alldata[, pollutantname]
    pollutantbadvalues <- is.na(pollutantidallvalues)
    pollutantidgoodvalues <- pollutantidallvalues[!pollutantbadvalues]
    pollutantidgoodvalues
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
    pollutantname <- pollutant[1]
    directoryname <- directory[1]
    pollutantvalues = c();  
    
    for (oneid in id) {
        pollutantidgoodvalues <- getpollutantvalues(directoryname, pollutantname, oneid)
        pollutantvalues = append(pollutantvalues, pollutantidgoodvalues)
    }
    
    pollutantvalues
}
