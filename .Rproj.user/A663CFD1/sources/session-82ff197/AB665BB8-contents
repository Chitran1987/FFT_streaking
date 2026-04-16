rm(list = ls())
library(ImageMetrologyAnalysis)
library(StatsChitran)

###Build the complex exponential e^{-i*w_O*t}
w_O <- 2
t <- seq(0, 100*pi, by=0.1)
Y <- exp(1i*w_O*t)
plot(t, Re(Y), type = 'l', col='blue')
lines(t, Im(Y), type = 'l', col='red')

###Plot its FFT.
###Should be a single peak at w = w_O
###FFT should be asymmetric
F.df <- ft(X=t, Y=Y, w=T)
plot(F.df$wf, abs(F.df$fy), xlim = c(-5,5), type = 'b')


###Now exponentially decay the signal (on both sides)
lambda <- 0.0
Y <- Y*exp(-lambda*t)
plot(t, Re(Y), type = 'l', col='blue')
lines(t, Im(Y), type = 'l', col='red')

###Plot its FFT.
###Should be a broadened peak at w = w_O
###FFT should be asymmetric
F.df <- ft(X=t, Y=Y, w=T)
plot(F.df$wf, abs(F.df$fy), xlim = c(-5,5), type = 'b')
abline(v=w_O, col='red')

##############################################################################################################################################################################################################
rm(list = ls())
library(ImageMetrologyAnalysis)
library(StatsChitran)
ClearPlot()

###Now build a list to place these structures inside it
##Create a list having two elements first (named real and fourier)
##These two elements should be lists having 11 elements each (from lambda = 0.0, 0.1, 0.2, ... ,1.0)
###list structure############################################################################################
L <- vector(mode = 'list', length = 2)
names(L) <- c('time domain', 'frequency domain')
L$`time domain` <- vector(mode = 'list', length = 11)
names(L$`time domain`) <- c('lambda = 0.0', 'lambda = 0.1', 'lambda = 0.2', 'lambda = 0.3', 'lambda = 0.4', 'lambda = 0.5', 'lambda = 0.6', 'lambda = 0.7', 'lambda = 0.8', 'lambda = 0.9', 'lambda = 1.0')
L$`frequency domain` <- vector(mode = 'list', length = 11)
names(L$`frequency domain`) <- c('lambda = 0.0', 'lambda = 0.1', 'lambda = 0.2', 'lambda = 0.3', 'lambda = 0.4', 'lambda = 0.5', 'lambda = 0.6', 'lambda = 0.7', 'lambda = 0.8', 'lambda = 0.9', 'lambda = 1.0')
###list structure############################################################################################

###list assignment############################################################################################
w_0 <- 2
t <- seq(0, 50, by=0.1)
exp.func <- function(lambda){
  Y <- exp(-1*lambda*t)*exp(1i*w_0*t)
  return(Y)
}

###list assignment############################################################################################
lambda.vec <- seq(0, 1.0, by=0.1)
for (k in 1:11) {
  L$`time domain`[[k]] <- data.frame(t, Y=exp.func(lambda = lambda.vec[k]))
  dmp <- L$`time domain`[[k]]
  dmp <- ft(X=dmp$t, Y=dmp$Y, w=T)
  L$`frequency domain`[[k]] <- dmp
}
###list assignment############################################################################################

###list save############################################################################################
save(L, file = 'fft_decaying_sinusoid.rda')
###list save############################################################################################
