test <- lt_fix3
test <- subset(test, select=-Loan_ID)
test <- test %>% mutate(Education = case_when(
  Education == "Graduate" ~ 1, 
  Education == "Not Graduate" ~ 0, 
  TRUE ~ as.double(Education)))

test$Gender <- as.numeric(test$Gender)
test$Married <- as.numeric(test$Married)
test$Dependents <- as.numeric(test$Dependents)
test$Education <- as.numeric(test$Education)
test$Self_Employed <- as.numeric(test$Self_Employed)
test$Credit_History <- as.numeric(test$Credit_History)
test$Property_Area <- as.numeric(test$Property_Area)
test$Loan_Amount_Term <- as.integer(test$Loan_Amount_Term)
test$Loan_Status <- as.numeric(test$Loan_Status)
test_cov <- cov(test)
max(test_cov)

cov(test$ApplicantIncome, test$Dependents)
test2 <- subset(test,select=-Loan_Status)
test2 <- subset(test2, select=-Loan_Amount_Term)
test2 <- subset(test2, select=-Credit_History)

test2_cov <- cov(test2)
test2_cov <- subset(test2_cov,select=-max(test2_cov))
