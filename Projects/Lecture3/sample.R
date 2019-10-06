heights <- read.csv('heights.csv')

length(heights[heights$gender=='Male',]$gender)

length(heights[heights$gender=='Female',]$gender)

low.x <- min(heights$HEIGHT)
hi.x <- max(heights$HEIGHT)



# superimposed histograms -------------------------------------------------



hist(heights$HEIGHT[heights$gender=='Male'], xlim=c(low.x,hi.x),ylim=c(0,.04),col=rgb(1,0,0,0.5),freq=F)
hist(heights$HEIGHT[heights$gender=='Female'], col=rgb(0,0,1,0.5), add=T,freq=F)

x <- seq(low.x,hi.x,length.out = 249)
lines(x,dnorm(x,163,14.4),col='blue',lwd=2)

lines(x,dnorm(x,175,14.4),col='red',lwd=2)

lines(x,dnorm(x,163,.176),col='blue',lwd=2)

lines(x,dnorm(x,175,.211),col='red',lwd=2)


# tidyverse ---------------------------------------------------------------

require(tidyverse)

heights %>% group_by(gender) %>% summarise(mean=mean(HEIGHT),sd=sd(HEIGHT),se = sd(HEIGHT)/n())
