#' Run Zonation 5
#'
#' This function runs a Zonation 5 analysis directly from R. If multiple .cmd files
#' are found in the folder, it automatically selects and runs the first one
#'
#' @param folder A character string specifying the path to the folder containing the `.cmd` file.
#'
#' @examples
#' \dontrun{
#' run_zonation5("C:/path/to/folder")
#' }
run_zonation5 <- function(folder) {
  # Check if the specified folder exists
  if (!dir.exists(folder)) {
    stop("Specified folder does not exist.")
  }

  # Set working directory
  setwd(folder)

  # Get list of all .cmd files in the folder
  cmd_files <- list.files(pattern = "\\.cmd$")

  # Check if there are any .cmd files
  if (length(cmd_files) == 0) {
    stop("No .cmd file found in the specified folder.")
  } else if (length(cmd_files) > 1) {
    # If there are multiple .cmd files, notify the user and select the first one
    message("Multiple .cmd files found. Using the first one: ", cmd_files[1])
  }

  # Run the first .cmd file found
  selected_file <- cmd_files[1]
  cat("Running cmd file:", selected_file, "\n")
  system(selected_file)

  # Notify when analysis is finished
  message("The analysis has been completed.")
}
