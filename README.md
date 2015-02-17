# Leada-R-Project-3-Delayed-Flights
This problem set features data from the United States Department of Transportation on Airline On-Time Statistics and Delay Causes.

####Problem 1: Find the IATA code that is in the Origin column, but is NOT is the Dest column.

####Problem 2:  Which airport, as defined by the IATA code, has at least 10,000 flights and had the lowest probability for a delayed flight in the data?
Define a delay as:
If ArrDelay > 0, then count as a delayed flight to Origin airport.
If DepDelay > 0, then count as a delayed flight to Dest airport.
Total delayed flights equals the sum of the two above.
Probability of delay equals total delayed flights divided by total flights (Origin & Dest) that go through that airport.

####Problem 3: Create a spreadsheet of data which calculates the historical probability of flight delay in each of the twenty carriers based off of two characteristics.
DayofWeek - Weekday (1,2,3,4,5) or Weekend (6,7)
DepTime - Day Time (0501 to 1700), Night Time (1701 to 2400), or Red Eye (0000 to 0500)
UniqueCarrier - Carrier (20)
For example, for an AA day time flight on the weekday, the percentage of delayed flights was ~29.3%.

###ANSWERS (see R file for details):

1. ####OGD is in Dest column, but not in Origin (I think question was misphrased)

2. ####DCA, with a 34.8% chance of a delay is the Airport with the lowest chance of a delayed flight.
A little bit of googling, shows that DCA is Ronald Reagan Washington National Airport in Arlington, VA
I don't think it is a coincidence that the White House and the United States Capital are miles away! (of course additional
analysis would be needed to draw any further conclusions)

3. ####See Excel spreadsheet for final output and R file for data munging. 
