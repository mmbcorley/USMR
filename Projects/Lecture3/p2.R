# read in data
heights <- read.csv('heights.csv')

# histograms with semi-transparent colouring
hist(heights$HEIGHT[heights$gender == 'Female'],col=rgb(1,0,0,.5),xlim=c(150,195),ylim=c(0,0.1),freq=F)
hist(heights$HEIGHT[heights$gender == 'Male'],col=rgb(0,0,1,.5),add=T,freq=F)

# record female heights, male heights, using logical indexing
female <- heights$HEIGHT[heights$gender == 'Female']
male <- heights$HEIGHT[heights$gender == 'Male']

# for reference
# mean(female)
# sd(female)

# so between the heights we have...
x <- seq(150,190,length.out = 53)

# draw relevant normal curves
lines(x,dnorm(x,mean=mean(female),sd=sd(female)),col='red',lwd=3,type='l')
lines(x,dnorm(x,mean=mean(male),sd=sd(male)),col='blue',lwd=3,type='l')

# length(female) # find how many females
# length(male) # how many males (just for reference)

# add lines equivalent to standard error curves (see "sd" calculations)
lines(x,dnorm(x,mean=mean(female),sd=sd(female)/sqrt(length(female))),col='red',lwd=3,type='l')
lines(x,dnorm(x,mean=mean(male),sd=sd(male)/sqrt(length(male))),col='blue',lwd=3,type='l')




# below here: not in USMR, just a pointer to the future! ------------------

library(tidyverse)

heights %>% group_by(gender) %>% summarise(mean=mean(HEIGHT),sd=sd(HEIGHT))
