# All the Credits goes to Kylie Ariel Bemis and Dan Guo

library(Cardinal)

setwd("/home/fenosoa/scratch/Maya_Project/meta_base_MSI_data")

# Load the data
path_nm <- "nm.imzML"
path_pm <-  "pm.imzML"
msa_nm <- readMSIData(path_nm)
msa_pm <- readMSIData(path_pm)
