test_that("command_file creates a command file", {
  tmp <- tempdir()
  old <- getwd()
  setwd(tmp)
  on.exit(setwd(old), add = TRUE)

  command_file(
    zonation_path = "C:/Zonation",
    marginal_loss_mode = "ABF",
    settings_file = "settings.z5"
  )

  expect_true(file.exists("command_file.cmd"))
})


test_that("command_file errors when required arguments are missing", {
  expect_error(
    command_file(
      marginal_loss_mode = "ABF",
      settings_file = "settings.z5"
    )
  )

  expect_error(
    command_file(
      zonation_path = "C:/Zonation",
      settings_file = "settings.z5"
    )
  )

  expect_error(
    command_file(
      zonation_path = "C:/Zonation",
      marginal_loss_mode = "ABF"
    )
  )
})


test_that("command_file errors on invalid flags", {
  expect_error(
    command_file(
      zonation_path = "C:/Zonation",
      marginal_loss_mode = "ABF",
      settings_file = "settings.z5",
      flags = "z"
    )
  )
})
