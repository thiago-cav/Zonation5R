#' Create a Settings File for Zonation 5 Analysis
#'
#' This function generates a settings file with various parameters related to
#' the input data and analysis configuration. The resulting settings
#' file is saved with a `.z5` extension and can be used directly in the Zonation 5 software.
#'
#' @param zero_mode A character string specifying the zero mode parameter for Zonation.
#' @param feature_list_file A character string specifying the feature list file.
#'                  This is a compulsory parameter.
#' @param external_solution_file A character string specifying the full path and/or name of the external solution file.
#' @param analysis_area_mask_layer A character string specifying the full path and/or name of the analysis area mask layer file.
#' @param weight_groups_file A character string specifying the full path and/or name of the weight groups file.
#' @param condition_link_file A character string specifying the full path and/or name of the condition link file.
#' @param hierarchic_mask_layer A character string specifying the full path and/or name of the hierarchic mask layer file.
#' @param cost_layer A character string specifying the full path and/or name of the cost layer file.
#' @param retention_link_file A character string specifying the full path and/or name of the retention link file.
#'
#' @returns A `.z5` file containing the specified settings.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' create_settings_file(feature_list_file = "feature_list.txt")
#' }
create_settings_file <- function(zero_mode = NULL,
                                 feature_list_file = NULL,
                                 external_solution_file = NULL,
                                 analysis_area_mask_layer = NULL,
                                 weight_groups_file = NULL,
                                 condition_link_file = NULL,
                                 hierarchic_mask_layer = NULL,
                                 cost_layer = NULL,
                                 retention_link_file = NULL) {

  # Hardcoded filename
  filename <- "settings_file.z5"

  # Check if the feature_list_file is provided
  if (missing(feature_list_file)) {
    stop("Missing feature_list_file. This is a compulsory parameter for running Zonation.")
  }

  # Open a connection to the file
  con <- file(filename, open = "wt")

  # Write zero_mode to the settings file
  if (!is.null(zero_mode)) {
    writeLines(paste("zero mode =", zero_mode), con)
  }

  # Write file parameters to the settings file
  if (!is.null(feature_list_file)) {
    writeLines(paste("feature list file =", feature_list_file), con)
  }
  if (!is.null(external_solution_file)) {
    writeLines(paste("external solution =", external_solution_file), con)
  }
  if (!is.null(analysis_area_mask_layer)) {
    writeLines(paste("analysis area mask layer =", analysis_area_mask_layer), con)
  }
  if (!is.null(weight_groups_file)) {
    writeLines(paste("weight groups file =", weight_groups_file), con)
  }
  if (!is.null(condition_link_file)) {
    writeLines(paste("condition link file =", condition_link_file), con)
  }
  if (!is.null(hierarchic_mask_layer)) {
    writeLines(paste("hierarchic mask layer =", hierarchic_mask_layer), con)
  }
  if (!is.null(cost_layer)) {
    writeLines(paste("cost layer =", cost_layer), con)
  }
  if (!is.null(retention_link_file)) {
    writeLines(paste("retention link file =", retention_link_file), con)
  }

  # Close the connection
  close(con)

  # Return a message
  message("Settings file ", filename, " has been created.")
}
