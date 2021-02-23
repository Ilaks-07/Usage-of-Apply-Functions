

getwd()
setwd("C:\\Users\\user\\Documents\\R\\practice exercise\\R-advanced\\Weather Data")
chicago <- read.csv("Chicago-F.csv", row.names=1)
NewYork<- read.csv("NewYork-F.csv", row.names=1)
Houston<- read.csv("Houston-F.csv", row.names=1)
SanFrancisco<- read.csv("SanFrancisco-F.csv", row.names=1)

#Checking
chicago
NewYork
Houston
SanFrancisco

#Converting to matrix
chicago <- as.matrix(chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

#Adding to a list
weather <- list(Chicago=chicago,NewYork=NewYork, Houston=Houston, SanFrancisco=SanFrancisco)
weather

#Finding average of every city
apply(chicago, 1, mean)
apply(NewYork, 1, mean)
apply(Houston, 1, mean)
apply(SanFrancisco, 1, mean)

#lapply
lapply(weather, rowMeans) #to find the average of each row
lapply(weather, "[" , 1,1) #or weather[[1]][1]

#Temperature flunctuation each month from  min to max
lapply(weather, function(z) round((z[1,]-z[2,])/z[2,],2))


#sapply-converts as a vector or matrix
sapply(weather, "[", 1, 7)
round(sapply(weather, rowMeans),2)   #matrix
sapply(weather, function(z) round((z[1,]-z[2,])/z[2,],2))


#Annual maximums of each observed metric for every city
sapply(weather, apply, 1, max)

#Annual minimums of each observed metric for every city
sapply(weather, apply, 1, min)


#which.max
which.max(chicago[1,])
names(which.max(chicago[1,]))

#Month in which annual maximums of each metric were observed in every city
sapply(weather, function(y) apply(y, 1, function(x) names(which.max(x))))







