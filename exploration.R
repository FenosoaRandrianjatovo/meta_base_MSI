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

featureData(msa_nm)
plot(msa_nm, i=c(496, 1520))


dim(msa_nm)
dim(msa_pm)

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




# Extract m/z values from both datasets
mz_nm <- mz(msa_nm)
mz_pm <- mz(msa_pm)

# Compare m/z values
identical_mz <- identical(mz_nm, mz_pm)
if (identical_mz) {
  cat("The datasets have identical m/z values.\n")
} else {
  cat("The datasets have different m/z values.\n")
}

coords_nm <- coord(msa_nm)
coords_pm <- coord(msa_pm)

# Compare spatial coordinates
identical_coords <- identical(coords_nm, coords_pm)
if (identical_coords) {
  cat("The datasets have identical spatial coordinates.\n")
} else {
      cat("The datasets have different spatial coordinates.\n")
}



# Combine the datasets: this step requires that both datasets are perfectly aligned
combined_msa <- gtable_combine(msa_nm, msa_pm, along=dim(msa_pm)[2], method="average")
  




