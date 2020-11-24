install.packages('esc')
library(esc)
library(pwr)


data = cbind(rbind(50,14950),rbind(100,14900))
colnames(data)<-c('placebo','vaccine')
rownames(data)<-c('infected','not-infected')
data
chisq.test(data,correct=FALSE,simulate.p.value = FALSE)


data = cbind(rbind(50,14950),rbind(25,14975))
colnames(data)<-c('placebo','vaccine')
rownames(data)<-c('infected','not-infected')
data
chisq.test(data,correct=FALSE,simulate.p.value = FALSE)

data = cbind(rbind(40,14960),rbind(20,14980))
colnames(data)<-c('placebo','vaccine')
rownames(data)<-c('infected','not-infected')
data
chisq.test(data)


data = cbind(rbind(30,14970),rbind(15,14985))
colnames(data)<-c('placebo','vaccine')
rownames(data)<-c('infected','not-infected')
data
chisq.test(data,correct=FALSE,simulate.p.value = FALSE)


data = cbind(rbind(20,14980),rbind(10,14990))
colnames(data)<-c('placebo','vaccine')
rownames(data)<-c('infected','not-infected')
data
chisq.test(data,correct=FALSE,simulate.p.value = FALSE)





data = cbind(rbind(25,75),rbind(50,50))
colnames(data)<-c('placebo','vaccine')
rownames(data)<-c('infected','not-infected')
data
chisq.test(data,correct=FALSE,simulate.p.value = FALSE)


esc_chisq(
  chisq=5,
  p=.05,
  totaln=45,
  es.type = c("d", "g", "or", "logit", "r", "f", "eta", "cox.or", "cox.log"),
  study = NULL
)

result<-pwr.chisq.test(w=0.70,df=1,sig.level=.05,power=.8)
