nh4cl <- c(32,60,25, 45, 65, 60, 68, 83, 120, 110)
clhex <- c(14, 39, 24, 13, 9, 3, 10, 14, 1, 36)
#(tstat <- mean(nh4cl - clhex) / (sd(nh4cl - clhex)/sqrt(length(nh4cl))))

t.test(nh4cl, clhex, paire=TRUE)$p.value
