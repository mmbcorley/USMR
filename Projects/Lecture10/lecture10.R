### useful definitions

logit.to.p <- function(l) {
    exp(l)/(1+exp(l))
}

### load data

load(url('https://is.gd/usmrdata'))
ls()
summary(usmr)
### live

usmr$likestats[usmr$likestats=='Yes'] <- 'yes'
summary(usmr$likestats)
#usmr$likestats <- droplevels(usmr$likestats)

table(usmr$PASS)
usmr$PASS[usmr$PASS == -99] <- NA
hist(usmr$prac)
usmr$prac[usmr$prac <0] <- NA

usmr <- droplevels(usmr)

summary(usmr)

usmr <- usmr[complete.cases(usmr),]

head(usmr)
nrow(usmr)

plot(usmr)
with(usmr,plot(jitter(PASS) ~ likestats))

plot(density(usmr$prac))

model <- glm(PASS~prac*likestats,data=usmr,family=binomial)
anova(model,test='Chisq')

summary(model)

logit.to.p(coef(model)[1])

logit.to.p(coef(model)[1] + 30*coef(model)[4])

ls()












##### graph

## (1) make a prediction dataframe

g.usmr <- data.frame(prac <- seq(min(usmr$prac,na.rm=T),max(usmr$prac,na.rm=T),length.out=49))

g.usmr$likestats <- 'yes'
g.usmr$likestats <- factor(g.usmr$likestats,levels=c('yes','no'))

## predict ps for people who like stats

y.for.1 <- predict(model,newdata=g.usmr,type='response')

g.usmr$likestats <- 'no'

## predict ps for people who don't like stats

y.for.0 <- predict(model,newdata=g.usmr,type='response')

## bind into a matrix, for ease of use

ys <- cbind(y.for.0,y.for.1)

matplot(g.usmr$prac,ys,type='l',lwd=2,lty=1, xlab='practical hours', ylab='p(PASS)')


