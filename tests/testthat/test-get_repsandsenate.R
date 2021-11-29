
test_that("get_reps_senate produces the correct manipulated datasets", {

  skip_if_offline()
  skip_on_cran()

  # User requests the HoR and Senate dataset
  reps_senate <- AustralianPoliticians::get_reps_senate("reps_senate")
  expect_true(exists("reps_senate"))

  # User requests the HoR dataset
  reps <- AustralianPoliticians::get_reps_senate("reps")
  expect_true(exists("reps"))

  # User requests the Senate dataset
  senate <- AustralianPoliticians::get_reps_senate("senate")
  expect_true(exists("senate"))
})


test_that("get_reps_seante produces an error code if given an incorrect argument",{

  # Produce error code for incorrect argument
  expect_error(AustralianPoliticians::get_reps_senate("all"))

})
