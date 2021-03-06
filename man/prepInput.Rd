% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/genes.R
\name{prepInput}
\alias{prepInput}
\title{Prepares input gene list for \link[fedup]{runFedup}.}
\usage{
prepInput(setName, ...)
}
\arguments{
\item{setName}{(char) character vector naming gene vectors passed to
\code{...} (must include "background" (case sensitive)).}

\item{...}{(char) \code{n} vectors with at least one background set of genes
and any number of test genes.}
}
\value{
List of length \code{n} with gene vectors corresponding to those
passed to \code{...}.
}
\description{
This function takes any number of test genes and a common
background set of genes and properly formats them for to pass to
\link[fedup]{runFedup} \code{gene} argument.
}
\examples{
# Raw gene data file
genesFile <- system.file("extdata",
    "NIHMS1587165-supplement-1587165_Sup_Tab_2.txt", package = "fedup")
genes <- read.delim(genesFile, h = TRUE, as.is = TRUE)
# Prepare gene vectors
b <- unique(genes[, "gene"])
set1 <- unique(genes[which(genes$FASN_merge < -0.4), "gene"])
set2 <- unique(genes[which(genes$FASN_merge > 0.4), "gene"])
setName <- c("background", "negative", "positive")
# Generate input list with background genes and two test set of genes
geneDouble <- prepInput(setName, b, set1, set2)
}
