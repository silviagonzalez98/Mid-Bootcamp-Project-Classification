## Classification project
#### Credit card customers analysis <br />

<img src="hhttps://github.com/silviagonzalez98/Movies-Box-Office-Revenue/blob/main/images/descarga.jpeg?raw=true" width="500" />

### Introduction
The objective of this project is to build a model that provides insight into why some bank customers accept credit card offers. 

### Data
The data set consists of information on 18,000 current bank customers in the study. The information of the datased includes both categorical and numerical variables to analyse indicated below.

**i) Categoricals**
|Categoricals | Values |	
------------- | -------------| 
|Offer accepted	| Yes, No|
|Reward	| Air Miles, Cash Back, Points|
|Mailer type	|	Letter, Postcard|
|Income level	|	High, Medium, Low|
|Overdraft protection |	Yes, No|
|Credit rating	|	High, Medium, Low
|Own your home	|	Yes, No|

**ii) Numericals**

|Numericals | Values  |	
------------- | -------------| 
|Customer number	| 1 to 18.000|
|	Bank accounts open| 1 to 3|
|	Credit cards held|	1 to 4|
|	Homes owned|	1 to 3|
| Household size|	1 to 9|
|	Average balance|	48 to 3366|
|	Q1 balance|	0 to 3450|
|	Q2 balance|	0 to 3421|
|	Q3 balance|	0 to 3823|
|	Q4 balance|	0 to 4215|

### Project workflow 
1) Data exploration with SQL <br />(file directory: ./project/sql-queries.sql)

2) Data featuring and logistic regression with Python <br />(file directory: ./project/python-work.ipynb)

3) Data visualization with Tableau <br />(file directory: ./project/Tableau_visualization_results.ipynb)

### Results: Target customer visualization (Offer Accepted) 
![graphs 1](https://user-images.githubusercontent.com/80603632/132095229-b5771bde-9efb-473d-816b-ae4a686b7228.png)
![graphs 2](https://user-images.githubusercontent.com/80603632/132095232-66af08b2-928b-423b-955d-7fa8d887243d.png)

### Key Findings (Overall project)  <br />
- Insight 1: Customers who accepted the offer generally have higher quarterly balances. <br /> 
- Insight 2: There is definitely observed a huge jump in average balance from q1 to q2 for households with size 8, and the main reason is that there is only one customer in the dataset that represents household = 8, consequently moves all the metric. <br /> 
- Insight 3: Customers that accepted the offer mostly had received a postcard, and had a low (and medium) credit rating. This results a key piece of information to encourage the bank to focus on prioritizing postcards and focusing on low to meidum credit rating customers. <br /> 
- Insight 4: Categorizing by average balance, most customers (out of 18k) have a balance of 1.4k or less (13.8k customers between 701 to 1.4k balance, and 3.2k customers between 0 to 700 balance).

### Libraries
|	Libaries |	
------------- |
|	pandas as pd |	
|	numpy as np |	
|	warnings |	
|	matplotlib as plt |	
|	seaborn as sns |	
|	scipy |	
|	imblearn |	
|	sklearn |	
