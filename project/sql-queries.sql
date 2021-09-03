-- SQL PART [MID-PROJECT // SILVIA GONZALEZ]

-- 1) Create a database called credit_card_classification.
CREATE DATABASE credit_card_classification;
USE credit_card_classification;

-- 2) Create a table credit_card_data with the same columns as the csv file.
CREATE TABLE credit_card_data (
customer_number int,
offer_accepted varchar(255),
reward varchar(255),
mailer_type	varchar(255),
income_level varchar(255),
bank_accounts_open int,
overdraft_protection varchar(255),
credit_rating varchar(255),
credit_cards_held int,
homes_owned int,
household_size int,
own_your_home varchar(255),
average_balance	float,
q1_balance int,
q2_balance int,
q3_balance int,
q4_balance int
);

-- 3) Import the data from the csv file into the table.
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
-- I generated a copy of the csv and removed the headers, naming the csv '.SQL(NoHeaders)
-- I don't know why it didn't work:
-- BULK INSERT credit_card_data
-- FROM 'C:/Users/silvia/mid-project-classification/data/creditcardmarketing-SQL(NoHeaders).csv'
-- WITH (FORMAT = 'csv',
    -- FIRSTROW = 1,
    -- FIELDTERMINATOR = ','); 
-- But finally imported data using import wizard [data:'creditcardmarketing-SQL(NoHeaders)' ]


-- 4) Select all the data from table credit_card_data to check if the data was imported correctly.
SELECT * 
FROM credit_card_data;
-- Result: data imported correctly

-- 5.1) Use the alter table command to drop the column q4_balance from the database
ALTER TABLE credit_card_data
DROP COLUMN q4_balance;

-- 5.2) Verify if the command worked and limit results to 10.
SELECT * 
FROM credit_card_data
LIMIT 10;

-- 6) Use sql query to find how many rows of data you have.
SELECT count(*) 
FROM credit_card_data;
-- Result: 17976 rows

-- 7) Now we will try to find the unique values in some of the categorical columns:
-- 7.1) What are the unique values in the column `Offer_accepted`?
SELECT DISTINCT offer_accepted
FROM credit_card_data;
-- Output: Yes/No

-- 7.2) What are the unique values in the column `Reward`?
SELECT DISTINCT reward
FROM credit_card_data;
-- Output: Air Miles/Cash Back/Points

-- 7.3) What are the unique values in the column `mailer_type`?
SELECT DISTINCT mailer_type
FROM credit_card_data;
-- Output: Letter/Postcard

-- 7.4) What are the unique values in the column `credit_cards_held`?
SELECT DISTINCT credit_cards_held
FROM credit_card_data;
-- Output: 1/2/3/4

-- 7.5) What are the unique values in the column `household_size`?
SELECT DISTINCT household_size
FROM credit_card_data;
-- Output: From 1 to 9

-- 8) Arrange the data in a decreasing order by the average_balance of the house. Return only the customer_number of the top 10 customers with the highest average_balances in your data.
SELECT customer_number as Top10customers
FROM credit_card_data
ORDER BY average_balance DESC
LIMIT 10;

-- 9) What is the average balance of all the customers in your data?
SELECT ROUND(AVG(average_balance)) AS total_avgbalance
FROM credit_card_data; 
-- I got 940

-- Double check the if query was correct
SELECT SUM(average_balance)/COUNT(average_balance)
FROM credit_card_data; 
--  Checked, I got 940 as well

-- 10) In this exercise we will use group by to check the properties of some of the categorical variables in our data. * Average_balance = average of the column average_balance:
-- 10.1) Average balance of the customers grouped by `Income Level`. Show: income level and `Average balance`. Use alias to name the second column.
SELECT income_level, ROUND(AVG(average_balance)) AS total_avgbalance
FROM credit_card_data
GROUP BY income_level;

-- 10.2) Average balance of the customers grouped by `number_of_bank_accounts_open`. Show: `number_of_bank_accounts_open` and `Average balance`. Use alias to name the second column.
SELECT bank_accounts_open, ROUND(AVG(average_balance)) AS total_avgbalance
FROM credit_card_data
GROUP BY bank_accounts_open;

-- 10.3) Average number of credit cards held by customers for each of the credit card ratings. Show: rating and average number of credit cards held. Use alias to name the second column.
SELECT credit_rating, ROUND(AVG(credit_cards_held),2) AS avgcardsheld
FROM credit_card_data
GROUP BY credit_rating;

-- 10.4) Check correlation of `credit_cards_held` and `number_of_bank_accounts_open`. Note: Analyse grouping one variable and adding the other. See if any category is under-represented.
SELECT credit_cards_held, count(*) as totalcustomers, ROUND(AVG(bank_accounts_open),2) AS avg_accounts_open
FROM credit_card_data
GROUP BY credit_cards_held
ORDER BY credit_cards_held; 
-- I ignore 4 cards customers >> under represented (515 vs 3381 - 6147). 
-- Conclusion: No correlation between two colums (avs accounts open remain almost the same (1.25-1.26) for each #of total credit cards)

-- 11) Select from the database for management: Credit rating medium or high & Credit cards held 2 or less & Owns their own home & Household size 3 or more 
-- ALSO: Filter those who accepted the offer
SELECT * 
FROM credit_card_data
WHERE 
credit_rating = 'medium' OR  credit_rating = 'high' AND
credit_cards_held < 3 AND 
own_your_home = 'Yes' AND
household_size > 2 AND
offer_accepted = 'Yes';

-- 12) <MANAGEMENT> List customers whose avg balance is less than overall avg balance. Note: subquery
SELECT customer_number, ROUND(average_balance)
FROM credit_card_data
WHERE average_balance < (
SELECT AVG(average_balance) 
FROM credit_card_data
)
ORDER BY average_balance DESC;

-- 13) <MANAGEMENT> Create view with the below called Customers__Balance_View1
CREATE VIEW Customers__Balance_View1 AS
SELECT customer_number, ROUND(average_balance)
FROM credit_card_data
WHERE average_balance < (
SELECT AVG(average_balance) 
FROM credit_card_data
)
ORDER BY average_balance DESC;

-- 14) Customers that accepted offer vs rejected offer
SELECT offer_accepted, COUNT(*) AS total_customers
FROM credit_card_data
GROUP BY offer_accepted; -- Result: 1k accepted / 16k rejected 

-- 15) Difference in avg balances of customers with high vs low credit card rating
SELECT credit_rating, ROUND(AVG(average_balance)) AS avg_balance
FROM credit_card_data
WHERE credit_rating = 'High' OR credit_rating = 'Low'
GROUP BY credit_rating; -- customers having high credit rating have a higher average balance (944) than low credit rating customers (940)

-- 16) Total customers grouped by type of comunication
SELECT mailer_type AS communication, COUNT(*) AS total_customers
FROM credit_card_data
GROUP BY mailer_type; -- Letter was used with 8.8k customers / Postcard with 9.1k customers

-- 17) Provide the details of the customer that is the 11th least Q1_balance in your database.
WITH table_ranking AS (
SELECT *, row_number() OVER(ORDER BY q1_balance) AS ranking
FROM credit_card_data
ORDER BY q1_balance ASC)
SELECT *
FROM table_ranking
WHERE ranking = '11';