# MSI Lipidomic

##  Segmentation with spatial shrunken centroids (SSC)
 To automatically select  the peaks that distinguish each region, I have used  spatialShrunkenCentroids(), this is the plot.  [Source]
(https://bioconductor.org/packages/release/data/experiment/vignettes/CardinalWorkflows/inst/doc/MSI-segmentation.html#retrieving-the-top-mz-values)

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
