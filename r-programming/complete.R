complete <- function(directory, id = 1:332) {
    nobs <- c()
    for (oneid in id) {
        alldata <- readdata(directory, oneid);
        completedata <- na.omit(alldata)
        ngoods <- nrow(completedata)
        nobs = append(nobs, ngoods)
    }
    result <- cbind(id, nobs)
    colnames(result) <- c("id", "nobs")
    rownames(result) <- 1:length(id)
    result
}

callcomplete <- function(id) {
    directory <- "/Users/heldergeraldoribeiro/Documents/Data-Science/specdata/"
    complete(directory, id)
}

readdata <- function(directoryname, id) {
    filename <- sprintf("%s%03d.csv", directoryname, id)
    read.csv(filename)
}