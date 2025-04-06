Zonation5R
================

[![License: GPL
v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

*Zonation5R* is an R package that provides an interface to easily
integrate and execute Zonation 5 software directly from R. It enables
efficient spatial prioritization workflows with enhanced reproducibility
and automation. The package was also developed to support teaching and
learning, making it easier for R users to get started with Zonation 5
and learn spatial prioritization techniques.

## Installation

You can install the development version from GitHub using:

``` r
# install.packages("remotes")
# remotes::install_github("thiago-cav/Zonation5R")
```

### Usage

``` r
library(Zonation5R)
```

### Example

The **feature list** file is one of the most basic files required to run
Zonation. It provides the list of features included in the analysis and
their specific parameters. The `create_feature_list()` function
generates this from raster files in a specified directory and allows
users to include optional attributes based on their requirements.

``` r
# Example usage of the create_feature_list function
create_feature_list(spp_file_dir = "path/to/raster/files",
                    weight = c(0.1, 0.2, 0.3),
                    threshold = 0.5)
```

## Developers

Thiago Cavalcante  
ORCID: [0000-0001-5357-9659](https://orcid.org/0000-0001-5357-9659)  
Email: <thiago.cavalcante@helsinki.fi>

This package has been shaped by many trials and errors, and it is
constantly being refined. As such, contributions, suggestions, and
feedback are always welcome—after all, *“it doesn’t matter if your first
version isn’t perfect as long as the next version is better”*.
