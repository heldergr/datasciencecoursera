corr <- function(directory, threshold = 0) {
    a <- numeric()
    ff <- list.files(directory)
    for (f in ff) {
        alldata <- read.csv(paste(directory, "/", f, sep = ""))
        completedata <- na.omit(alldata)
        if (nrow(completedata) > threshold) {
            sulfate <- completedata[, "sulfate"]    
            nitrate <- completedata[, "nitrate"]
            a <- append(a, cor(sulfate, nitrate))
        }
    }
    a
}

callcorr <- function(threshold) {
    directory <- "/Users/heldergeraldoribeiro/Documents/Data-Science/specdata/"
    corr(directory, threshold)
}