# Source of the code: https://www.bioconductor.org/packages/release/bioc/vignettes/Cardinal/inst/doc/Cardinal3-guide.html
library(Cardinal)
library(ggplot2)
library(gridExtra)
library(grid)


# Online Working directory
# setwd("/home/fenosoa/scratch/Maya_Project/meta_base_MSI_data")

# Local wd
setwd("/Users/fenosoa/Downloads/Maya_Paper_2025/MetaBase_Data/meta_base_MSI")


# Load the data
path_nm <- "nm.imzML"
path_pm <-  "pm.imzML"
msa_nm <- readMSIData(path_nm)
msa_pm <- readMSIData(path_pm)






featureData(msa_nm)

# Open a PNG device
png(filename = "msa_nm_plot.png", width = 1000, height = 800, res = 100)

# Generate the plot
image(msa_nm, "run", layout = c(2, 4), free = "xy", col = dpal("Set1"))

# Close the PNG device
dev.off()



summarizePixels(msa_nm, stat=c(TIC="sum"))

# Ion images for m/z 810.36
png(filename = "images/msa_pm_ion_image.png", width = 1000, height = 800, res = 100)
image(msa_pm, mz=810.36,  free="xy",
    smooth="bilateral", enhance="histogram", scale=TRUE)
dev.off()

png(filename = "images/msa_nm_ion_image_mz_215.png", width = 1000, height = 800, res = 100)
image(msa_nm, mz=215.24, free="xy",
    smooth="bilateral", enhance="histogram", scale=TRUE)
dev.off()

# Principal components analysis (PCA)
msa_nm_pca <- PCA(msa_nm, ncomp=2)
png(filename = "images/msa_nm_pca.png", width = 1000, height = 800, res = 100)
image(msa_nm_pca, type="x",  free="xy", scale=TRUE)
dev.off()



set.seed(1)
msa_pm_ssc <- spatialShrunkenCentroids(msa_pm,
                                       weights="adaptive", r=2, k=8, s=2^(1:6))
save(msa_pm_ssc,"msa_pm_ssc.RData" )
path<- "msa_pm_ssc.RData"
temp_env <- new.env()
print("xenium.obj :   Loading begin")
load(path, envir = temp_env)
msa_pm_ssc <- temp_env$msa_pm_ssc



png(filename = "images/msa_pm_msa_pm_ssc.png", width = 1000, height = 800, res = 100)
image(msa_pm_ssc,  i=3:6, scale=TRUE)
dev.off()

#Non-negative matrix factorization (NMF)
#https://bioconductor.org/packages/release/data/experiment/vignettes/CardinalWorkflows/inst/doc/MSI-segmentation.html#retrieving-the-top-mz-values


msa_pm <- summarizeFeatures(msa_pm, c(Mean="mean"))

png(filename = "images/summarizeFeatures_pm.png", width = 1000, height = 800, res = 100)
plot(msa_pm, "Mean", xlab="m/z", ylab="Intensity")
dev.off()

msa_pm <- summarizePixels(msa_pm, c(TIC="sum"))
png(filename = "images/summarizePixels_pm.png", width = 1000, height = 800, res = 100)
image(msa_pm, "TIC")
dev.off()

msa_pm_peaks <- msa_pm |>
  normalize(method="tic") |>
  peakProcess(SNR=3, sampleSize=0.1,
              tolerance=0.5, units="mz")

msa_pm_nmf <- NMF(msa_pm_peaks, ncomp=3, niter=30)
png(filename = "images/NMF_ncomp_3_pm.png", width = 1000, height = 800, res = 100)
image(msa_pm_nmf, smooth="adaptive", enhance="histogram")
dev.off()

#Segmentation with spatial shrunken centroids (SSC)

set.seed(1)
msa_pm_peaks_ssc <- spatialShrunkenCentroids(msa_pm_peaks,
                                       weights="adaptive", r=2, k=8, s=2^(1:6))

png(filename = "images/msa_pm_peaks_ssc.png", width = 1000, height = 800, res = 100)
image(msa_pm_peaks_ssc, i=3:6)
dev.off()












