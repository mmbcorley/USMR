## try to find a nice binomial interaction

usmr <- data.frame(lects = sample(2:10,180,replace=T),prac=runif(180,0,40),likestats=factor(rbinom(180,1,.3),labels=c('no','yes')))

pass <- with(usmr,.3*prac + .2*(as.numeric(likestats)-1) + .5*(prac*(as.numeric(likestats)-1)))

pass <- pass-mean(pass)

pass <- pass + rnorm(180,0,((max(pass)-min(pass))/6))

pass[pass == 0]<- NA

pass <- ifelse(pass<0,0,1)

summary(pass)

model <- glm(pass~lects,data=usmr,family=binomial)

summary(model)

head(usmr)
