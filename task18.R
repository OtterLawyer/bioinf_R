before <- c(20, 17, 14, 42, 50, 62, 8, 49, 81, 54, 48, 55, 56)
after <- c(20, 26, 1, 24, 1, 47, 15, 7, 65, 9, 21, 36, 30)
wilcox_stat <- wilcox.test(before,after, paired = T, correct = F)
TRUE
