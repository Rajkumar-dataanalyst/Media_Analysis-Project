create database facebook_data;
use facebook_data;
drop table facebook_data_cleaned;
create table facebook_data_cleaned (
    Ad_Name VARCHAR(100),
    Ad_Set_Name VARCHAR(100),
    Age_Group VARCHAR(20),
    Campaign_Name VARCHAR(100),
    Gender VARCHAR(10),
    Report_Date DATE,
    Day VARCHAR(15),
    Month VARCHAR(10),
    Year INT,
    Total_Website_Purchases_Value_Expression FLOAT,
    Avg_Purchase_Value FLOAT,
    Cost FLOAT,
    Cost_per_People_Reached FLOAT,
    CPA_Cost_per_Action FLOAT,
    Cost_per_Click FLOAT,
    Cost_per_Lead FLOAT,
    Frequency FLOAT,
    Impressions INT,
    Indicator FLOAT,
    Link_Clicks INT,
    LTR_Lead_Through_Rate FLOAT,
    Page_Likes INT,
    Post_Comments INT,
    Post_Reactions INT,
    Reach INT,
    TotalCost INT,
    Total_Margin INT,
    Total_Post_Shares INT,
    Total_Social_Interactions INT,
    Website_Leads INT,
    Website_Purchases INT,
    Click_Through_Rate FLOAT,
    Conversion_Rate FLOAT,
    Return_On_AdSpend FLOAT,
    DayOfWeek VARCHAR(15)
);
select * from facebook_data.facebook_data_cleaned;
select Age_group from facebook_data_cleaned;
-- Total Spend by Campaign
SELECT Campaign_Name, SUM(TotalCost) AS Total_Spend
FROM facebook_data_cleaned
GROUP BY Campaign_Name
ORDER BY Total_Spend DESC;

-- Click-Through Rate (CTR) by Ad
SELECT Ad_Name, AVG(Click_Through_Rate) AS Avg_CTR
FROM facebook_data_cleaned
GROUP BY Ad_Name
ORDER BY Avg_CTR DESC;

--  Total Website Purchases by Age Group and Gender
SELECT Age_Group, Gender, SUM(Website_Purchases) AS Total_Purchases
FROM facebook_data_cleaned
GROUP BY Age_Group, Gender
ORDER BY Total_Purchases DESC;

--  Conversion Rate by Ad Set
SELECT Ad_Set_Name, AVG(Conversion_Rate) AS Avg_Conversion_Rate
FROM facebook_data_cleaned
GROUP BY Ad_Set_Name
ORDER BY Avg_Conversion_Rate DESC;

-- Return on Ad Spend (ROAS) by Campaign
SELECT Campaign_Name, AVG(Return_On_AdSpend) AS Avg_ROAS
FROM facebook_data_cleaned
GROUP BY Campaign_Name
ORDER BY Avg_ROAS DESC;

-- Daily Spend and Website Purchases Over Time
SELECT Report_Date, SUM(TotalCost) AS Daily_Spend, SUM(Website_Purchases) AS Daily_Purchases
FROM facebook_data_cleaned
GROUP BY Report_Date
ORDER BY Report_Date;


