isl <- read.csv("iris_sepal_length.csv")
df <- c(isl$setosa, isl$versicolor, isl$virginica)
mean_df <- sum(df)/150
sd_df <- (sum((df-mean_df)^2)/149)^0.5

print(sd_df)
