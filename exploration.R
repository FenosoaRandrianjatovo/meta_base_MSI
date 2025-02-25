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

# Open a PNG device
png(filename = "msa_nm_plot.png", width = 1000, height = 800, res = 100)

# Generate the plot
image(msa_nm, "run", layout = c(2, 4), free = "xy", col = dpal("Set1"))

# Close the PNG device
dev.off()



summarizePixels(msa_nm, stat=c(TIC="sum"))

# Ion images for m/z 810.36
png(filename = "msa_nm_ion_image.png", width = 1000, height = 800, res = 100)
image(msa_nm, mz=810.36,  free="xy",
    smooth="bilateral", enhance="histogram", scale=TRUE)
dev.off()




