# Plot coverage distribution at a given rank

This function reads a Zonation feature curves file and plots the
distribution of feature coverage values at a specified priority rank.
The output is a ggplot object, which can be further customized by the
user. Optionally, the plot can be saved to disk as a high-quality
figure.

## Usage

``` r
coverage_distribution(
  data_path,
  target_rank,
  save_path = NULL,
  dpi = 300,
  width = 8,
  height = 6
)
```

## Arguments

- data_path:

  Character. Path to the Zonation output CSV file (`feature_curves.csv`)
  containing feature curves.

- target_rank:

  Numeric. The rank value at which coverage distributions should be
  extracted and plotted.

- save_path:

  Character. Optional file path to save the plot. The file format is
  inferred from the specified extension (e.g. ".tiff").

- dpi:

  Numeric. Resolution (dots per inch) for saved figures. Default is 300.

- width:

  Numeric. Width of the saved figure in inches. Default is 8.

- height:

  Numeric. Height of the saved figure in inches. Default is 6.

## Value

A `ggplot` object showing the distribution of feature coverage values at
the specified priority rank.

## Examples

``` r
if (FALSE) { # \dontrun{
p <- coverage_distribution(
  data_path = "C:/path/to/feature_curves.csv",
  target_rank = 0.9
)

p + ggplot2::theme_classic()

coverage_distribution(
  data_path = "C:/path/to/feature_curves.csv",
  target_rank = 0.9,
  save_path = "coverage_histogram.png"
)
} # }
```
