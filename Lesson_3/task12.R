lake <- LakeHuron

# (mean(virginica) - mean(setosa)) / (sd(virginica)/sqrt(50))

score = (mean(lake) - 581) / (sd(lake)/sqrt(98))
answer = pt(score,df=97) * 2
print(answer)

