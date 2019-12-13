test_that("bibliography line parsing works", {
	bibtypes <- c(
		"library.bib",
		"library.xyx",
		"~/library.bib",
		"/long/path/to/library.bib",
		#"`r normalizePath('inst/extdata/library.bib')`",
		"[library.bib, other.bib]"
	)
	biblines <- paste0("bibliography: ", bibtypes)
	bibExpect <- list(
		"library.bib",
		"library.xyx",
		"~/library.bib",
		"/long/path/to/library.bib",
		#"inst/extdata/library.bib", ## envionment...?
		c("library.bib","other.bib")
	)

	purrr::map2(
		biblines, bibExpect,
		~expect_equal(
			parseBib(.x), .y
		)
	)

	expect_warning(parseBib("bibliography: `r normalizePath('inst/extdata/library.bib')`"))

})

test_that("citaion extraction works",{
	expect_equal(
		c("test2017a", "smith1998", "jones2023", "allen1978", "Dent2012"),
		getKeys(system.file("extdata", "exampleNotebook.Rmd", package = "getCitations"))
	)
})
