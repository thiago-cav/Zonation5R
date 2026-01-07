test_that("feature_list creates a valid output file", {
  # Create temporary directories
  temp_dir <- tempfile()
  dir.create(temp_dir)

  # Create dummy raster files
  raster_files <- file.path(temp_dir, c("raster1.tif", "raster2.tif"))
  file.create(raster_files)

  # Run the function (no output_dir specified)
  feature_list(
    spp_file_dir = temp_dir
  )

  # Check if the output file was created in the current working directory
  output_file <- "feature_list.txt"
  expect_true(file.exists(output_file))

  # Read and verify basic structure
  output_data <- read.table(output_file, header = TRUE)
  expect_equal(nrow(output_data), length(raster_files))  # Should match the number of raster files
  expect_equal(ncol(output_data), 1)  # Should contain only filenames if no other params are set

  # Cleanup
  unlink(temp_dir, recursive = TRUE)
  unlink(output_file)
})
