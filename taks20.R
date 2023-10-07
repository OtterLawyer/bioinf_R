# Выбираем точный критерий Фишера, т.к. число наблюдений в <5.
#    Возьмём нашу исходную таблицу и посчитаем суммы строк и столбцов
#  2   1  | 3       a     b  | a + b
#  8    3  | 11       c     d  | c + d
#  --------         ---------
#  10   4   28      a+c   b+d   a+b+c+d
# (a + b)!(c + d)!(a + c)!(b + d)!/(a!b!c!d!n!) # вероятность получить такое или более экстремальное значение статистики
Fisher_stat1 <- factorial(3) * factorial(11) * factorial(10) * factorial(4) / factorial(2) / factorial(1) / factorial(8) / factorial(3) / factorial(28)

#  3   0  | 3       a     b  | a + b
#  7    4  | 11       c     d  | c + d
#  --------         ---------
#  10   4   28      a+c   b+d   a+b+c+d

Fisher_stat2 <- factorial(3) * factorial(11) * factorial(10) * factorial(4) / factorial(3) / factorial(0) / factorial(7) / factorial(4) / factorial(28)

Fisher_stat2 <- Fisher_stat1 + Fisher_stat2
df <- data.frame(c(2,8),c(1,3))
p_fisher <- fisher.test(df, alternative="greater")$p.value
FALSE