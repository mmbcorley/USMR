pop <- runif(n = 10000,50, 150)
hist(pop)
mean(pop)

mean(sample(pop,48))

hist(sample(pop,48))

mvec <- replicate(1000,mean(sample(pop,24)))
hist(mvec)
