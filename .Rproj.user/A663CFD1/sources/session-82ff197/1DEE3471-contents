rm(list=ls())
library(StatsChitran)
library(ImageMetrologyAnalysis)
ClearPlot()

X <- seq(-10*pi, 10*pi, by=0.01)
Y <- sin(3*X)
df <- data.frame(X=X, Y=Y)
plot(df$X, df$Y, type = 'l')
fy <- fft_1D(X=df$X, Y=df$Y)
plot(fy$freq, fy$Ampl, type = 'b', col='red', xlim = c(-5, 5))

#table function
lims <- c(-6*pi, 6*pi)  #the limits
tab.func <- data.frame(X=X, Y=Y)
tab.func$Y[tab.func$X <lims[1]] <- 0
tab.func$Y[tab.func$X >lims[2]] <- 0
plot(tab.func$X, tab.func$Y)

#derive the fft for the table function
fy.tab <- fft_1D(X=tab.func$X, Y=tab.func$Y)
plot(fy.tab$freq, fy.tab$Ampl, type = 'b', col='red', xlim = c(-5, 5))
