
test_that("get_auspol accesses a requested dataset", {

  skip_if_offline()
  skip_on_cran()

  # User requests the all dataset
  all_pol_df <- AustralianPoliticians::get_auspol("all")
  expect_true(exists("all_pol_df"))

  # User requests the allbyparty dataset
  all_byparty_df <- AustralianPoliticians::get_auspol("allbyparty")
  expect_true(exists("all_byparty_df"))

  # User requests the MPs dataset
  mps_df <- AustralianPoliticians::get_auspol("mps")
  expect_true(exists("mps_df"))

  # User requests the Senators dataset
  senators_df <- AustralianPoliticians::get_auspol("senators")
  expect_true(exists("senators_df"))
})


test_that("get_auspol produces an error message when provided with an incorrect request code",{

  expect_error(AustralianPoliticians::get_auspol("allparty"))
  expect_error(AustralianPoliticians::get_auspol("sens"))
})
