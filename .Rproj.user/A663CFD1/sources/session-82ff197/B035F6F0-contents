rm(list=ls())
library(StatsChitran)
library(ImageMetrologyAnalysis)
ClearPlot()

X <- seq(-10, 10, by=0.01)
Y <- 0.25*sin(30*X)
plot(X, Y, type = 'l', col='blue', ylim = c(-1, 10))
fy <- fft_1D(X, Y)
plot(fy$freq, fy$Ampl, type = 'b', col='red', xlim = c(20, 40))

###Introduce heights
hts <- table.func(X=X, BP = c(-5, 5), H = c(2, 10, 2))
prof <- data.frame(X=X, Y=hts$Y+Y)
plot(prof$X, prof$Y, type = 'l')

prof.fourier <- fft_1D(X=prof$X, Y=prof$Y)
plot(prof.fourier$freq, prof.fourier$Ampl, type = 'b', col='red', xlim = c(20, 40), ylim = c(0, 175))

###Introduce the sigmoid plateau
Y_pl <- 10*sigmoid.plat(X=X, k = 5, left.cut = -5, right.cut = 5)
plot(X, Y_pl, type = 'l')
prof$Y <- Y + Y_pl
plot(prof$X, prof$Y, type = 'l', col='blue')
prof.fourier <- fft_1D(X=prof$X, Y=prof$Y)
plot(prof.fourier$freq, prof.fourier$Ampl, type = 'b', col='red', xlim = c(20, 40), ylim = c(0, 175))

#Now compare the spectra at the fourier harmonics
plot(fy$freq, fy$Ampl, type = 'b', col='black', xlim = c(20, 40))
lines(prof.fourier$freq, prof.fourier$Ampl, type = 'b', col='red')
