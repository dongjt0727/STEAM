---
output:
  md_document:
    variant: markdown_github
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



**Author:** Kelsey Grinde

# Introduction

STEAM is an R package which contains various functions relevant to estimating genome-wide significance thresholds for admixture mapping studies. 

This package is under active development. Please stay tuned for future updates!

# Examples

## Analytic Approximation

For an admixture mapping study in an admixed population with two ancestral populations (e.g., African Americans), we can use an analytic approximation to the family-wise error rate to quickly compute a genome-wide significance threshold for our study. 

Suppose you are conducting an admixture mapping study in an admixed population with 6 generations since admixture, with markers spaced every 0.2 cM (on average) across 22 chromosomes of total length 3500 cM. To estimate the p-value threshold which will control the family-wise error rate for this study at the 0.05 level, use the following command:


```r
get_thresh_analytic(g = 6, delt = 0.2, L = 3500, type = "pval")
#> Error in get_thresh_analytic(g = 6, delt = 0.2, L = 3500, type = "pval"): could not find function "get_thresh_analytic"
```

## Test Statistic Simualtion

Coming soon!

## Estimating the Number of Generations since Admixture

Coming soon!
