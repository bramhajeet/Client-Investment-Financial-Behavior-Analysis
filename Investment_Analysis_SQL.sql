CREATE DATABASE investment_analysis;
DROP DATABASE investment_analysis;
USE investment_analysis;
SELECT * FROM clients;
SELECT COUNT(*) FROM clients;
SELECT COUNT(*) FROM monthly_investments;
SELECT COUNT(*) FROM `monthly investments`;
RENAME TABLE `monthly investments` TO monthly_investments;

1. Total Investment by State
SELECT
    State,
    SUM(Investment_Amount) AS Total_Investment
FROM monthly_investments
GROUP BY State
ORDER BY Total_Investment DESC;

2. Top 10 Cities by Investment
SELECT
    City,
    SUM(Investment_Amount) AS Total_Investment
FROM monthly_investments
GROUP BY City
ORDER BY Total_Investment DESC
LIMIT 10;

3.Highest Investment Month
SELECT
    Month,
    SUM(Investment_Amount) AS Total_Investment
FROM monthly_investments
GROUP BY Month
ORDER BY Total_Investment DESC
LIMIT 1;

4. Average Investment by Income Group
SELECT
    CASE
        WHEN c.Annual_Income < 500000 THEN 'Low'
        WHEN c.Annual_Income < 1000000 THEN 'Medium'
        ELSE 'High'
    END AS Income_Group,
    AVG(i.Annual_Investment) AS Avg_Investment
FROM clients c
JOIN (
    SELECT
        Client_ID,
        SUM(Investment_Amount) AS Annual_Investment
    FROM monthly_investments
    GROUP BY Client_ID
) i
ON c.Client_ID = i.Client_ID
GROUP BY Income_Group
ORDER BY Avg_Investment DESC;

5. Loan vs Investment
SELECT
    c.Has_Loan,
    AVG(i.Annual_Investment) AS Avg_Investment
FROM clients c
JOIN (
    SELECT
        Client_ID,
        SUM(Investment_Amount) AS Annual_Investment
    FROM monthly_investments
    GROUP BY Client_ID
) i
ON c.Client_ID = i.Client_ID
GROUP BY c.Has_Loan;

6. Top 10 Clients
SELECT
    c.Client_ID,
    c.Client_Name,
    SUM(i.Investment_Amount) AS Annual_Investment
FROM clients c
JOIN monthly_investments i
    ON c.Client_ID = i.Client_ID
GROUP BY c.Client_ID, c.Client_Name
ORDER BY Annual_Investment DESC
LIMIT 10;

7. State Ranking
SELECT
    c.State,
    AVG(i.Annual_Investment) AS Avg_Investment_Per_Client,
    RANK() OVER (ORDER BY AVG(i.Annual_Investment) DESC) AS State_Rank
FROM clients c
JOIN (
    SELECT Client_ID, SUM(Investment_Amount) AS Annual_Investment
    FROM monthly_investments
    GROUP BY Client_ID
) i
ON c.Client_ID = i.Client_ID
GROUP BY c.State
ORDER BY State_Rank;

8. Month-over-Month Growth
WITH monthly_totals AS (
    SELECT
        Month,
        SUM(Investment_Amount) AS Total_Investment
    FROM monthly_investments
    GROUP BY Month
)
SELECT
    Month,
    Total_Investment,
    LAG(Total_Investment) OVER (ORDER BY Month) AS Previous_Month,
    ROUND(
        (Total_Investment - LAG(Total_Investment) OVER (ORDER BY Month))
        / LAG(Total_Investment) OVER (ORDER BY Month) * 100,
        2
    ) AS MoM_Growth_Percent
FROM monthly_totals
ORDER BY Month;

9. Highest Investing Client by City
WITH client_investments AS (
    SELECT
        c.Client_ID,
        c.Client_Name,
        c.City,
        SUM(i.Investment_Amount) AS Annual_Investment
    FROM clients c
    JOIN monthly_investments i
        ON c.Client_ID = i.Client_ID
    GROUP BY c.Client_ID, c.Client_Name, c.City
),
ranked_clients AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY City
            ORDER BY Annual_Investment DESC
        ) AS City_Rank
    FROM client_investments
)
SELECT
    City,
    Client_ID,
    Client_Name,
    Annual_Investment
FROM ranked_clients
WHERE City_Rank = 1
ORDER BY Annual_Investment DESC;

10. Client Segmentation
WITH client_investments AS (
    SELECT
        c.Client_ID,
        c.Client_Name,
        c.Age,
        c.Annual_Income,
        c.Net_Worth,
        c.Has_Loan,
        SUM(i.Investment_Amount) AS Annual_Investment
    FROM clients c
    JOIN monthly_investments i
        ON c.Client_ID = i.Client_ID
    GROUP BY
        c.Client_ID,
        c.Client_Name,
        c.Age,
        c.Annual_Income,
        c.Net_Worth,
        c.Has_Loan
),
segmented_clients AS (
    SELECT *,
        CASE
            WHEN Annual_Investment < 150000 THEN 'Low'
            WHEN Annual_Investment < 350000 THEN 'Medium'
            ELSE 'High'
        END AS Investment_Group
    FROM client_investments
)
SELECT
    Investment_Group,
    COUNT(*) AS Number_of_Clients,
    ROUND(AVG(Annual_Investment), 2) AS Avg_Annual_Investment,
    ROUND(AVG(Annual_Income), 2) AS Avg_Annual_Income,
    ROUND(AVG(Net_Worth), 2) AS Avg_Net_Worth,
    ROUND(AVG(Age), 1) AS Avg_Age
FROM segmented_clients
GROUP BY Investment_Group
ORDER BY Avg_Annual_Investment DESC;