############################ 23
demo<-read.csv('C:\\Users\\shubham\\Desktop\\R\\csv-data-frames\\demographics.csv')
View(demo)

# build column chart with ggplot2

require(ggplot2)

# build the chart

ggplot(demo,aes(x=educ,y=income,fill=educ))+
  stat_summary(fun.y = mean,geom = 'bar')

# same color
ggplot(demo,aes(x=educ,y=income))+
  stat_summary(fun.y = mean, geom='bar',fill='red')

# grouping variable must be factor

#cluster bar chant by variable gender, position_dodge

ggplot(demo,aes(x=educ,y=income,fill=gender))+
  stat_summary(fun.y = mean, geom = 'bar', position=position_dodge())

# to stack the column, position_stack

ggplot(demo,aes(x=educ, y=income, fill=gender))+
  stat_summary(fun.y = mean, geom='bar', position=position_stack())

########################### 24 mean plot

demo<-read.csv('C:\\Users\\shubham\\Desktop\\R\\csv-data-frames\\demographics.csv')
View(demo)

require(ggplot2)

# create data frame with means of gender group

aggdata<-aggregate(demo$income,by = list(demo$gender),FUN=mean)
View(aggdata)

# plot

ggplot()+
  geom_line(data=aggdata,aes(x=(1:2) , y=aggdata$x),color='red',size=1.3)+
  scale_x_discrete(name='Gender',labels=c('Female','Male'))+
  scale_y_continuous(name='income',limits = c(72,85))

# data frame with educ

aggdata<-aggregate(demo$income,by=list(demo$educ),FUN=mean)
View(aggdata)

ggplot()+
  geom_line(data=aggdata, aes(x=1:5 , y=aggdata$x),color='red',size=1.3)+
  scale_x_discrete(name='Education Level',labels=c('Clg degree','did not complete','High school degree','Post grad','Some clg'))+
  scale_y_continuous(name='income',limits = c(64,116))

################## 25 scatterplot

hw<-read.csv('C:\\Users\\shubham\\Desktop\\R\\csv-data-frames\\hw.csv')
View(hw)

require(ggplot2)

ggplot()+
  geom_point(data=hw , aes(x=height, y=weight),color='red')+
  scale_x_continuous(limits = c(150,200))

# cluster scatter plot by gender

lgd<-hw$gender

# get points of diff colors

ggplot()+
  geom_point(data=hw, aes(x=height, y=weight, color=lgd))+
  scale_x_continuous(limits = c(150,200))


ggplot()+
  geom_point(data=hw, aes(x=height, y=weight, shape=lgd))+
  scale_x_continuous(limits = c(150,200))

ggplot()+
  geom_point(data=hw, aes(x=height, y=weight, shape=lgd, color=lgd))+
  scale_x_continuous(limits = c(150,200))

### create a linear model
### with weight as the dependent variable and height as the explainer

model<-lm(weight~height, data = hw)
print(model)

minh<-min(hw$height)
maxh<-max(hw$height)

height<-c(minh,maxh)
print(height)


### predict the weight based on the height, with the model above

fit<-predict(model, data.frame(height))
print(fit)

### create a data frame with the line end points

endpoints<-data.frame(height,fit)
View(endpoints)

### build the scatter plot with trend line

ggplot()+
  geom_point(data=hw, aes(x=height, y=weight))+
  geom_line(data=endpoints, aes(x=height, y=fit),color='red',size=1.2)

###### 26 boxplot

demo<-read.csv('C:\\Users\\shubham\\Desktop\\R\\csv-data-frames\\demographics.csv')
View(demo)

require(ggplot2)

ggplot()+
  geom_boxplot(data=demo, aes(x=gender, y=income),outlier.colour = 'red',outlier.shape = 4)+
  scale_x_discrete(labels=c('Female','Male'))

lgd<-demo$gender

ggplot()+
  geom_boxplot(data=demo, aes(x=gender, y=income, fill=lgd))+
  scale_x_discrete(labels=c('Female','Male'))

# cluster 

lgd<-demo$marital

ggplot()+
  geom_boxplot(data=demo, aes(x=gender, y=income, fill=lgd))+
  scale_x_discrete(labels=c('Female','Male'))

######################## 27 Normality shapiro test

demo<-read.csv('C:\\Users\\shubham\\Desktop\\R\\csv-data-frames\\demographics.csv')

### we will check whether the variable income is normally distributed

shapiro.test(demo$income)

##################### 28 normality graphics

demo<-read.csv('C:\\Users\\shubham\\Desktop\\R\\csv-data-frames\\demographics.csv')
require(ggplot2)

# compute mean and sd of income

m<-mean(demo$income)
std<-sd(demo$income)

ggplot()+
  geom_histogram(data=demo, aes(x=income,y=..density..),fill='red')+
  stat_function(fun = dnorm, args = list(mean=m, sd=std), aes(x=demo$income))
### dnorm is a function that creates a normal distribution
### it comes with the stats package

############## 29 Outliers

demo<-read.csv('C:\\Users\\shubham\\Desktop\\R\\csv-data-frames\\demographics.csv')
zinco<-scale(demo$income,scale = TRUE)

sort(zinco,decreasing = TRUE)

t.test(demo$income, alternative = "two.sided", mu=70)

# binomial

mytable<-table(demo$gender)
print(mytable)
# write.csv(mytable,file='C:\\Users\\shubham\\Desktop\\R\\abc.csv',sep=',')

binom.test(mytable, p=0.50, alternative="two.sided",conf.level=0.95)

binom.test(mytable, p=0.40, alternative="two.sided",conf.level=0.95)
