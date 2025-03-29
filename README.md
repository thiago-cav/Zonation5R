Zonation5R
================

- [Overview](#overview)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Author](#author)

## Overview

*Zonation5R* is an R package that provides an interface to easily
integrate and execute Zonation 5 software directly from R. It enables
efficient spatial prioritization workflows with enhanced reproducibility
and automation.

## Installation

You can install the development version of *Zonation5R* from GitHub
using:

``` r
# install.packages("remotes")
# remotes::install_github("thiago-cav/Zonation5R")
```

## Usage

Once installed, you can load the package and start using it as follows:

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
                    output_dir = "path/to/output",
                    weight = c(0.1, 0.2, 0.3),
                    threshold = 0.5)
```

## Contributing

Contributions are welcome! Please submit issues and pull requests via
[GitHub](https://github.com/thiago-cav/Zonation5R/issues).

## License

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)  
This package is licensed under the MIT License. See the
[LICENSE](LICENSE) file for details.

## Author

Thiago Cavalcante  
ORCID: [0000-0001-5357-9659](https://orcid.org/0000-0001-5357-9659)  
Email: <thiagocav.ferreira@gmail.com>, <thiago.cavalcante@helsinki.fi>
