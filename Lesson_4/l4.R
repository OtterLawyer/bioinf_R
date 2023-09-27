library(dplyr)
library(ggplot2)
library(knitr)
# main_dir <- dirname(rstudioapi::getSourceEditorContext()$path) 
# setwd(main_dir)

lt <- read.csv("loan-train.csv", sep=";", na.strings=c("","NA"))
lt_fix1 <- na.omit(lt)
#sort(unique(lt_fix1$ApplicantIncome))

lt_fix1 <- filter(lt_fix1, ApplicantIncome != 81000)

#unique(lt_fix1$Gender)

lt_fix2 <- lt_fix1 %>% mutate(Gender = case_when(
  Gender == "F" ~ "Female",
  Gender == "male" ~ "Male",
  Gender == "M" ~ "Male",
  TRUE ~ as.character(Gender)
))

lt_fix3 <- lt_fix2 %>% mutate(Education = case_when(
  Education == "NotGraduate" ~ "Not Graduate",
  Education == "No Graduate" ~ "Not Graduate",
  Education == "Gradate" ~ "Graduate",
  Education == "graduate" ~ "Graduate",
  Education == "not Graduate" ~ "Not Graduate",
  TRUE ~ as.character(Education)
))

lt_fix3$Gender <- as.factor(lt_fix3$Gender)
lt_fix3$Married <- as.factor(lt_fix3$Married) 
lt_fix3$Education <- as.factor(lt_fix3$Education)
lt_fix3$Self_Employed <- as.factor(lt_fix3$Self_Employed)
lt_fix3$Property_Area <- as.factor(lt_fix3$Property_Area)
lt_fix3$Loan_Status <- as.factor(lt_fix3$Loan_Status)
lt_fix3$Credit_History <- as.factor(lt_fix3$Credit_History)

#cor(lt_fix3$ApplicantIncome, lt_fix3$LoanAmount)

lt_Grad <- subset(lt_fix3, Education == "Graduate")
lt_notGrad <- subset(lt_fix3, Education == "Not Graduate")
lt_Grad_Loan <- subset(lt_Grad, Loan_Status == "Y")
lt_notGrad_Loan <- subset(lt_notGrad, Loan_Status == "Y")
#length(lt_Grad_Loan$Loan_ID) / length(lt_notGrad_Loan$Loan_ID)

lt_urban <- subset(lt_fix3, Property_Area == "Urban")
lt_rural <- subset(lt_fix3, Property_Area == "Rural")
u_LA <- lt_urban$LoanAmount
r_LA <- lt_rural$LoanAmount

# (mean(x) - mean(y)) / sqrt(sd(x)^2/n(x)+sd(y)^2/n(y))

answer <- as.double((mean(u_LA) - mean(r_LA)) / sqrt(sd(u_LA)^2 / length(u_LA) + sd(r_LA)^2 / length(r_LA)))
as.double(abs(answer))
