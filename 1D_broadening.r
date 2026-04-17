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
plot(tab.func$X, tab.func$Y, type = 'l')
#increase resolution by padding
tab.func <- padding(X=tab.func$X, Y=tab.func$Y, fwd = 2, bwd = 2, pad.type = 'zero')

#derive the fft for the tabled function
fy.tab <- fft_1D(X=tab.func$X, Y=tab.func$Y)
plot(fy.tab$freq, fy.tab$Ampl, type = 'l', col='red', xlim = c(-5, 5))

#derive the FFT for a pure table function of same width
flat.tab <- table.func(X, BP = lims, H = c(0, 1, 0)) #build table function
plot(flat.tab$X, flat.tab$Y, type = 'l') #plot table function
flat.tab <- padding(X=flat.tab$X, Y=flat.tab$Y, bwd = 2, fwd = 2, pad.type = 'zero') #zero pad the table function
f.flat.tab <- fft_1D(X=flat.tab$X, Y=flat.tab$Y) #get fft of table function
plot(f.flat.tab$freq, f.flat.tab$Ampl, type = 'l', xlim = c(-5, 5), col='red') #plot fft
