# All the Credits goes to Kylie Ariel Bemis and Dan Guo

library(Cardinal)

setwd("/home/fenosoa/scratch/Maya_Project/meta_base_MSI_data")

# Load the data
path_nm <- "nm.imzML"
path_pm <-  "pm.imzML"
msa_nm <- readMSIData(path_nm)
msa_pm <- readMSIData(path_pm)

# Pre-processing for msa_pm
msa_pm <- summarizePixels(msa_pm, stat=c(TIC="sum"))

# We will normalize the TIC, perform peak picking on a sample of 10% of all mass spectra to create a set of reference peaks, 
# and then summarize these reference peaks in every spectrum.
msa_pm_peaks <- msa_pm |>
    normalize(method="tic") |>
    peakProcess(SNR=3, sampleSize=0.1, filterFreq=0.2,
        tolerance=0.5, units="mz")

# 2.1.1Non-specific filtering to reduce data size
# In order to reduce the size of the dataset further (because the computation we are working toward can be time consuming), we will perform non-specific filtering.

# This means filtering our peaks based on a summary statistic unrelated to the condition. We will use the variance.
msa_pm_peaks <- summarizeFeatures(msa_pm_peaks, stat=c(Variance="var"))

# Now we keep only the peaks above the top 80% quantile of variance among peaks.
msa_pm_peaks_80 <- subsetFeatures(msa_pm_peaks, Variance >= quantile(Variance, 0.8))

# This reduces the dataset msa_pm_peaks_80  to only 26 peaks.

# Segmentation with spatial Dirichlet Gaussian mixture model (DGMM)

set.seed(1)
msa_pm_peaks_80dgmm <- spatialDGMM(msa_pm_peaks_80, r=1, k=3, groups=msa_pm_peaks_80$run)

msa_pm_peaks_80dgmm













