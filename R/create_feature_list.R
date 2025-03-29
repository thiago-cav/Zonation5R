create_feature_list <- function(filename = "feature_list.txt",
                                output_dir = NULL,  # New parameter for specifying the folder
                                weight = NULL,
                                wgrp = NULL,
                                condition = NULL,
                                group = NULL,
                                retention = NULL,
                                threshold = NULL,
                                spp_file_dir,
                                recursive = FALSE,
                                spp_file_pattern = ".+\\.(tif|img)$") {

  # Ensure the filename has a .txt extension
  if (!grepl("\\.txt$", filename, ignore.case = TRUE)) {
    filename <- paste0(filename, ".txt")
  }

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

  # Determine the full file path
  if (!is.null(output_dir)) {
    # Ensure the directory exists
    if (!dir.exists(output_dir)) {
      dir.create(output_dir, recursive = TRUE)
    }
    filename <- file.path(output_dir, filename)
  }

  # Write the feature list
  write.table(feature_list, file = filename, row.names = FALSE, quote = FALSE, col.names = TRUE)

  message("Feature list ", filename, " has been created.")
}
