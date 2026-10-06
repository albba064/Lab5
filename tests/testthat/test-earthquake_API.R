test_that("Errounous input handled.",{
  expect_error(earthquake_API(starttime = "Yesterday", endtime = "2026-10-01", min_magnitude = 0, max_magnitude = 10))
  expect_error(earthquake_API(starttime = "2026-10-01", endtime = "Today", min_magnitude = 0, max_magnitude = 10))
  expect_error(earthquake_API(starttime = "2026-10-01", endtime = "2026-10-05", min_magnitude = "low", max_magnitude = 10))
  expect_error(earthquake_API(starttime = "2026-10-01", endtime = "2026-10-05", min_magnitude = 0, max_magnitude = "high"))
})

test_that("Correct output", {
  test <- earthquake_API(starttime = "2026-09-25", endtime = "2026-10-01", min_magnitude = 5.5, max_magnitude = 10)
  expect_true(all(as.Date(test$time) %in% as.Date(c("2026-09-30 21:55:26 UTC", "2026-09-30 05:00:24 UTC" ,"2026-09-29 13:06:09 UTC", "2026-09-26 14:08:18 UTC", "2026-09-25 23:39:41 UTC" ,"2026-09-25 21:23:03 UTC"))))
  expect_true(all(test$latitude == c(9.7526, 23.8027, -35.2758, -4.6288, -21.3748, -21.2982)))
  expect_true(all(test$longitude == c(-86.5063, 122.9149, -16.0771, 152.8611, 168.4446, 168.6100)))
  expect_true(all(test$mag == c(5.6, 5.6, 5.5, 5.6, 5.5, 6.6)))
  expect_equal(test$place[1], "94 km SW of Tamarindo, Costa Rica")

  expect_true(all(dim(test) == c(6,5)))

  expect_true(all(dim(earthquake_API(starttime = "2026-10-01", endtime = "2026-10-02", min_magnitude = 8, max_magnitude = 10)) == c(0,5)))

})

test_that("To many events requested",
          expect_error(earthquake_API(starttime = "2026-01-01", endtime = "2026-10-01", min_magnitude = 0, max_magnitude = 10)))

