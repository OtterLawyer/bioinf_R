data(mtcars)

# Разделение данных на две группы в зависимости от коробки передач
auto <- mtcars$mpg[mtcars$am == 0]
manual <- mtcars$mpg[mtcars$am == 1]

# Проведение t-теста
test <- t.test(auto, manual)

# Вывод результатов теста
print(test)

critical_value <- qt(0.05 / 2, df = test$parameter, lower.tail = FALSE)

# Расчет разницы
difference <- abs(critical_value - test$statistic)

# Вывод разницы
print(difference)