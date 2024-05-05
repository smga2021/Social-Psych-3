#Data Cleaning 
library(readr)
library(dplyr)

final_df <- data.frame(Projects_Assignment_6_May_1_2024_03_42_2)

#reverse scoring RSE for items 2, 5, 6, 8, 9

final_df$Q1_2 <- case_match(final_df$Q1_2,
                           1 ~ 4,
                           2 ~ 3,
                           3 ~ 2,
                           4 ~ 1)

final_df$Q1_5 <- case_match(final_df$Q1_5,
                             1 ~ 4,
                             2 ~ 3,
                             3 ~ 2,
                             4 ~ 1)

final_df$Q1_6 <- case_match(final_df$Q1_6,
                             1 ~ 4,
                             2 ~ 3,
                             3 ~ 2,
                             4 ~ 1)

final_df$Q1_8 <- case_match(final_df$Q1_8,
                             1 ~ 4,
                             2 ~ 3,
                             3 ~ 2,
                             4 ~ 1)

final_df$Q1_9 <- case_match(final_df$Q1_9,
                             1 ~ 4,
                             2 ~ 3,
                             3 ~ 2,
                             4 ~ 1)
#Composite Score RSE
final_df$RSE_score <- rowMeans(final_df[,c("Q1_1", "Q1_2", "Q1_3", "Q1_4", "Q1_5",
                                           "Q1_6", "Q1_7", "Q1_8", "Q1_9", "Q1_10")])

#Rename variable for manipulation check
names(final_df)[names(final_df) == "Q25"] <- "Mani_Check"

#Turn NAs into 0 not passing the check, 2s into 1 for passing the check
final_df$Mani_Check[is.na(final_df$Mani_Check)] <- 0
final_df$Mani_Check[final_df$Mani_Check == 2] <- 1


#reverse scoring state self esteem for items 2, 4, 5, 7, 8, 10, 13, 15, 16, 17, 18, 19, 20

final_df$Q19_2 <- case_match(final_df$Q19_2,
                            1 ~ 4,
                            2 ~ 3,
                            3 ~ 2,
                            4 ~ 1)

final_df$Q19_4 <- case_match(final_df$Q19_4,
                             1 ~ 4,
                             2 ~ 3,
                             3 ~ 2,
                             4 ~ 1)

final_df$Q19_5 <- case_match(final_df$Q19_5,
                             1 ~ 4,
                             2 ~ 3,
                             3 ~ 2,
                             4 ~ 1)

final_df$Q19_7 <- case_match(final_df$Q19_7,
                             1 ~ 4,
                             2 ~ 3,
                             3 ~ 2,
                             4 ~ 1)

final_df$Q19_8 <- case_match(final_df$Q19_8,
                             1 ~ 4,
                             2 ~ 3,
                             3 ~ 2,
                             4 ~ 1)

final_df$Q19_10 <- case_match(final_df$Q19_10,
                             1 ~ 4,
                             2 ~ 3,
                             3 ~ 2,
                             4 ~ 1)

final_df$Q29_3 <- case_match(final_df$Q29_3,
                              1 ~ 4,
                              2 ~ 3,
                              3 ~ 2,
                              4 ~ 1)

final_df$Q29_5 <- case_match(final_df$Q29_5,
                              1 ~ 4,
                              2 ~ 3,
                              3 ~ 2,
                              4 ~ 1)

final_df$Q29_6 <- case_match(final_df$Q29_6,
                              1 ~ 4,
                              2 ~ 3,
                              3 ~ 2,
                              4 ~ 1)

final_df$Q29_7 <- case_match(final_df$Q29_7,
                              1 ~ 4,
                              2 ~ 3,
                              3 ~ 2,
                              4 ~ 1)

final_df$Q29_8 <- case_match(final_df$Q29_8,
                              1 ~ 4,
                              2 ~ 3,
                              3 ~ 2,
                              4 ~ 1)

final_df$Q29_9 <- case_match(final_df$Q29_9,
                              1 ~ 4,
                              2 ~ 3,
                              3 ~ 2,
                              4 ~ 1)

final_df$Q29_10 <- case_match(final_df$Q19_10,
                              1 ~ 4,
                              2 ~ 3,
                              3 ~ 2,
                              4 ~ 1)

#Composite Score state self esteem
final_df$stateSE_score <- rowMeans(final_df[,c("Q19_1", "Q19_2", "Q19_3", "Q19_4", "Q19_5",
                                           "Q19_6", "Q19_7", "Q19_8", "Q19_9", "Q19_10", "Q29_1", 
                                           "Q29_2", "Q29_3", "Q29_4", "Q29_5", "Q29_6", "Q29_7",
                                           "Q29_8", "Q29_9", "Q29_10")])

#Composite Score perceived quality of life
final_df$PQL_score <- rowMeans(final_df[,c("Q13_1", "Q13_2", "Q13_3", "Q13_4", "Q13_5", "Q13_6",
                                           "Q13_7", "Q13_8","Q13_9", "Q30_1", "Q30_2", "Q30_3",
                                           "Q30_4", "Q30_5", "Q30_6", "Q30_7", "Q30_8", "Q30_9",
                                           "Q30_10")])

#Rename variable for social media screen time use
names(final_df)[names(final_df) == "Q11"] <- "Screen_Time"

#Rename variable for age
names(final_df)[names(final_df) == "Q2"] <- "Age"

#Rename variable for gender
names(final_df)[names(final_df) == "Q12"] <- "Gender"

#Rename variable for race/ethnicity
names(final_df)[names(final_df) == "Q20"] <- "Race/Ethnicity"

# loads the package 
install.packages("writexl")
library("writexl")  

write_xlsx(final_df,"final_df.xlsx")
