rm(list = ls())
library(ImageMetrologyAnalysis)
library(StatsChitran)
ClearPlot()

load('IsotropicLattice.rda')

#full lattice
plot2D.arr(arr = Isotropic.latt.reduction$`real data`$full_latt)
svg(filename = 'Isotropic/full_latt.svg', width = 8, height = 8)
plot2D.arr(arr = Isotropic.latt.reduction$`real data`$full_latt)
dev.off()
#fft full lattice
plot2D.arr(arr = Isotropic.latt.reduction$`fft zoom`$full_latt)
svg(filename = 'Isotropic/fft_full_latt.svg', width = 8, height = 8)
plot2D.arr(arr = Isotropic.latt.reduction$`fft zoom`$full_latt)
dev.off()

#sized by 2
plot2D.arr(arr = Isotropic.latt.reduction$`real data`$latt_cut2)
svg(filename = 'Isotropic/latt_cut2.svg', width = 8, height = 8)
plot2D.arr(arr = Isotropic.latt.reduction$`real data`$latt_cut2)
dev.off()
#fft sized by 2
plot2D.arr(arr = Isotropic.latt.reduction$`fft zoom`$latt_cut2)
svg(filename = 'Isotropic/fft_latt_cut2.svg', width = 8, height = 8)
plot2D.arr(arr = Isotropic.latt.reduction$`fft zoom`$latt_cut2)
dev.off()

#sized by 4
plot2D.arr(arr = Isotropic.latt.reduction$`real data`$latt_cut4)
svg(filename = 'Isotropic/latt_cut4.svg', width = 8, height = 8)
plot2D.arr(arr = Isotropic.latt.reduction$`real data`$latt_cut4)
dev.off()
#fft sized by 4
plot2D.arr(arr = Isotropic.latt.reduction$`fft zoom`$latt_cut4)
svg(filename = 'Isotropic/fft_latt_cut4.svg', width = 8, height = 8)
plot2D.arr(arr = Isotropic.latt.reduction$`fft zoom`$latt_cut4)
dev.off()

#sized by 6
plot2D.arr(arr = Isotropic.latt.reduction$`real data`$latt_cut6)
svg(filename = 'Isotropic/latt_cut6.svg', width = 8, height = 8)
plot2D.arr(arr = Isotropic.latt.reduction$`real data`$latt_cut6)
dev.off()
#fft sized by 6
plot2D.arr(arr = Isotropic.latt.reduction$`fft zoom`$latt_cut6)
svg(filename = 'Isotropic/fft_latt_cut6.svg', width = 8, height = 8)
plot2D.arr(arr = Isotropic.latt.reduction$`fft zoom`$latt_cut6)
dev.off()

#sized by 8
plot2D.arr(arr = Isotropic.latt.reduction$`real data`$latt_cut8)
svg(filename = 'Isotropic/latt_cut8.svg', width = 8, height = 8)
plot2D.arr(arr = Isotropic.latt.reduction$`real data`$latt_cut8)
dev.off()
#fft sized by 8
plot2D.arr(arr = Isotropic.latt.reduction$`fft zoom`$latt_cut8)
svg(filename = 'Isotropic/fft_latt_cut8.svg', width = 8, height = 8)
plot2D.arr(arr = Isotropic.latt.reduction$`fft zoom`$latt_cut8)
dev.off()
