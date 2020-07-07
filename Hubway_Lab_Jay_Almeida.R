# Import Hubway Data
stations <- read.csv("Stack/hubway_stations.csv")
trips <- read.csv("Stack/hubway_trips.csv")

# 1.	What are the column names? 
colnames(stations)
colnames(trips)

#	How many stations are there? 
length(unique(stations$station))

#3. Remove Duplicates How many are left?
stations_ex<- stations[stations$status == "Existing",]

#Section B
# 1.	This file is quite large. (And we've already removed move than 75% of the data!) How many rows and columns does it have
view(trips)  
# There are 13 columns, and 350,615 Rows #ncol(trips) is better.tab

#2. How many unique user zip codes are in this dataset?
length(unique(trips$zip_code))
# There are 375 unique zip codes

#3. How many unique bicycles are in this dataset?
length(unique(trips$bike_nr))
# There are 882 unique bicycles

#4. Calculate the count of rides for each unique bicycle. 
table(trips$bike_nr)

bike_rides <- as.data.frame(table(trips$bike_nr))

#5 Which bicycle is ridden most frequently? 
#max(trips$bike_nr) #T04150
#which.max(trips$bike_nr)

bike_rides[which.max(bike_rides$Freq), 1]
#B00401 is the bike ridden most frequently 

# 6. Which bicycle is ridden least frequently?
# Therefore T01093 is ridden least frequently 
bike_rides[which.min(bike_rides$Freq),1]

# 7. Calculate the total duration of all rides for each bicycle. Hint: tapply() or aggregate()
total_duration <- aggregate(trips$duration, by = list(trips$bike_nr), FUN = sum)

#8. Which bicycle has been ridden for the longest total duration in this dataset? Shortest total duration?
total_duration[which.min(total_duration$x),1] 
# Therefore "T01380" has the shortest duration
total_duration[which.max(total_duration$x),1]
#Therefore "B00585" has the longest total duration


#9. Consider only trips on the bicycle that has been ridden for the longest duration, which station is its most frequent end station? Which station is its most frequent start station? Return the station ids.
# "B00585" is the longest duration from above. Station 22 is the most frequent end station and also the most frequent start station.
max_tripsby <- subset(trips,bike_nr == "B00585")
maxtrips_table <- table(max_tripsby$end_statn)
which.max(maxtrips_table)

min_tripsby <- subset(trips,bike_nr == "B00585")
mintrips_table <- table(min_tripsby$strt_statn)
which.max(mintrips_table)

#10. Look up the name of the above station ids in the stations data frame. What are the names of the most frequent start and end stations for this bicycle?
# The most frequent stations for ending and starting is South Station Boston, MA

stations <- read.csv("Stack/hubway_stations.csv")
stationssub = subset(stations, id == "22")
stationssub

#1. Use merge (twice) to append the appropriate station names to the trips data frame. Add a column for the starting station and the ending station. See ?merge.
merge


#Look at the summary of this new data frame. Are all of the stations "existing"? Why is that? Did you merge using your hubway station data frame with only existing stations? Or the data frame with all stations?  Remove all trips to or from a "removed" station if necessary.




#2. Use names() or colnames() to clean up the column names in the merged data frame.
