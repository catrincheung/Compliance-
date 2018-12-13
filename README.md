# Compliance-
## Calculating Compliance Costs :+1:

- [x] Tidy Data
- [ ] Calculate Median Time
- [ ] Weighed Avg Hourly rate
- [ ] % external costs
- [ ] External costs in punds

Survey_example is survey data which has been stripped of identifying data and randomly alterated, allowing code to be built using the same format as will be recieved. 
Compliance.R is the R script so far. 

The aim is to caulate the respondent burden of ONS surveys, so the cost to the businesses who fill in ONS surveys. 
This is calculated using the model contained in https://gss.civilservice.gov.uk/wp-content/uploads/2015/12/Guidance-on-Calculating-Compliance-Costs.pdf, pg. 2 consisting of 7 varibles. 
The first stage is contained in the compliance review. This is a second survey which is sent after the main survey, which asks who filled in the survey (their job so can estimate their wage), how long they took (the longer the more expensive), whether they had external costs (so whether they filled in the survey internally or hired an accountant/bookkepper), and finally if they did hire an accountant/bookkepper how much that costs. 
From this file we can obtain the median time taken to fill in the survey, a weighed average wage, the Proportion of respondents incurring external costs and the Median external costs. So this is 4 of the 7 **varibles**. 

### Median Time
The time taken to complete the survey is given in two columns, 1 for hours then a second for minutes. This makes it hard to calculate median time! Also blank values are read in as NA. 
**Startegy so far**
Convert NA to 0. Then multiple hours by 60, to get hours in minutes. Then add this to minutes getting total time in minutes 
*(so an hour and a half is given as* [1][30], *this is converted to* [60][30] *which is added together in a new column called Total_Min containing [90])*

### Weighed Avg Hourly rate

There are 5 classifcations of job given and other. To calculate the weighed avg other is ignored. The hourly rate for each job is taken from ASHE. This is weighed to obtain a single weighted average hourly rate.    

2018
---
Job Title |	Hourly rate	| Code
--- | --- | --- 
Admin/secretarial | 11.07 | 4
Managers/senior officials | 20.60 | 1
Directors/chief executives | 	46.00 |	1115
Assoc Professional /technical Occupations |	15.63 |	3
Professional Occupations |	20.44	| 2
---
Source-  Earnings and hours worked, occupation by four-digit SOC: ASHE Table 14.6a		
		



