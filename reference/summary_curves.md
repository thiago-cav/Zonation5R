# Plot summary performance curves from Zonation output

This function reads a Zonation summary curves file and plots one or more
summary metrics against the priority rank. The output is a ggplot
object, which can be further customized by the user. Optionally, the
plot can be saved to disk as a high-quality figure.

## Usage

``` r
summary_curves(
  data_path,
  metrics,
  facet = FALSE,
  save_path = NULL,
  dpi = 300,
  width = 8,
  height = 6
)
```

## Arguments

- data_path:

  Character. Path to the Zonation output file (`summary_curves.csv`).

- metrics:

  Character vector. Names of the summary metrics to plot. Metrics can be
  overlaid only if they share the same units and value range.
  Fraction-based metrics can be overlaid together, while
  `remaining_area` and `remaining_cost` cannot be overlaid with other
  metrics.

- facet:

  Logical. If TRUE, metrics are plotted in separate panels. This should
  be used when plotting metrics with different units or value ranges.
  Default is FALSE.

- save_path:

  Character. Optional file path to save the plot. The file format is
  inferred from the file extension (e.g. ".tiff").

- dpi:

  Numeric. Resolution (dots per inch) for saved figures. Default is 300.

- width:

  Numeric. Width of the saved figure in inches. Default is 8.

- height:

  Numeric. Height of the saved figure in inches. Default is 6.

## Value

A `ggplot` object visualizing one or more Zonation summary metrics
plotted against priority rank.

## Examples

``` r
if (FALSE) { # \dontrun{
## Overlaid plot
p <- summary_curves(
  data_path = "path/to/summary_curves.csv",
  metrics = c("mean", "max")
)

p + ggplot2::theme_classic()

## Plot area and cost in separate panels
summary_curves(
  data_path = "path/to/summary_curves.csv",
  metrics = c("remaining_area", "remaining_cost"),
  facet = TRUE
)
} # }
```
