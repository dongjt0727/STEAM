% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_g.R
\name{get_g}
\alias{get_g}
\title{Estimate Number of Generations since Admixture}
\usage{
get_g(lacorr, start.a = 0, start.b = 1, start.g = 10)
}
\arguments{
\item{lacorr}{local ancestry correlation; data frame with 3 columns: theta = recomb frac; corr = correlation; anc = ancestry components (e.g., 1_1, 1_2, 1_3, 2_2, 2_3, 3_3)}

\item{start.a}{starting value for intercept; default = 0}

\item{start.b}{starting value for slope; default = 1}

\item{start.g}{starting value for g; default = 10}
}
\value{
A single number indicating the estimated number of generations since admixture.
}
\description{
Estimate the number of generations since admixture (g) from the
observed local ancestry correlation curves using non-linear
least squares regression. More details in Grinde et al. (TBD).
}
\examples{
get_g(lacorr = example_corr)
get_g(lacorr = example_corr_K3)

}
