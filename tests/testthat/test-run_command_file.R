test_that("run_command_file runs a single command file successfully", {
  skip_on_cran()
  skip_on_ci()

  tmp <- tempdir()

  # Create a dummy .cmd file
  cmd_file <- file.path(tmp, "command_file.cmd")

  writeLines(
    c(
      "@echo off",
      "echo Zonation test run"
    ),
    cmd_file
  )

  # Run and expect completion message
  expect_message(
    run_command_file(tmp),
    "The analysis has been completed"
  )
})

