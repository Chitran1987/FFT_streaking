rm(list=ls())
library(StatsChitran)
library(ImageMetrologyAnalysis)
ClearPlot()

#The original profile
X <- seq(-10, 10, by=0.01)
Y <- 0.25+0.25*sin(30*X)
plot(X, Y, type = 'l', col='blue', ylim = c(-1, 10))
fy <- fft_1D(X, Y)
plot(fy$freq, fy$Ampl, type = 'b', col='red', xlim = c(20, 40), ylim = c(0, 200))

#Introduce limited heights
hts <- table.func(X, BP = c(-3, 3), H=c(0, 10, 0))
plot(hts$X, hts$Y, type = 'l')
prof <- data.frame(X=X, Y=Y*hts$Y+10*hts$Y)
plot(prof$X, prof$Y, type = 'l')
fy.prof <- fft_1D(prof$X, prof$Y)
plot(fy.prof$freq, fy.prof$Ampl, type = 'b', col='red', xlim = c(20, 40), ylim = c(0, 1250))

#Introduce smooth heights
hts.Y <- sigmoid.plat(df_orig$X, k=10, left.cut = -5, right.cut = 5)
hts <- data.frame(X = df_orig$X, Y = hts.Y)
plot(hts$X, hts$Y, type = 'l')
prof <- data.frame(X=df_orig$X, Y=df_orig$Y*hts$Y+10*hts$Y)
plot(prof$X, prof$Y, type = 'l')
fy.prof <- fft_1D(prof$X, prof$Y)
plot(fy.prof$freq, fy.prof$Ampl, type = 'b', col='red', xlim = c(20, 40), ylim = c(0, 120))

#Compare the two spectra
df_orig <- data.frame(X, Y)
df_orig <- padding(df_orig$X, df_orig$Y, fwd = 1, bwd = 1, pad.type = 'zero')
plot(df_orig$X, df_orig$Y, type = 'l')
f.df_orig <- fft_1D(df_orig$X, df_orig$Y)
f.df_orig <- f.df_orig[f.df_orig$freq >= 20 & f.df_orig$freq<=40,]
fy.prof <- fy.prof[fy.prof$freq >= 20 & fy.prof$freq <= 40,]
#plot the two spectra together
plot(f.df_orig$freq, nrm(f.df_orig$Ampl), type = 'l')
lines(fy.prof$freq, nrm(fy.prof$Ampl), type = 'l', col = 'red')
