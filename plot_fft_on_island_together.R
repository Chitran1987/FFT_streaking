rm(list = ls())
library(StatsChitran)
library(ImageMetrologyAnalysis)

###load the relevant file
load('fft_only_on_island.rda')
plot(fft_step$chopped_normed_fft$`zero padded`$freq, fft_step$chopped_normed_fft$`zero padded`$Ampl, type='l', col=rgb(0,0,1), xlim = c(28, 32), lwd=2)
lines(fft_step$chopped_normed_fft$`step at 7`$freq, fft_step$chopped_normed_fft$`step at 7`$Ampl, type = 'l', col = rgb(0.25,0,0.75), lwd = 2)
lines(fft_step$chopped_normed_fft$`step at 5`$freq, fft_step$chopped_normed_fft$`step at 5`$Ampl, type = 'l', col = rgb(0.5, 0, 0.5), lwd = 2)
lines(fft_step$chopped_normed_fft$`step at 3`$freq, fft_step$chopped_normed_fft$`step at 3`$Ampl, type = 'l', col = rgb(0.75,0,0.25), lwd = 2)
lines(fft_step$chopped_normed_fft$`step at 1`$freq, fft_step$chopped_normed_fft$`step at 1`$Ampl, type = 'l', col = rgb(1.0,0,0), lwd = 2)
