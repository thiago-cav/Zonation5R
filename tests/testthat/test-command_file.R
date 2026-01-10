test_that("command_file creates a command file", {
  tmp <- tempdir()
  old <- getwd()
  setwd(tmp)
  on.exit(setwd(old), add = TRUE)

  settings <- tempfile(fileext = ".z5")
  file.create(settings)

  command_file(
    zonation_path = "C:/Zonation",
    settings_file = settings
  )

  expect_true(file.exists("command_file.cmd"))
})


test_that("command_file errors when required arguments are missing", {
  settings <- tempfile(fileext = ".z5")
  file.create(settings)

  # zonation_path is required
  expect_error(
    command_file(settings_file = settings),
    "zonation_path"
  )

  # settings file must exist
  expect_error(
    command_file(zonation_path = "C:/Zonation",
                 settings_file = "nonexistent.z5"),
    "Settings file not found"
  )
})


test_that("command_file errors on invalid flags", {
  settings <- tempfile(fileext = ".z5")
  file.create(settings)

  expect_error(
    command_file(
      zonation_path = "C:/Zonation",
      settings_file = settings,
      flags = "z"
    ),
    "Invalid analysis option flag"
  )
})
