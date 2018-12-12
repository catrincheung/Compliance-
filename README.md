# Compliance-
Calculating Compliance Costs

Survey_example is survey data which has been stripped of identifying data and randomly alterated, allowing code to be built using the same format as will be recieved. 
Compliance.R is the R script so far. 

The aim is to caulate the respondent burden of ONS surveys, so the cost to the businesses who fill in ONS surveys. 
This is caculated using the model contained in https://gss.civilservice.gov.uk/wp-content/uploads/2015/12/Guidance-on-Calculating-Compliance-Costs.pdf, pg. 2 consisting of 7 varibles. 
The first stage is contained in the compliance review. This is a second survey which is sent after the main survey, which asks who filled in the survey (their job so can estimate their wage), how long they took (the longer the more expensive), whether they had external costs (so whether they filled in the survey internally or hired an accountant/bookkepper), and finally if they did hire an accountant/bookkepper how much that costs. 
From this file we can obtain the median time taken to fill in the survey, a weighed average wage, the Proportion of respondents incurring external costs and the Median external costs. So this is 4 of the 7 varibles. 

