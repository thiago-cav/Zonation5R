# Prepare the environment

Before diving into spatial prioritization with **Zonation 5**, make sure
your environment is properly set up and ready to go.

Here, you will learn how to:

- Install the Zonation 5 software on your computer,
- Install and load the **ZonationR** package, and
- Perform basic checks to ensure your setup is ready to run a
  prioritization analyses.

This setup is essential before moving on to more advanced workflows and
analyses.

### Install Zonation 5 Software

Before using **ZonationR**, you must install the **Zonation 5 software**
on your computer.

1.  Visit the Zonation 5 project site:
    [zonationteam.github.io](https://zonationteam.github.io/Zonation5/?utm_source=chatgpt.com)

2.  Download the appropriate installer or executable for your operating
    system (e.g., Windows installer, Linux AppImage).

3.  Install or unpack the software, and **note the installation path** —
    you’ll use it later when calling Zonation from R.

### Install the R Package

To install **ZonationR** from GitHub (development version):

``` r
if (!require(devtools)) install.packages("devtools")
devtools::install_github("thiago-cav/ZonationR")
```

Load the package:

``` r
library(ZonationR)
```

### Check Zonation Executable

Before running a full analysis, it’s good practice to verify that R can
find the Zonation 5 executable.

``` r
# Check that the executable is valid
check_zonation_executable()
```

If successful, this function will confirm that the path points to the
correct Zonation binary.

### Check input layers harmonization

Zonation analyses require that input feature layers (e.g., species
distribution rasters) share the same extent, resolution, and alignment.
**ZonationR** includes a helper function to **check** whether layers are
harmonized.

``` r
# Example feature files (placeholders)

# Check harmonization status of feature layers
```

This function reports if layers differ in extent, resolution, or
alignment, helping you identify mismatches before running Zonation and
avoiding potential errors.

### What’s Next?

Once installation and checks are done, you’re ready to:

- prepare Zonation input files using `create_feature_list()` and
  `create_settings_file()`,
- generate an executable call with `create_zonation5_call()`, and
- run a prioritization with `run_zonation5()`.

You can explore these in subsequent vignettes focused on **workflow
examples**.

### Further Reading

If you’re new to spatial conservation prioritization, check out these
resources:

- The **Zonation 5 manual** — detailed instructions and explanations of
  prioritization settings.
  ([zonationteam.github.io](https://zonationteam.github.io/Zonation5))
