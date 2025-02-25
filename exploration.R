# Source of the code: https://www.bioconductor.org/packages/release/bioc/vignettes/Cardinal/inst/doc/Cardinal3-guide.html
library(Cardinal)
library(ggplot2)
library(gridExtra)
library(grid)


# Online Working directory
# setwd("/home/fenosoa/scratch/Maya_Project/meta_base_MSI_data")

# Local wd
setwd("/Users/fenosoa/Downloads/Maya_Paper_2025/MetaBase_Data/")



path_nm <- "nm.imzML"
path_pm <-  "pm.imzML"
msa_nm <- readMSIData(path_nm)
msa_pm <- readMSIData(path_pm)


spectraData(msa_nm)

p <- image(msa_pm, i=11, j=11, zlim=c(0, 1e5), main="Positive Mode")
p
png(file="msa_pm.png", width=480, height=480)
dev.off()


