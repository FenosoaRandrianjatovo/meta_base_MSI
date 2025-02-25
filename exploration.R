# Source of the code: https://www.bioconductor.org/packages/release/bioc/vignettes/Cardinal/inst/doc/Cardinal3-guide.html
library(Cardinal)
library(ggplot2)
library(gridExtra)
library(grid)


# Online Working directory
# setwd("/home/fenosoa/scratch/Maya_Project/meta_base_MSI_data")

# Local wd
setwd("/Users/fenosoa/Downloads/Maya_Paper_2025/MetaBase_Data/")


# Load the data
path_nm <- "nm.imzML"
path_pm <-  "pm.imzML"
msa_nm <- readMSIData(path_nm)
msa_pm <- readMSIData(path_pm)


# Normalize intensities
msa_nm <- normalize(msa_nm, method = "tic")
# Perform baseline correction
msa_nm <- reduceBaseline(msa_nm)
# Smooth the spectra
msa_nm <- smoothSignal(msa_nm, method = "gaussian", sigma = 2)
# Peak picking
msa_nm <- peakPick(msa_nm, SNR = 6)
# Process the queued steps
msa_nm <- process(msa_nm)

# Normalize intensities
msa_pm <- normalize(msa_pm, method = "tic")
# Perform baseline correction
msa_pm <- reduceBaseline(msa_pm)
# Smooth the spectra
msa_pm <- smoothSignal(msa_pm, method = "gaussian", sigma = 2)
# Peak picking
msa_pm <- peakPick(msa_pm, SNR = 6)
# Process the queued steps
msa_pm <- process(msa_pm)



