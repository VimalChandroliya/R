x=5:7
y=8:10

plot(x,y) #default plot output scatterplot

# plot data frame, time series preinstalled lynx col.main = main color, cex.main = magnification
plot(lynx)
plot(lynx,main="Lynx Trapping",col='Red',col.main=52,cex.main=1.5)

# lable names las- 0:3 scale orientation
plot(lynx,ylab='Lynx Trapping',xlab="")
plot(lynx,ylab='Lynx Trapping',xlab="",las=2)

# changing the session parameter, 2*2 plot matrix
par(mfrow=c(2,2),col.axis='Red')

plot(1:8,las=0,xlab='xlab',ylab='ylab',main="Las=0")
plot(1:8,las=1,xlab='xlab',ylab='ylab',main="Las=1")
plot(1:8,las=2,xlab='xlab',ylab='ylab',main="Las=2")
plot(1:8,las=3,xlab='xlab',ylab='ylab',main="Las=3")


# Color manipulation
colors()

# point symbol types
?pch

x=2:4
plot(x,pch='c') # using letters as point symbols
plot(x,pch=13)

# Line types

par(mfrow=c(1,1),col.axis="black") #setting parameters

library(plotrix) # dd on package for ablineclip

plot(1:7,ylab="",main='Line types lty 0:6',xlab='lty 0.6')

ablineclip(v=1,lty=1,col="sienna2",lwd=2) #solid default, lwd-thickness, line width
ablineclip(v=2,lty=2,col="sienna2",lwd=2) #dashed
ablineclip(v=3,lty=3,col="sienna2",lwd=2) #dotted
ablineclip(v=4,lty=4,col="sienna2",lwd=2) #dotdash
ablineclip(v=5,lty=5,col="sienna2",lwd=2) #longdash
ablineclip(v=6,lty=6,col="sienna2",lwd=5) #twodash
ablineclip(v=7,lty=0,col="sienna2",lwd=2) #Blank


# plot types of R Base plot
?plot

plot(lynx) #lynx-time series data plot

plot(lynx,type='p',main='Type P') #point
plot(lynx,type='l',main='Type l') #lines 
plot(lynx,type='b',main='Type b') #points connected by lines
plot(lynx,type='c',main='Type c') #lines only of b
plot(lynx,type='o',main='Type o') #points overlaid by lines
plot(lynx,type='h',main='Type h') #high density
plot(lynx,type='s',main='Type s') #steps
plot(lynx,type='n',main='Type n') #no plot


# Advanced line plot with R

par(mar=c(4,3,3,3),col.axis='darkgreen') #change of plot margins

plot(cars$speed,type='s',col='red',bty='n',xlab='Cars ID',ylab='')
text(10,14,"Speed in mph",cex = 0.85,col='red')

par(new=T) # allows 2 in 1 plot, on top of first one

plot(cars$dist,type = 's',col='darkblue',bty='n',ann=F,axes = F)
axis(side=4,col="darkblue") #Y axis for plot 2
text(37,20,"Stopping distance",cex=0.8,col="darkblue")
title(main="Speed and Stopping\n Distance of Cars")


## Graphical parameters
?par

par()


## rivers 
?rivers

x=1:141
y=rivers

plot(x,y,col='green',pch=20,
     main="Lengths of \nMajor N.Amrican Rivers",
     col.main='red',xlab='',
     ylab='lengh in miles')
