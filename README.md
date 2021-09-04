## Classification project
#### Credit card customers analysis <br />

<img src="https://user-images.githubusercontent.com/80603632/132091415-93beebfa-f1b6-4ea9-b5e6-3fe88a237f49.png" width="500" />

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

### Results 
**Big picture: current customers characteristics** 
<br /><br />
Characteristics of customers who accepted the offer:<br />
![graphs 1](https://user-images.githubusercontent.com/80603632/132095229-b5771bde-9efb-473d-816b-ae4a686b7228.png)
![graphs 2](https://user-images.githubusercontent.com/80603632/132095232-66af08b2-928b-423b-955d-7fa8d887243d.png)

**SQL&Python results** 
- 0.5% represent customers that accepted the offer in the dataset. 
- These customers tend to have 2 or less bank accounts open, own their own home and hold 3 or less credit cards
- Logistic regession model with accuracy: 0.95, and KNN with accuracy of 0.94


### Additional details
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
