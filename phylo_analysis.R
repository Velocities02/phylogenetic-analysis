R version 4.5.2 (2025-10-31) -- "[Not] Part in a Rumble"
Copyright (C) 2025 The R Foundation for Statistical Computing
Platform: aarch64-apple-darwin20

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> install.packages("BiocManager")
trying URL 'https://cran.rstudio.com/bin/macosx/big-sur-arm64/contrib/4.5/BiocManager_1.30.27.tgz'
Content type 'application/x-gzip' length 660755 bytes (645 KB)
==================================================
  downloaded 645 KB


The downloaded binary packages are in
/var/folders/26/h8vdj_zj7z74rxcwd4325x0h0000gn/T//RtmpdONvjg/downloaded_packages
> BiocManager::install("Biostrings")
'getOption("repos")' replaces Bioconductor standard repositories, see
'help("repositories", package = "BiocManager")' for details.
Replacement repositories:
  CRAN: https://cran.rstudio.com/
  Bioconductor version 3.22 (BiocManager 1.30.27), R 4.5.2 (2025-10-31)
Old packages: 'ade4', 'bit64', 'cpp11', 'curl', 'DelayedArray', 'devtools',
'dplyr', 'fracdiff', 'glue', 'highr', 'htmlTable', 'igraph', 'magrittr',
'Matrix', 'mvtnorm', 'nlme', 'openssl', 'pak', 'png', 'purrr', 'Rcpp',
'RcppArmadillo', 'rmarkdown', 'roxygen2', 'rpart', 'S4Vectors', 'S7',
'seqinr', 'SparseArray', 'tinytex', 'vctrs', 'vroom', 'xfun', 'XML'
Update all/some/none? [a/s/n]: BiocManager::install("DECIPHER")
Update all/some/none? [a/s/n]: 
  n
Warning message:
  package(s) not installed when version(s) same as or greater than current;
use `force = TRUE` to re-install: 'Biostrings' 

> library(Biostrings)
Loading required package: BiocGenerics
Loading required package: generics

Attaching package: ‘generics’

The following objects are masked from ‘package:base’:
  
  as.difftime, as.factor, as.ordered, intersect, is.element,
setdiff, setequal, union


Attaching package: ‘BiocGenerics’

The following objects are masked from ‘package:stats’:
  
  IQR, mad, sd, var, xtabs

The following objects are masked from ‘package:base’:
  
  anyDuplicated, aperm, append, as.data.frame, basename, cbind,
colnames, dirname, do.call, duplicated, eval, evalq, Filter,
Find, get, grep, grepl, is.unsorted, lapply, Map, mapply, match,
mget, order, paste, pmax, pmax.int, pmin, pmin.int, Position,
rank, rbind, Reduce, rownames, sapply, saveRDS, table, tapply,
unique, unsplit, which.max, which.min

Loading required package: S4Vectors
Loading required package: stats4

Attaching package: ‘S4Vectors’

The following object is masked from ‘package:utils’:
  
  findMatches

The following objects are masked from ‘package:base’:
  
  expand.grid, I, unname

Loading required package: IRanges
Loading required package: XVector
Loading required package: Seqinfo

Attaching package: ‘Biostrings’

The following object is masked from ‘package:base’:
  
  strsplit
> library(DECIPHER)
> # Read in megahit assembly results
  > allcontigs <- c()
> 
  > for(i in 1:6){
    +     contigs <- readDNAStringSet(paste0('~/Downloads/alex/t', i, '_out/final.contigs.fa'))
    +     allcontigs <- c(allcontigs, contigs)
    + }
> 
  > # Flatten list
  > allcontigs <- do.call(c, allcontigs)
> toalign <- allcontigs[which(nchar(allcontigs) > 5000)]
> names(toalign) <- 1:length(toalign)
> length(toalign)
[1] 6
> alignment <- AlignSeqs(toalign)
Determining distance matrix based on shared 11-mers:
  |===================================================================| 100%

Time difference of 0.09 secs

Clustering into groups by similarity:
  |===================================================================| 100%

Time difference of 0 secs

Aligning Sequences:
  |===================================================================| 100%

Time difference of 7.73 secs

Iteration 1 of 2:
  
  Determining distance matrix based on alignment:
  |===================================================================| 100%

Time difference of 0 secs

Reclustering into groups by similarity:
  |===================================================================| 100%

Time difference of 0 secs

Realigning Sequences:
  |===================================================================| 100%

Time difference of 0 secs

Alignment converged - skipping remaining iteration.

> BrowseSeqs(alignment)
> tree <- TreeLine(alignment, method = "ML", showPlot = TRUE)
Error in TreeLine(alignment, method = "ML", showPlot = TRUE) : 
  could not find function "TreeLine"

> tree <- TreeLine(alignment, method = "ML", showPlot = TRUE)
Error in TreeLine(alignment, method = "ML", showPlot = TRUE) : 
  could not find function "TreeLine"

> packageVersion("DECIPHER")
[1] ‘3.6.0’
> ls("package:DECIPHER", pattern = "Tree")
[1] "Treeline"
> tree <- Treeline(alignment, method = "ML", showPlot = TRUE)
Fitting initial tree to models:
  JC69  -ln(L) = 58847, AICc = 117712, BIC = 117782
K80   -ln(L) = 58845, AICc = 117711, BIC = 117789
F81   -ln(L) = 58365, AICc = 116755, BIC = 116849
HKY85 -ln(L) = 58365, AICc = 116757, BIC = 116859
T92   -ln(L) = 58366, AICc = 116754, BIC = 116840
TN93  -ln(L) = 58365, AICc = 116758, BIC = 116868
SYM   -ln(L) = 58839, AICc = 117706, BIC = 117816
GTR   -ln(L) = 58360, AICc = 116753, BIC = 116887

The selected model was:  GTR

Optimizing up to 400 candidate trees:
  Tree #40. -ln(L) = 58357.037 (0.000%), 2 Climbs                             

Finalizing the best tree (#40):
  -ln(L) = 58357.037 (0.000%), 0 Climbs                                       
  
  Model parameters:
    Frequency(A) = 0.293
  Frequency(C) = 0.207
  Frequency(G) = 0.207
  Frequency(T) = 0.293
  Rate A <-> C = 1.033
  Rate A <-> G = 1.043
  Rate A <-> T = 0.968
  Rate C <-> G = 1.180
  Rate C <-> T = 0.998
  Rate G <-> T = 1.000
  
  Time difference of 2.24 secs
  
  > 