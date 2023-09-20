# df = ((s1**2 / n1) + (s2**2 / n2)**2) / (((s1**2/n1)**2 / n1-1) + ((s2**2/n2)**2 / (n2-1))
auto <- subset(mtcars, am == 0)$mpg
manual <- subset(mtcars, am == 1)$mpg
s1 <- var(auto)
s2 <- var(manual)
n1 <- 19
n2 <- 13
df1 <- ((s1**2 / n1) + (s2**2 / n2)) ** 2
df2 <- ((s1**2 / n1)**2 / (n1-1)) + ((s2**2 / n2)**2 / (n2-1))
df3 <- df1/df2
df4 <- ((s1**2 / n1) + (s2**2 / n2))**2 / (((s1**2/n1)**2 / (n1-1)) + ((s2**2/n2)**2 / (n2-1)))
cr <- qt(0.05 / 2, df = 18.33225, lower.tail = FALSE)

# (mean(x) - mean(y)) / sqrt(sd(x)^2/n(x)+sd(y)^2/n(y))
#

score <- (mean(auto) - mean(manual)) / sqrt(sd(auto)**2/length(auto) + sd(manual)**2/length(manual))

abs(abs(cr) - abs(score))
