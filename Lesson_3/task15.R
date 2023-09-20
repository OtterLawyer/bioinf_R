# В файле used_cars_data.csv содержатся объявления о продаже автомобилей в Испании.
# Определите, есть ли значимое различие в цене между SEAT Ibiza и Opel Astra. 
# В ответе укажите p_value для полученного значения критерия. Не используйте функцию t.test

data <- read.csv("used_cars_data.csv")
SEAT <- subset(subset(data, brand == "SEAT"), model == "Ibiza")
opel <- subset(subset(data, brand == "Opel"), model == "Astra")
SEA <- SEAT$price..eur.
ope <- opel$price..eur.
# (mean(x) - mean(y)) / sqrt(sd(x)^2/n(x)+sd(y)^2/n(y))

tscore <- (mean(SEA) - mean(ope)) / sqrt(sd(SEA)^2/length(SEA)+sd(ope)^2/length(ope))
answer = pt(tscore,df=11.19394 ) * 2
print(answer)
