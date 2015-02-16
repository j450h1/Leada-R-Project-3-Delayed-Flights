df <- read.csv(bzfile("2008.csv.bz2"))
df <- df[1:1000000,] #This takes longer than just including number of rows

#Problem 1: Find the IATA code that is in the Origin column, but is NOT is the Dest column.

#Find unique values for each column
a<- as.character(unique(df$Origin))
b<-as.character(unique(df$Dest))
length(a)
length(b)
z<-setdiff(b,a)
print(z)
#"OGD" is in Dest column, but not in Origin (I think question was misphrased)
#To check our answer
"OGD" %in% df$Origin
"OGD" %in% df$Dest

#Problem 2: Which airport, as defined by the IATA code, has at least 10,000 flights and had the lowest probability
#for a delayed flight in the data? Define a delay as: If ArrDelay > 0, then count as a delayed flight to Origin 
# airport. If DepDelay > 0, then count as a delayed flight to Dest airport. Total delayed flights equals the sum 
#of the two above. Probability of delay equals total delayed flights divided by total flights (Origin & Dest) that 
#go through that airport.

#Assumption: The 10,000 flights are 10,000 from Origin and we will disregard Dest for that number
#Let's create a new data frame with the 286 airports that are in both

df2 <- as.data.frame(table(df$Origin))
View(df2)

tbO[]



View(df)



Problem 3: Create a spreadsheet of data which calculates the historical probability of flight delay in each of the twenty carriers based off of two characteristics. DayofWeek - Weekday (1,2,3,4,5) or Weekend (6,7) DepTime - Day Time (0501 to 1700), Night Time (1701 to 2400), or Red Eye (0000 to 0500) UniqueCarrier - Carrier (20) For example, for an AA day time flight on the weekday, the percentage of delayed flights was ~29.3%.



install.packages("comparelists")


str(df)
summary(df)

#Problem 1: Find the IATA code that is in the Origin column, but is NOT is the Dest column.

tail(df$Origin)
#Create a new column to check if the IATA code from Origin column is in Dest Column

length(df$Origin %in% df$Dest)


"SLC" %in% df$Dest

length(unique(df$Origin))
length(unique(df$Dest))

nrow(df)

length(df$OriginInDest[df$OriginInDest==FALSE])

head(df$Origin)
df$Origin[df]

paste(df$Dest, collapse=",")

str(df)

summary(df)
