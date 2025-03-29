test_that("create_feature_list creates a valid output file", {
  # Create temporary directories
  temp_dir <- tempfile()
  dir.create(temp_dir)
  output_dir <- tempfile()
  dir.create(output_dir)

  # Create dummy raster files
  raster_files <- file.path(temp_dir, c("raster1.tif", "raster2.tif"))
  file.create(raster_files)

  # Run the function (using the default filename)
  create_feature_list(
    output_dir = output_dir,
    spp_file_dir = temp_dir
  )

  # Check if the default output file was created
  output_file <- file.path(output_dir, "feature_list.txt")
  expect_true(file.exists(output_file))

  # Read and verify basic structure
  output_data <- read.table(output_file, header = TRUE)
  expect_equal(nrow(output_data), length(raster_files)) # Should match the number of raster files
  expect_equal(ncol(output_data), 1)  # Should contain only filenames if no other params are set

  # Cleanup
  unlink(temp_dir, recursive = TRUE)
  unlink(output_dir, recursive = TRUE)
})

