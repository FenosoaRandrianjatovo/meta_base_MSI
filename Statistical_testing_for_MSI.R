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
