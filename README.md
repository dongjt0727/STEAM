---
title: STEAM
author: Kelsey Grinde
date: 2018-11-16
output:
  md_document:
    variant: markdown_github
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



# Introduction

STEAM (Significance Threshold Estimation for Admixture Mapping) is an R package which contains various functions relevant to estimating genome-wide significance thresholds for admixture mapping studies. 

This package is under active development and we are in the process of submitting a manuscript which contains details regarding the methods implemented here. Please stay tuned for future updates!

# R Installation

To install this package, open an R session and run the following commands:


```r
##install.packages("devtools") # only run this line if you do not already have the devtools package installed
library(devtools)
install_github("kegrinde/STEAM")
```

# Examples

## Analytic Approximation

For an admixture mapping study in an admixed population with two ancestral populations (e.g., African Americans), we can use an analytic approximation to the family-wise error rate to quickly compute a genome-wide significance threshold for our study. 

Suppose you are conducting an admixture mapping study in an admixed population with 2 ancestral populations, 6 generations since admixture, and markers spaced every 0.2 cM (on average) across 22 chromosomes of total length 3520 cM. To estimate the *p*-value threshold which will control the family-wise error rate for this study at the 0.05 level, use the following command:


```r
get_thresh_analytic(g = 6, delt = 0.2, L = 3520, type = "pval")
#> [1] 1.875811e-05
```

## Test Statistic Simualtion

For admixed populations with more than two ancestral populations (e.g., Hispanics/Latinos), the analytic approximation approach is not applicable. Instead, we can simulate admixture mapping test statitics from their joint asymptotic distribution (under the null) to estimate a genome-wide significance threshold for our study. This approach is applicable for admixed populations with any number of ancestral populations ($K \ge 2$).

Suppose we are conducting an admixture mapping study in an admixed population with 2 ancestral populations, 6 generations since admixture, and markers spaced every 0.2 cM across 22 chromomomes, each of length 160 cM (for a total length of 3520 cM). Suppose as well that the admixture proportions in this population are unifiromly distributed. To estimate the *p*-value threshold which will control the family-wise error rate for this study at the 0.05 level, we can use the following command:


```r
# create example map
example_map <- data.frame(cM = rep(seq(0.2, 160, 0.2), times = 22), chr = rep(1:22, each = 800))

# create example data frame of admixture props
example_props <- data.frame(pop1 = runif(1000, 0, 1))
example_props$pop2 <- 1 - example_props$pop1

# get p-value threshold
set.seed(1)
get_thresh_simstat(g = 6, map = example_map, props = example_props, nreps = 50)
#> $threshold
#>          95% 
#> 2.692619e-05 
#> 
#> $ci
#>         2.5%        97.5% 
#> 7.357901e-05 1.981598e-06
```

In practice, we should increase the number of repetitions to a much larger number (we recommend 10,000). This will increase the computation time but yields more reliable significance threshold estimates.

## Estimating the Number of Generations since Admixture

Coming soon!
