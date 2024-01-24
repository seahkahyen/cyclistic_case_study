# Cyclistic Case Study
Case study from Google Data Analytics on Coursera

BACKGROUND: The analysis is based on the first case study of the Google Data Analytics Certificate. The aim of the analysis is to understand how casual riders and annual members use Cyclistic bikes differently. Analyzing the behaviors between the two would create insights on how to design a new marketing strategy to convert casual riders into annual members.

The data will be cleaned and analyzed using SQL, Python (Pandas) and Power BI and will follow Google’s six-step process of processing data: ask, prepare, clean and process, analyze, share, and act.

# Ask

In this phase, it is important to understand what are the major questions that drive the analysis. Given that the company has a problem with increasing its membership numbers and it has data about its users, we should tackle on “How do annual members and casual riders use Cyclistic bikes differently?”

# Prepare

The data that I collected from is from [here](https://divvy-tripdata.s3.amazonaws.com/index.html). 

For data analysis using SQL, I collected only the November and December data in 2023 due to limits from BigQuery. Then I combined the data into one table using SQL.

Using Python, I collected the second half of the year in 2023. Then I also combined the data into one table using Python.

# Clean and Process

To ensure data integrity in both tables created respectively using SQL and Python, I removed rows with null values and duplicates. 

I also included data that have a valid time length (more than 1 minute and less than 24 hours)

For easier analysis of my data, I appended the tables with new columns; Start time, Ride Length, Day of the Week, Day, Month and Year, each columns per Ride ID

# Analyze

For the analysis part, I calculated the following in both Python and SQL:

1. Average, Minimum and Maximum of the length of ride
2. Greatest number of riders in which days in a week for casual and member riders.
3. Popular start hours for casual and member riders.
4. Popular start and end stations for casual and member riders.
5. Popular routes for casual and member riders.

# Share

Using Power BI for my data visualisation, I have created different graphs for different visualisations to analyze data on both casual and member riders in November and December.
 
# Act 

These are my key takeaways for casual members : 

1. Both casual riders and member riders prefer electronic bikes over classic bikes
2. Both casual riders and member riders usually ride a bike at about 4 to 5 pm.
3. Casual riders usually ride on a Saturday, while member riders usually ride on either Thursday or Friday.
4. Casual riders usually ride for an average of 17 minutes, while member riders usually ride for an average of 11 minutes.

Recommendations based on analysis: 
1. Engaging in Social Media Campaigns

Develop engaging content on platforms like Instagram, Facebook, and Twitter showcasing the convenience and fun of using electronic bikes.
Highlight the benefits of membership, such as exclusive discounts, priority access to bikes, or special events for members.
Run targeted ads to reach users in Chicago, especially around metro stations and during the preferred riding time of 4PM on Saturdays.

2. Interactive Apps and Rewards:

Develop a mobile app that allows users to easily locate, unlock, and pay for electronic bikes.
Integrate a rewards program within the app, providing incentives for frequent riders and members.

