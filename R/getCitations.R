#' getCitations
#' @export
getCitations <- function(Rmd, path) {
	bib <- getBib(Rmd)
	keys <- getKeys(Rmd)
	bibtab <- readBibs(bib)
	usedRefs <- filterBibs(bibtab, keys)
	writeBibs(usedRefs, path)
}
