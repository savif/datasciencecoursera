list.files("specdata")
spec1 <- read.csv("specdata/001.csv")
head(spec1)
length(spec1$nitrate)
dim(spec1)              ##studying the data frame, how many columns and rows
str(spec1)              ##useful because dimensions of the dataframe should be the same for all files
summary(spec1)
names(spec1)
print(R.version.string)         ##Checking the version of R - must be latest version
pollutantmean <- function(directory, pollutant, id = 1:332){
        Flist<-list.files(path = directory, pattern = ".csv", full.names = TRUE)
        values <-numeric()      ##creating an empty vector ##going through all files
        for (i in id){
                data<-read.csv(Flist[i])
                values <-c(values, data[[pollutant]])
        }
        mean(values, na.rm = TRUE)
}
#pollutantmean("/users/ChessTastic/Dropbox/github/coursera/R_programming/week_2/specdata/", "sulfate")
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)