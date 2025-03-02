# MSI Lipidomic

# Spatial Analysis of MSI Data Using `spatialShrunkenCentroids()` in Cardinal (R)

This repository demonstrates how to apply spatially-aware clustering using the `spatialShrunkenCentroids()` function from the **Cardinal** package in R for Mass Spectrometry Imaging (MSI) data.

## 📌 Overview

The `spatialShrunkenCentroids()` method performs **spatially-regularized nearest shrunken centroids classification**, which enhances spatial coherence and reduces noise in MSI datasets. 

### ✨ Key Features

- **Incorporates spatial context** to improve classification accuracy.
- **Adaptive weighting** for neighbor influence during classification.
- **Shrunken centroids classification** to reduce noise and improve stability.
- **Supports feature selection** through regularization.

---

## 🛠 Installation

Ensure you have **Cardinal** installed:

```r
install.packages("Cardinal")
```
Make sure that the ```pm.imzML``` and ```pm.ibd``` are in the same directory
```r
msa_pm <- readMSIData("pm.imzML")

#Computes summary statistics for spectral features.
msa_pm <- summarizeFeatures(msa_pm, c(Mean="mean"))

#Computes total ion count (TIC) for each pixel.
msa_pm <- summarizePixels(msa_pm, c(TIC="sum"))

#Apply spatially-aware nearest shrunken centroids classification
msa_pm_peaks_ssc <- spatialShrunkenCentroids(msa_pm_peaks,
                                       weights="adaptive", #  adaptive weights for spatial influence.
                                       r=2, #spatial neighborhood radius.
                                       k=8, #The number of clusters
                                       s=2^(1:6) #the range of shrinkage parameters
)

tiff(filename = "images/msa_pm_peaks_ssc.tiff", width = 15000, height = 12000, res = 3000)
par(mar = c(4, 4, 2, 1))
image(msa_pm_peaks_ssc, i = 3:6)
dev.off()
```

[Source](https://bioconductor.org/packages/release/data/experiment/vignettes/CardinalWorkflows/inst/doc/MSI-segmentation.html#retrieving-the-top-mz-values)

 

- In this case we have tried to segment 8; empty segments are dropped,

 

![NMF fro 3 Components](https://github.com/FenosoaRandrianjatovo/meta_base_MSI/blob/main/images/msa_pm_ssc_.png)


## Non-negative matrix factorization (NMF)

![NMF fro 3 Components](https://github.com/FenosoaRandrianjatovo/meta_base_MSI/blob/main/images/NMF_ncomp_3_pm.png)

![NMF fro 5 Components](https://github.com/FenosoaRandrianjatovo/meta_base_MSI/blob/main/images/NMF_ncomp_5_pm.png)

![NMF fro 6 Components](https://github.com/FenosoaRandrianjatovo/meta_base_MSI/blob/main/images/NMF_ncomp_6_pm.png)

![NMF fro 10 Components](https://github.com/FenosoaRandrianjatovo/meta_base_MSI/blob/main/images/NMF_ncomp_10_pm.png) 

## PCA

![PCA for 2 Components](https://github.com/FenosoaRandrianjatovo/meta_base_MSI/blob/main/images/msa_nm_pca.png)



## Visualization for a random picked m/z






![mz for 810.3459](https://github.com/FenosoaRandrianjatovo/meta_base_MSI/blob/main/images/msa_nm_ion_image.png)

![mz for 215](https://github.com/FenosoaRandrianjatovo/meta_base_MSI/blob/main/images/msa_nm_ion_image_mz_215.png)




### Feference of code source 

[Cardinalmsi](https://cardinalmsi.org/)

[Classification](https://bioconductor.org/packages/release/data/experiment/vignettes/CardinalWorkflows/inst/doc/MSI-classification.html)

[Introduction](https://www.aspect-analytics.com/media-blog/introduction-to-mass-spectrometry-imaging-data-analysis)
