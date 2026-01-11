test_that("run_command_file errors if folder does not exist", {
  expect_error(run_command_file("nonexistent_folder_12345"),
               "Specified folder does not exist")
})

test_that("run_command_file errors if no .cmd file found", {
  tmp <- tempfile("test_no_cmd_")
  dir.create(tmp)
  old_wd <- getwd()
  on.exit(setwd(old_wd), add = TRUE)
  setwd(tmp)

  expect_error(run_command_file(tmp), "No \\.cmd file found")

  unlink(tmp, recursive = TRUE)
})


test_that("run_command_file runs system on a single harmless .cmd file and restores wd", {
  tmp <- tempfile("test_single_cmd_")
  dir.create(tmp)

  # Create dummy .cmd file
  cmd_file <- file.path(tmp, "dummy.cmd")
  writeLines(c("@echo off", "exit /b 0"), cmd_file)

  old_wd <- getwd()  # store original wd

  expect_message(run_command_file(tmp), "The analysis has been completed.")

  # After function completes, working directory restored
  expect_equal(getwd(), old_wd)

  unlink(tmp, recursive = TRUE)
})
