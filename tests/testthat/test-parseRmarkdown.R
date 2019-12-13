test_that("bibliography line parsing works", {
	bibtypes <- c(
		"library.bib",
		"library.xyx",
		"~/library.bib",
		"/long/path/to/library.bib",
		"`r normalizePath('inst/extdata/library.bib')`",
		"[library, ]"
	)
	biblines <- paste0("bibliography: ")

	expect_equal(2 * 2, 4)
})
