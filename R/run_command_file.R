#' Run Zonation 5
#'
#' This function runs a Zonation 5 analysis directly from R by executing a `.cmd` file
#' located in the specified folder. If multiple `.cmd` files are present, it stops with an error,
#' requiring only one `.cmd` file to be in the folder.
#'
#' @param folder A character string specifying the path to the folder containing the `.cmd` file.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' run_command_file("C:/path/to/folder")
#' }
run_command_file <- function(folder) {
  # Check if the specified folder exists
  if (!dir.exists(folder)) {
    stop("Specified folder does not exist.")
  }

  # Get list of all .cmd files in the folder
  cmd_files <- list.files(path = folder, pattern = "\\.cmd$", full.names = TRUE)

  if (length(cmd_files) == 0) {
    stop("No .cmd file found in the specified folder.")
  } else if (length(cmd_files) > 1) {
    stop("More than one .cmd file found. Please keep only one .cmd file in the folder.")
  }

  cat("Running cmd file:", cmd_files, "\n")

  # Temporarily change working directory
  old_wd <- getwd()
  on.exit(setwd(old_wd), add = TRUE)  # restore old working directory on exit
  setwd(folder)

  system(basename(cmd_files[1]))

  # Notify when analysis is finished
  message("The analysis has been completed.")
}
