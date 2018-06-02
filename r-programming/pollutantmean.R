readdata <- function(directoryname, id) {
    filename <- sprintf("%s%03d.csv", directoryname, id)
    read.csv(filename)
}

getpollutantvalues <- function(directoryname, pollutantname, oneid) {
    alldata <- readdata(directoryname, oneid)
    pollutantidallvalues <- alldata[, pollutantname]
    pollutantbadvalues <- is.na(pollutantidallvalues)
    pollutantidgoodvalues <- pollutantidallvalues[!pollutantbadvalues]
    pollutantidgoodvalues
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
    pollutantvalues = c();  
    
    for (oneid in id) {
        pollutantidgoodvalues <- getpollutantvalues(directory, pollutant, oneid)
        pollutantvalues = append(pollutantvalues, pollutantidgoodvalues)
    }
    
    mean(pollutantvalues)
}

callit <- function(ids) {
    print(pollutantmean("/Users/heldergeraldoribeiro/Documents/Data-Science/specdata/", "sulfate", 1:10))
    print(pollutantmean("/Users/heldergeraldoribeiro/Documents/Data-Science/specdata/", "nitrate", 70:72))
    print(pollutantmean("/Users/heldergeraldoribeiro/Documents/Data-Science/specdata/", "nitrate", 23))
}