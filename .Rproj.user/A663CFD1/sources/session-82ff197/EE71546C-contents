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
sig2D <- sigmoid.2D.plat(X, Y, k=8, x.left = 0, x.right = 20, y.left = 2, y.right = 18)
rec_latt_cut2 <- rec_latt
rec_latt_cut2[,,1] <- rec_latt_cut2[,,1]*sig2D
plot2D.arr(arr = rec_latt_cut2)

#cutoff = 4 from edge
sig2D <- sigmoid.2D.plat(X, Y, k=8, x.left = 0, x.right = 20, y.left = 4, y.right = 16)
rec_latt_cut4 <- rec_latt
rec_latt_cut4[,,1] <- rec_latt_cut4[,,1]*sig2D
plot2D.arr(arr = rec_latt_cut4)

#cutoff = 6 from edge
sig2D <- sigmoid.2D.plat(X, Y, k=8, x.left = 0, x.right = 20, y.left = 6, y.right = 14)
rec_latt_cut6 <- rec_latt
rec_latt_cut6[,,1] <- rec_latt_cut6[,,1]*sig2D
plot2D.arr(arr = rec_latt_cut6)

#cutoff = 8 from edge
sig2D <- sigmoid.2D.plat(X, Y, k=8, x.left = 0, x.right = 20, y.left = 8, y.right = 12)
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
Anisotropic.reduction.Y <- vector(mode = 'list', length = 3)
names(Anisotropic.reduction.Y) <- c('real data', 'fft', 'fft zoom')
Anisotropic.reduction.Y$`real data` <- vector(mode = 'list', length = 5)
Anisotropic.reduction.Y$fft <- vector(mode = 'list', length = 5)
Anisotropic.reduction.Y$`fft zoom` <- vector(mode = 'list', length = 5)
name_vec <- c('full_latt', 'latt_cut2', 'latt_cut4', 'latt_cut6', 'latt_cut8')
names(Anisotropic.reduction.Y$`real data`) <- name_vec
names(Anisotropic.reduction.Y$fft) <- name_vec
names(Anisotropic.reduction.Y$`fft zoom`) <- name_vec

#place the structure
#real data
Anisotropic.reduction.Y$`real data`$full_latt <- rec_latt
Anisotropic.reduction.Y$`real data`$latt_cut2 <- rec_latt_cut2
Anisotropic.reduction.Y$`real data`$latt_cut4 <- rec_latt_cut4
Anisotropic.reduction.Y$`real data`$latt_cut6 <- rec_latt_cut6
Anisotropic.reduction.Y$`real data`$latt_cut8 <- rec_latt_cut8
#fft
Anisotropic.reduction.Y$fft$full_latt <- rec_latt_fft
Anisotropic.reduction.Y$fft$latt_cut2 <- rec_latt_fft_cut2
Anisotropic.reduction.Y$fft$latt_cut4 <- rec_latt_fft_cut4
Anisotropic.reduction.Y$fft$latt_cut6 <- rec_latt_fft_cut6
Anisotropic.reduction.Y$fft$latt_cut8 <- rec_latt_fft_cut8
#fft_zoom
Anisotropic.reduction.Y$`fft zoom`$full_latt <- rec_latt_fft.zoom
Anisotropic.reduction.Y$`fft zoom`$latt_cut2 <- rec_latt_fft.zoom_cut2
Anisotropic.reduction.Y$`fft zoom`$latt_cut4 <- rec_latt_fft.zoom_cut4
Anisotropic.reduction.Y$`fft zoom`$latt_cut6 <- rec_latt_fft.zoom_cut6
Anisotropic.reduction.Y$`fft zoom`$latt_cut8 <- rec_latt_fft.zoom_cut8

#save the data
save(Anisotropic.reduction.Y, file = 'AnisotropicLatticeAlongY.rda')
