
dir()

#USe readlxl to import survey data into R

library(readxl)

#Read in raw survey data, file name in brackets, will need to be changed. Assumes file is in the directory, if not change directory or add file path  

excel_sheets("Survey_127.xlsx")

Data <- read_excel("Survey_127.xlsx",
           sheet=1, 
           col_names= c("Reference Number", "Attachments", "Admin/ secretarial", "Managers/ senior officials", "Directors/ chief executives", "Associate Professional", "Professional", "Other", "Other (please specify)", "Total time taken to complete Hours", "Total time taken to complete Mins", "External Costs Y", "External Costs False", "Accountant/ Bookkeeper", "Other", "Other (please specify)", "Accountant/ Bookkeeper £", "Accountant/ Bookkeeper p", "Other £", "Other p"),
           skip=5)

excel_sheets("ASHE.xlsx")

#wage data, used for weighed average hourly rate 
#pehaps redudant, might be easier to manually create a data frame with relevant data, might be more robust? 

Wages <- read_excel("ASHE.xlsx", 
                    sheet= 1,
                    n_max=5)


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

#Weighed Average Hourly Rate 
# The hourly rate used for each job classifcation comes from ASHE Values Given in read.me, in a very fancy looking table, go me!  
# Count number of each occupation, so count number of x's in each job occupation column 
#Defintely a bad way of doing this, rather than repeat this 5 times, use apply function to do it in one line! But i'm so confused and stuck :( help!


Admin_num <- length(grep("X", Data$`Admin/ secretarial`))
Man_num <- length(grep("X", Data$`Managers/ senior officials`))
Dir_num <- length(grep("X", Data$`Directors/ chief executives`))
Associate_num <- length(grep("X", Data$`Associate Professional`))
Prof_num <- length(grep("X", Data$Professional))

#block above needs replacing with, as already said, an apply function

#create vector of how many each occupation, then divide each value by the total number(excluding other) to get the weight, then finally multiple the weights by the 
# hourly wages and sum this up to get the Weighed Hourly Rate, whr

num_occ <- c(Admin_num, Man_num, Dir_num, Associate_num, Prof_num)
per_occ <- num_occ/sum(num_occ)
whr <- sum(per_occ*Wages$`Hourly rate`)
whr

catrin





