# P(X = k) = C(n,k) * p^k * (1-p)^n-k
# C(n,k) = n! / (k! * (n-k)!) 
n = 6
k2 = 2
C2 <- factorial(n) / (factorial(k2) * factorial(n-k2))
p2 <- C2 * 0.5^k2 * 0.5^(n-k2)

n = 6
k3 = 3
C3 <- factorial(n) / (factorial(k3) * factorial(n-k3))
p3 <- C3 * 0.5^k3 * 0.5^(n-k3)

n = 6
k4 = 4
C4 <- factorial(n) / (factorial(k4) * factorial(n-k4))
p4 <- C4 * 0.5^k4 * 0.5^(n-k4)

print(p2+p3+p4)