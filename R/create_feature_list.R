#' Create a Feature List from Raster Files
#'
#' This function generates a feature list from raster files in a specified directory,
#' adding optional attributes to the list based on user-defined parameters. The resulting
#' feature list is written to a text file.
#'
#' @param spp_file_dir A character string specifying the directory containing the raster files.
#' @param weight An optional numeric vector (`float`) to assign weights to the features in the list.
#' @param wgrp An optional integer vector (`int`) specifying a weight group number.
#' @param condition An optional integer vector (`int`) representing the condition transform number
#'                  associated with the rasters.
#' @param group An optional integer vector (`int`) representing the output group number for each raster.
#' @param retention An optional integer vector (`int`) representing the retention transform number for each raster.
#' @param threshold An optional numeric vector (`float`) representing the threshold value below which
#'                  input files are cut to zero.
#'
#' @returns A text file containing a feature list of rasters along with any additional attributes
#'          specified by the user.
#'
#' @importFrom utils write.table
#'
#' @export
#'
#' @examples
#' \dontrun{
#' create_feature_list(spp_file_dir = "path/to/raster/files")
#' }
create_feature_list <- function(weight = NULL,
                                wgrp = NULL,
                                condition = NULL,
                                group = NULL,
                                retention = NULL,
                                threshold = NULL,
                                spp_file_dir) {

  # Hardcoded values
  filename <- "feature_list.txt"
  recursive <- FALSE
  spp_file_pattern <- ".+\\.(tif|img)$"

  # List rasters in the target directory
  target_rasters <- list.files(path = spp_file_dir,
                               pattern = spp_file_pattern,
                               full.names = TRUE,
                               recursive = recursive)

  if (length(target_rasters) == 0) {
    stop("No raster files (.tif or .img) were found in the '", spp_file_dir, "' folder.")
  }

  # Create the feature list dataframe, starting with filenames
  feature_list <- data.frame(filename = target_rasters)

  # Add non-null parameters to the dataframe
  if (!is.null(weight)) feature_list$weight <- weight
  if (!is.null(wgrp)) feature_list$wgrp <- wgrp
  if (!is.null(condition)) feature_list$condition <- condition
  if (!is.null(group)) feature_list$group <- group
  if (!is.null(retention)) feature_list$retention <- retention
  if (!is.null(threshold)) feature_list$threshold <- threshold

  # Ensure column headers are in quotes
  colnames(feature_list) <- paste0('"', colnames(feature_list), '"')

  # Write the feature list
  write.table(feature_list, file = filename, row.names = FALSE, quote = FALSE, col.names = TRUE)

  message("Feature list ", filename, " has been created.")
}
