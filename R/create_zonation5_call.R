#' Create a Zonation 5 Command File
#'
#' This function generates a command file to run Zonation 5. It is also used to specify the analysis options,
#' settings, and output location. The file is saved with a `.cmd` (Windows) or `.sh` (Linux) suffix.
#'
#'
#' @param os Operating system. Default is "Windows".
#' @param zonation_path The specification for the path where Zonation 5 is installed.
#' @param flags Flags that control which analytical options are used. Used to include single letter codes
#'              that switch analytical options on.
#' @param marginal_loss_mode The marginal loss rule is specified using this parameter.
#' @param gui_activated This parameter controls whether the Graphical User Interface (GUI)
#'      is launched when running the command file. The default is FALSE (GUI not activated).
#' @param settings_file Path to the settings file.
#' @param output_directory Output directory for results.
#' @param command_file Path and/or name to save the command file.
#'
#' @return The Zonation 5 command file.
#'
#' @examples
#' \dontrun{
#' create_zonation5_call(zonation_path = "C:/Program Files (x86)/Zonation5",
#'                       marginal_loss_mode = "ABF",
#'                       settings_file = "settings.z5")
#'
#' create_zonation5_call(os = "Linux",
#'                       zonation_path = "/usr/local/zonation",
#'                       marginal_loss_mode = "ABF",
#'                       gui_activated = TRUE)
#' }
#' @export
create_zonation5_call <- function(os = "Windows",
                                  zonation_path,           # Required parameter
                                  flags = "",
                                  marginal_loss_mode,      # Required parameter
                                  gui_activated = FALSE,
                                  settings_file,           # Required parameter
                                  output_directory = "output",
                                  command_file = "command_file") {

  # Validate required parameters
  if (missing(zonation_path)) {
    stop("Error: 'zonation_path' must be provided.")
  }
  if (missing(marginal_loss_mode)) {
    stop("Error: 'marginal_loss_mode' must be provided.")
  }
  if (missing(settings_file)) {
    stop("Error: 'settings_file' must be provided.")
  }

  # Ensure the output command file has the correct extension
  if (os == "Windows" && !grepl("\\.cmd$", command_file)) {
    command_file <- paste0(command_file, ".cmd")
  } else if (os == "Linux" && !grepl("\\.sh$", command_file)) {
    command_file <- paste0(command_file, ".sh")
  }

  # Build the command template
  if (os == "Windows") {
    command_template <- paste0("@setlocal\n",
                               "@PATH=", zonation_path, ";%PATH%\n",
                               "z5")
  } else if (os == "Linux") {
    command_template <- paste0("#!/bin/sh\n",
                               "export PATH=", zonation_path, ":$PATH\n",
                               "zonation5")
  } else {
    stop("Unsupported operating system. Use 'Windows' or 'Linux'.")
  }

  # Add flags
  if (flags != "") {
    command_template <- paste0(command_template, " -", flags)
  }

  # Add marginal loss mode
  command_template <- paste0(command_template, " --mode=", marginal_loss_mode)

  # Add GUI flag if needed
  if (gui_activated) {
    command_template <- paste0(command_template, " --gui")
  }

  # Add settings file and output directory
  command_template <- paste0(command_template, " ", settings_file, " ", output_directory)

  # Write command to file
  writeLines(command_template, command_file)

  # Set executable permission on Linux
  if (os == "Linux") {
    Sys.chmod(command_file, mode = "0755")
  }

  message("Command file created: ", command_file)
}
