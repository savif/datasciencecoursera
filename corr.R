corr <- function(directory, threshold = 0) {
        F_list<- list.files(path = "specdata", pattern = ".csv", full.names = TRUE)
        cr <- numeric()
        
        for (i in seq(F_list)){
                data <- read.csv(F_list[i])
                good <- complete.cases(data)
                data <-data[good, ]
                if (nrow(data)>threshold){
                        data_cor <- cor(data[["sulfate"]], data[["nitrate"]])
                        cr <- append(cr, data_cor)
                }
        }
        cr
}