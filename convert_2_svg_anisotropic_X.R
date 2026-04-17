rm(list = ls())
library(ImageMetrologyAnalysis)
library(StatsChitran)
ClearPlot()

load('AnisotropicLattice.rda')

#full lattice
plot2D.arr(arr = Anisotropic.reduction$`real data`$full_latt)
svg(filename = 'Anisotropic_alongX/full_latt.svg', width = 8, height = 8)
plot2D.arr(arr = Anisotropic.reduction$`real data`$full_latt)
dev.off()
#fft full lattice
plot2D.arr(arr = Anisotropic.reduction$`fft zoom`$full_latt)
svg(filename = 'Anisotropic_alongX/fft_full_latt.svg', width = 8, height = 8)
plot2D.arr(arr = Anisotropic.reduction$`fft zoom`$full_latt)
dev.off()

#sized by 2
plot2D.arr(arr = Anisotropic.reduction$`real data`$latt_cut2)
svg(filename = 'Anisotropic_alongX/latt_cut2.svg', width = 8, height = 8)
plot2D.arr(arr = Anisotropic.reduction$`real data`$latt_cut2)
dev.off()
#fft sized by 2
plot2D.arr(arr = Anisotropic.reduction$`fft zoom`$latt_cut2)
svg(filename = 'Anisotropic_alongX/fft_latt_cut2.svg', width = 8, height = 8)
plot2D.arr(arr = Anisotropic.reduction$`fft zoom`$latt_cut2)
dev.off()

#sized by 4
plot2D.arr(arr = Anisotropic.reduction$`real data`$latt_cut4)
svg(filename = 'Anisotropic_alongX/latt_cut4.svg', width = 8, height = 8)
plot2D.arr(arr = Anisotropic.reduction$`real data`$latt_cut4)
dev.off()
#fft sized by 4
plot2D.arr(arr = Anisotropic.reduction$`fft zoom`$latt_cut4)
svg(filename = 'Anisotropic_alongX/fft_latt_cut4.svg', width = 8, height = 8)
plot2D.arr(arr = Anisotropic.reduction$`fft zoom`$latt_cut4)
dev.off()

#sized by 6
plot2D.arr(arr = Anisotropic.reduction$`real data`$latt_cut6)
svg(filename = 'Anisotropic_alongX/latt_cut6.svg', width = 8, height = 8)
plot2D.arr(arr = Anisotropic.reduction$`real data`$latt_cut6)
dev.off()
#fft sized by 6
plot2D.arr(arr = Anisotropic.reduction$`fft zoom`$latt_cut6)
svg(filename = 'Anisotropic_alongX/fft_latt_cut6.svg', width = 8, height = 8)
plot2D.arr(arr = Anisotropic.reduction$`fft zoom`$latt_cut6)
dev.off()

#sized by 8
plot2D.arr(arr = Anisotropic.reduction$`real data`$latt_cut8)
svg(filename = 'Anisotropic_alongX/latt_cut8.svg', width = 8, height = 8)
plot2D.arr(arr = Anisotropic.reduction$`real data`$latt_cut8)
dev.off()
#fft sized by 8
plot2D.arr(arr = Anisotropic.reduction$`fft zoom`$latt_cut8)
svg(filename = 'Anisotropic_alongX/fft_latt_cut8.svg', width = 8, height = 8)
plot2D.arr(arr = Anisotropic.reduction$`fft zoom`$latt_cut8)
dev.off()
