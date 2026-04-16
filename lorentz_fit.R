rm(list = ls())
library(ImageMetrologyAnalysis)
library(StatsChitran)
ClearPlot()

#plot data and fourier and fit to lorentzian
load(file = 'fft_decaying_sinusoid.rda')
data.lst <- L$`time domain`
fft.lst <- L$`frequency domain`

#lambda = 0.0########################################
df.t <- data.lst$`lambda = 0.0`
df.ft <- fft.lst$`lambda = 0.0`
#plot the real versus imaginary data
plot(df.t$t, Re(df.t$Y), type = 'l', col='blue')
lines(df.t$t, Im(df.t$Y), type = 'l', col='red')
#plot the fft data
plot(df.ft$wf, abs(df.ft$fy), xlim = c(-5, 5), type = 'b')


#lambda = 0.1########################################
df.t <- data.lst$`lambda = 0.1`
df.ft <- fft.lst$`lambda = 0.1`
#plot the real versus imaginary data
plot(df.t$t, Re(df.t$Y), type = 'l', col='blue')
lines(df.t$t, Im(df.t$Y), type = 'l', col='red')
#plot the fft data
plot(df.ft$wf, abs(df.ft$fy), xlim = c(-5, 5), type = 'b')
#fit the data
v <- c(100, 2, 0.15)
obj.func <- function(v){
  Y1 <- lorentz(X=df.ft$wf, amp = v[1], x_0 = v[2], gamm = v[3])
  df.wts <- table.func(X=df.ft$wf, BP = c(-5,5), H=c(0,1,0))
  SSE <- sum(df.wts$Y*(Y1 - abs(df.ft$fy))^2)
  return(SSE)
}
#plot both and set the initial guess v
df_strct <- data.frame(wf = df.ft$wf, Amp=lorentz(X=df.ft$wf, amp = v[1], x_0 = v[2], gamm = v[3]))
plot(df.ft$wf, abs(df.ft$fy), xlim = c(-5, 5), type = 'b')
lines(df_strct$wf, df_strct$Amp, col='red')
#optimize
opt.res <- optim(par = v, fn = obj.func)
#plot the fit function
df_fit <- data.frame(wf = df.ft$wf, Amp = lorentz(X=df.ft$wf, amp = opt.res$par[1], x_0 = opt.res$par[2], gamm = opt.res$par[3]))
plot(df.ft$wf, abs(df.ft$fy), xlim = c(-5, 5), type = 'b')
lines(df_fit$wf, df_fit$Amp, col='red')




#lambda = 0.2########################################
df.t <- data.lst$`lambda = 0.2`
df.ft <- fft.lst$`lambda = 0.2`
#plot the real versus imaginary data
plot(df.t$t, Re(df.t$Y), type = 'l', col='blue')
lines(df.t$t, Im(df.t$Y), type = 'l', col='red')
#plot the fft data
plot(df.ft$wf, abs(df.ft$fy), xlim = c(-5, 5), type = 'b')
#fit the data
v <- c(100, 2, 0.15)
obj.func <- function(v){
  Y1 <- lorentz(X=df.ft$wf, amp = v[1], x_0 = v[2], gamm = v[3])
  df.wts <- table.func(X=df.ft$wf, BP = c(-5,5), H=c(0,1,0))
  SSE <- sum(df.wts$Y*(Y1 - abs(df.ft$fy))^2)
  return(SSE)
}
#plot both and set the initial guess v
df_strct <- data.frame(wf = df.ft$wf, Amp=lorentz(X=df.ft$wf, amp = v[1], x_0 = v[2], gamm = v[3]))
plot(df.ft$wf, abs(df.ft$fy), xlim = c(-5, 5), type = 'b')
lines(df_strct$wf, df_strct$Amp, col='red')
#optimize
opt.res <- optim(par = v, fn = obj.func)
#plot the fit function
df_fit <- data.frame(wf = df.ft$wf, Amp = lorentz(X=df.ft$wf, amp = opt.res$par[1], x_0 = opt.res$par[2], gamm = opt.res$par[3]))
plot(df.ft$wf, abs(df.ft$fy), xlim = c(-5, 5), type = 'b')
lines(df_fit$wf, df_fit$Amp, col='red')


####The fitting works because you already have a spectral leakage owing to the Dirichlet kernel
