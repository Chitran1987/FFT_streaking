rm(list=ls())
library(StatsChitran)
library(ImageMetrologyAnalysis)
ClearPlot()

#The original profile
X <- seq(-10, 10, by=0.01)
Y <- 0.25+0.25*sin(30*X)
df <- data.frame(X, Y)
plot(df$X, df$Y, type = 'l', col='blue', ylim = c(-1, 10))
fy <- fft_1D(X, Y)
plot(fy$freq, fy$Ampl, type = 'b', col='red', xlim = c(25, 35), ylim = c(0, 200))

#The zeropadded profile
df.z <- padding(X=df$X, Y=df$Y, fwd = 1, bwd = 1, pad.type = 'zero')
f.df.z <- fft_1D(X=df.z$X, Y=df.z$Y)
plot(f.df.z$freq, f.df.z$Ampl, type = 'b', col='blue', xlim = c(25, 35), ylim = c(0, 265))

#The soft plateau
#cutoff at 7
plat_7 <- sigmoid.plat(X=df.z$X, k = 10, left.cut = -7, right.cut = 7)
plat_7 <- data.frame(X=df.z$X, Y=plat_7)
plot(plat_7)
plat_7$Y <- plat_7$Y*df.z$Y + 10*plat_7$Y
plot(plat_7, type='l')
f.df.z.p7 <- fft_1D(plat_7$X, plat_7$Y)
lines(f.df.z.p7$freq, f.df.z.p7$Ampl, type = 'b', col='red', xlim = c(25, 35), ylim = c(0, 265))

#cutoff at 5
plat_5 <- sigmoid.plat(X=df.z$X, k = 10, left.cut = -5, right.cut = 5)
plat_5 <- data.frame(X=df.z$X, Y=plat_5)
plot(plat_5)
plat_5$Y <- plat_5$Y*df.z$Y + 10*plat_5$Y
plot(plat_5, type='l')
f.df.z.p5 <- fft_1D(plat_5$X, plat_5$Y)
lines(f.df.z.p5$freq, f.df.z.p5$Ampl, type = 'b', col='green', xlim = c(25, 35), ylim = c(0, 265))

#cutoff at 3
plat_3 <- sigmoid.plat(X=df.z$X, k = 10, left.cut = -3, right.cut = 3)
plat_3 <- data.frame(X=df.z$X, Y=plat_3)
plot(plat_3)
plat_3$Y <- plat_3$Y*df.z$Y + 10*plat_3$Y
plot(plat_3, type='l')
f.df.z.p3 <- fft_1D(plat_3$X, plat_3$Y)
lines(f.df.z.p3$freq, f.df.z.p3$Ampl, type = 'b', col='brown', xlim = c(25, 35), ylim = c(0, 265))

#cutoff at 1
plat_1 <- sigmoid.plat(X=df.z$X, k = 10, left.cut = -1, right.cut = 1)
plat_1 <- data.frame(X=df.z$X, Y=plat_1)
plot(plat_1)
plat_1$Y <- plat_1$Y*df.z$Y + 10*plat_1$Y
plot(plat_1, type='l')
f.df.z.p1 <- fft_1D(plat_1$X, plat_1$Y)
lines(f.df.z.p1$freq, f.df.z.p1$Ampl, type = 'b', col='brown', xlim = c(25, 35), ylim = c(0, 265))

#Now slice, normalize and plot the profiles together##############################################################
#################################################################
#####naming the list
fft_step <- vector(mode = 'list', length = 4)
names(fft_step) <- c('real_data', 'complete_fft', 'chopped_fft', 'chopped_normed_fft')
fft_step$real_data <- vector(mode = 'list', length = 5)
fft_step$complete_fft <- vector(mode = 'list', length = 5)
fft_step$chopped_fft <- vector(mode = 'list', length = 5)
fft_step$chopped_normed_fft <- vector(mode = 'list', length = 5)
names(fft_step$real_data) <- c('zero padded', 'step at 7', 'step at 5', 'step at 3', 'step at 1')
names(fft_step$complete_fft) <- c('zero padded', 'step at 7', 'step at 5', 'step at 3', 'step at 1')
names(fft_step$chopped_fft) <- c('zero padded', 'step at 7', 'step at 5', 'step at 3', 'step at 1')
names(fft_step$chopped_normed_fft) <- c('zero padded', 'step at 7', 'step at 5', 'step at 3', 'step at 1')

####placing the data within the list#############################
#fft_step$real_data
fft_step$real_data$`zero padded` <- df.z
fft_step$real_data$`step at 7` <- plat_7
fft_step$real_data$`step at 5` <- plat_5
fft_step$real_data$`step at 3` <- plat_3
fft_step$real_data$`step at 1` <- plat_1
#fft_step$complete_fft
fft_step$complete_fft$`zero padded` <- f.df.z
fft_step$complete_fft$`step at 7` <- f.df.z.p7
fft_step$complete_fft$`step at 5` <- f.df.z.p5
fft_step$complete_fft$`step at 3`<- f.df.z.p3
fft_step$complete_fft$`step at 1` <- f.df.z.p1
#fft_step$chopped
fft_step$chopped_fft$`zero padded` <- f.df.z[f.df.z$freq >= 25 & f.df.z$freq <= 35,]
fft_step$chopped_fft$`step at 7` <- f.df.z.p7[f.df.z.p7$freq >= 25 & f.df.z.p7$freq <= 35,]
fft_step$chopped_fft$`step at 5` <- f.df.z.p5[f.df.z.p5$freq >= 25 & f.df.z.p5$freq <= 35,]
fft_step$chopped_fft$`step at 3` <- f.df.z.p3[f.df.z.p3$freq >= 25 & f.df.z.p3$freq <= 35,]
fft_step$chopped_fft$`step at 1` <- f.df.z.p1[f.df.z.p1$freq >= 25 & f.df.z.p1$freq <= 35,]
#fft_step$chopped_norm
fft_step$chopped_normed_fft$`zero padded` <- fft_step$chopped_fft$`zero padded`
fft_step$chopped_normed_fft$`zero padded`$Ampl <- nrm(fft_step$chopped_normed_fft$`zero padded`$Ampl)
fft_step$chopped_normed_fft$`step at 7` <- fft_step$chopped_fft$`step at 7`
fft_step$chopped_normed_fft$`step at 7`$Ampl <- nrm(fft_step$chopped_normed_fft$`step at 7`$Ampl)
fft_step$chopped_normed_fft$`step at 5` <- fft_step$chopped_fft$`step at 5`
fft_step$chopped_normed_fft$`step at 5`$Ampl <- nrm(fft_step$chopped_normed_fft$`step at 5`$Ampl)
fft_step$chopped_normed_fft$`step at 3` <- fft_step$chopped_fft$`step at 3`
fft_step$chopped_normed_fft$`step at 3`$Ampl <- nrm(fft_step$chopped_normed_fft$`step at 3`$Ampl)
fft_step$chopped_normed_fft$`step at 1` <- fft_step$chopped_fft$`step at 1`
fft_step$chopped_normed_fft$`step at 1`$Ampl <- nrm(fft_step$chopped_normed_fft$`step at 1`$Ampl)

#Now save this file
save(fft_step, file = 'fft_only_on_island.rda')
