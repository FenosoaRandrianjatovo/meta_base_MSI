# Source of the code: https://www.bioconductor.org/packages/release/bioc/vignettes/Cardinal/inst/doc/Cardinal3-guide.html
library(Cardinal)

# Online Working directory
# setwd("/home/fenosoa/scratch/Maya_Project/meta_base_MSI_data")

# Local wd
setwd("/Users/fenosoa/Downloads/Maya_Paper_2025/MetaBase_Data/")



path_nm <- "nm.imzML"
path_pm <-  "pm.imzML"
msa_nm <- readMSIData(path_nm)
msa_pm <- readMSIData(path_pm)
#  dim(msa_nm)==dim(msa_pm)
# [1] 20000 13961

spectraData(msa_nm)
p <- image(msa_pm, i=1978)
p
ggsave("Image.png", plot = p , width = 20, height = 15, dpi = 300)


