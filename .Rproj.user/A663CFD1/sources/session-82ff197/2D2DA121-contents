rm(list=ls())
library(StatsChitran)
library(ImageMetrologyAnalysis)
ClearPlot()

#create the rectangular lattice
#pure lattice
X <- seq(0, 20, by=0.05)
Y <- X
rec_latt <- rect.latt(X, Y, R.latt.x = 0.454, R.latt.y = 0.475, A=1, sig = 0.1)

#Truncate lattice anisotropically
#cutoff = 2 from edge
sig2D <- sigmoid.2D.plat(X, Y, k=8, x.left = 2, x.right = 18, y.left = 0, y.right = 20)
rec_latt_cut2 <- rec_latt
rec_latt_cut2[,,1] <- rec_latt_cut2[,,1]*sig2D
plot2D.arr(arr = rec_latt_cut2)

#cutoff = 4 from edge
sig2D <- sigmoid.2D.plat(X, Y, k=8, x.left = 4, x.right = 16, y.left = 0, y.right = 20)
rec_latt_cut4 <- rec_latt
rec_latt_cut4[,,1] <- rec_latt_cut4[,,1]*sig2D
plot2D.arr(arr = rec_latt_cut4)

#cutoff = 6 from edge
sig2D <- sigmoid.2D.plat(X, Y, k=8, x.left = 6, x.right = 14, y.left = 0, y.right = 20)
rec_latt_cut6 <- rec_latt
rec_latt_cut6[,,1] <- rec_latt_cut6[,,1]*sig2D
plot2D.arr(arr = rec_latt_cut6)

#cutoff = 8 from edge
sig2D <- sigmoid.2D.plat(X, Y, k=8, x.left = 8, x.right = 12, y.left = 0, y.right = 20)
rec_latt_cut8 <- rec_latt
rec_latt_cut8[,,1] <- rec_latt_cut8[,,1]*sig2D
plot2D.arr(arr = rec_latt_cut8)

#plot complete fft of lattice
#pure lattice
rec_latt_fft <- fft_2D(tens = rec_latt, pl = 'amp')
rec_latt_fft.zoom <- plot2D.zoom(arr = rec_latt_fft[[1]], center = c(0,0), Del_X = 40, Del_Y = 40)

#cutoff = 2 from edge
rec_latt_fft_cut2 <- fft_2D(tens = rec_latt_cut2, pl = 'amp')
rec_latt_fft.zoom_cut2 <- plot2D.zoom(arr = rec_latt_fft_cut2[[1]], center = c(0,0), Del_X = 40, Del_Y = 40)

#cutoff = 4 from edge
rec_latt_fft_cut4 <- fft_2D(tens = rec_latt_cut4, pl = 'amp')
rec_latt_fft.zoom_cut4 <- plot2D.zoom(arr = rec_latt_fft_cut4[[1]], center = c(0,0), Del_X = 40, Del_Y = 40)

#cutoff = 6 from edge
rec_latt_fft_cut6 <- fft_2D(tens = rec_latt_cut6, pl = 'amp')
rec_latt_fft.zoom_cut6 <- plot2D.zoom(arr = rec_latt_fft_cut6[[1]], center = c(0,0), Del_X = 40, Del_Y = 40)

#cutoff = 8 from edge
rec_latt_fft_cut8 <- fft_2D(tens = rec_latt_cut8, pl = 'amp')
rec_latt_fft.zoom_cut8 <- plot2D.zoom(arr = rec_latt_fft_cut8[[1]], center = c(0,0), Del_X = 40, Del_Y = 40)

#save these profiles in a rda file
#structure and naming
Anisotropic.reduction <- vector(mode = 'list', length = 3)
names(Anisotropic.reduction) <- c('real data', 'fft', 'fft zoom')
Anisotropic.reduction$`real data` <- vector(mode = 'list', length = 5)
Anisotropic.reduction$fft <- vector(mode = 'list', length = 5)
Anisotropic.reduction$`fft zoom` <- vector(mode = 'list', length = 5)
name_vec <- c('full_latt', 'latt_cut2', 'latt_cut4', 'latt_cut6', 'latt_cut8')
names(Anisotropic.reduction$`real data`) <- name_vec
names(Anisotropic.reduction$fft) <- name_vec
names(Anisotropic.reduction$`fft zoom`) <- name_vec

#place the structure
#real data
Anisotropic.reduction$`real data`$full_latt <- rec_latt
Anisotropic.reduction$`real data`$latt_cut2 <- rec_latt_cut2
Anisotropic.reduction$`real data`$latt_cut4 <- rec_latt_cut4
Anisotropic.reduction$`real data`$latt_cut6 <- rec_latt_cut6
Anisotropic.reduction$`real data`$latt_cut8 <- rec_latt_cut8
#fft
Anisotropic.reduction$fft$full_latt <- rec_latt_fft
Anisotropic.reduction$fft$latt_cut2 <- rec_latt_fft_cut2
Anisotropic.reduction$fft$latt_cut4 <- rec_latt_fft_cut4
Anisotropic.reduction$fft$latt_cut6 <- rec_latt_fft_cut6
Anisotropic.reduction$fft$latt_cut8 <- rec_latt_fft_cut8
#fft_zoom
Anisotropic.reduction$`fft zoom`$full_latt <- rec_latt_fft.zoom
Anisotropic.reduction$`fft zoom`$latt_cut2 <- rec_latt_fft.zoom_cut2
Anisotropic.reduction$`fft zoom`$latt_cut4 <- rec_latt_fft.zoom_cut4
Anisotropic.reduction$`fft zoom`$latt_cut6 <- rec_latt_fft.zoom_cut6
Anisotropic.reduction$`fft zoom`$latt_cut8 <- rec_latt_fft.zoom_cut8

#save the data
save(Anisotropic.reduction, file = 'AnisotropicLattice.rda')
