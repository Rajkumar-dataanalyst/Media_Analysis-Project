drop database linkedin;
create database linkedin;
use linkedin;
drop table linkedin_data;
create table linkedin_data(
    Post_Date DATE,
    Month VARCHAR(10),
    Year INT,
    PostDescription TEXT,
    PostTopic VARCHAR(100),
    Comments INT,
    Followers INT,
    Reactions INT,
    Reposts INT,
    Views INT,
    Engagement_Rate FLOAT,
    Day_Of_Week VARCHAR(15),
    Weekend VARCHAR(10),
    PostLength INT
);
select * from linkedin.linkedin_data; 
select PostDescription from linkedin_data;
-- Total Views and Reactions
SELECT SUM(Views) AS Total_Views,
SUM(Reactions) AS Total_Reactions
FROM linkedin_data;
select Posttopic from linkedin_data;
-- Average Engagement Rate by Post Topic
SELECT PostTopic,
ROUND(AVG(Engagement_Rate), 2) AS Avg_Engagement_Rate
FROM linkedin_data
GROUP BY PostTopic;

-- Posts with Highest Engagement Rate
SELECT PostDescription,Engagement_Rate
FROM linkedin_data
ORDER BY Engagement_Rate DESC
LIMIT 5; -- Top 5 posts based on engagement rate

-- Count of Posts by Day of the Week
SELECT Day_Of_Week,
COUNT(*) AS Number_of_Posts
FROM linkedin_data
GROUP BY Day_Of_Week;

-- Weekend vs Weekday Post Performance (Average Views)
SELECT Weekend,ROUND(AVG(Views), 0) AS Avg_Views
FROM linkedin_data
GROUP BY Weekend;

-- Monthly Views Trend
SELECT Month,
SUM(Views) AS Monthly_Views
FROM linkedin_data
GROUP BY Month
ORDER BY FIELD(Month, 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
                       'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');



