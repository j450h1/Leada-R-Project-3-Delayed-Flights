#Read in the 1st million rows of data only
df <- read.csv(bzfile("2008.csv.bz2"), nrow = 1000000)

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
#----------------------------------------------------------------------------------

#Problem 2: Which airport, as defined by the IATA code, has at least 10,000 flights and had the lowest probability
#for a delayed flight in the data? Define a delay as: If ArrDelay > 0, then count as a delayed flight to Origin 
# airport. If DepDelay > 0, then count as a delayed flight to Dest airport. Total delayed flights equals the sum 
#of the two above. Probability of delay equals total delayed flights divided by total flights (Origin & Dest) that 
#go through that airport.

#Let's create a new data frame with the 286 airports that are in both

#Let's count how many flights to and create a new dataframe.
dfO <- as.data.frame(table(df$Origin))
dfD <- as.data.frame(table(df$Dest))
df2 <- merge(dfO, dfD, by = "Var1")

#Now let's subset it a bit further to find the flights with at least 10,000 flights
df2 <- subset(df2, Freq.x >= 10000 & Freq.y >= 10000)
nrow(df2) #28 Airports have at least 10,000 Origin AND Destination Flights, about 10% of Airports
View(df2)

#Let's create dataframes to count how many delays per Origin and Destination and merge them with new df we created
#Origin first
dfOD <- as.data.frame(table(df$Origin[df$ArrDelay > 0]))
df2 <- merge(df2, dfOD, by="Var1")
#Destination second
dfDD <- as.data.frame(table(df$Dest[df$DepDelay > 0]))
df2 <- merge(df2, dfDD, by="Var1")
#Create descriptive column names
names(df2) <- c("Airport", "NumOriginFlights", "NumDepartFlights", "NumDelaysOrigin", "NumDelaysDepart")
#Create the final 3 variables
df2$TotalDelays <- df2$NumDelaysOrigin + df2$NumDelaysDepart
df2$TotalFlights <- df2$NumOriginFlights + df2$NumDepartFlights
df2$ProbDelay <- df2$TotalDelays/df2$TotalFlights

#Finally sort by ProbDelay, ascending
df2 <- df2[order(df2$ProbDelay),]
df2$Airport[1] #DCA
df2$ProbDelay[1] #0.3478391

#FINAL ANSWER: DCA, with a 34.8% chance of a delay is the Airport with the lowest chance of a delayed flight.

#A little bit of googling, shows that DCA is Ronald Reagan Washington National Airport in Arlington, VA
#I don't think it is a coincidence that the White House and the United States Capital are miles away! (of cours additionalt
#analysis would be needed to draw any further conclusions)
#-----------------------------------------------------------------------------------------------------------------

#Problem 3: Create a spreadsheet of data which calculates the historical probability of flight delay in each 
#of the twenty carriers based off of two characteristics. DayofWeek - Weekday (1,2,3,4,5) or Weekend (6,7) 
#DepTime - Day Time (0501 to 1700), Night Time (1701 to 2400), or Red Eye (0000 to 0500) UniqueCarrier - Carrier (20)
#For example, for an AA day time flight on the weekday, the percentage of delayed flights was ~29.3%.




