
dir()

#USe readlxl to import survey data into R

library(readxl)

excel_sheets("Survey_127.xlsx")

Data <- read_excel("Survey_127.xlsx",
           sheet=1, 
           col_names= c("Reference Number", "Attachments", "Admin/ secretarial", "Managers/ senior officials", "Directors/ chief executives", "Associate Professional", "Professional", "Other", "Other (please specify)", "Total time taken to complete Hours", "Total time taken to complete Mins", "External Costs Y", "External Costs False", "Accountant/ Bookkeeper", "Other", "Other (please specify)", "Accountant/ Bookkeeper £", "Accountant/ Bookkeeper p", "Other £", "Other p"),
           skip=5)

View(head(Data))
View(tail(Data))

#Cleaning
#In this version I am dropping all non relevant columns, and not examining external costs (columns 12:20 but 10:18 once other two colums dropped)

Data$Attachments <- NULL
Data$`Other (please specify)` <- NULL
Data[10:18] <- NULL


#Median Time 
#Time is given in two columns, 1 for hours the other for minutes. First blank values are read in as NA, these need converting to 0. 
#Then Hours converted to min , then hours in min added to min to get total time in minutes. Then median is found. 

Total_Minutes <- Data$`Total time taken to complete Hours`
Total_Minutes[is.na(Total_Minutes)] <- 0
Data$`Total time taken to complete Mins`[is.na(Data$`Total time taken to complete Mins`)] <- 0
Total_Min <- (Total_Minutes*60) + Data$`Total time taken to complete Mins`
Data$Total_Min <- Total_Min

median(Data$Total_Min, na.rm = T)










