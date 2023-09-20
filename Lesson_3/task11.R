# x - z(alpha/2) * sigma /sqrt(n) < mean(x) < x + z(alpha/2) * sigma /sqrt(n) 
alpha <- 0.02
setosa <- subset(iris, Species == "setosa")

x = mean(setosa$Sepal.Length) - qt(alpha/2,df=49) * sd(setosa$Sepal.Length) / sqrt(50)
y = mean(setosa$Sepal.Length) + qt(alpha/2,df=49) * sd(setosa$Sepal.Length) / sqrt(50)
print(x)