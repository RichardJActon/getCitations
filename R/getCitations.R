#' getCitations
#' @param Rmd the rmarkdown file to parse
#' @param outpath the location of the new citations file
#' @param bibpath specifcy the master citations file path manuals (defaults to current bibliography in the Rmd file)
#' @export
getCitations <- function(Rmd, outpath, bibpath = NULL) {
	if(is.null(bibpath)) {
		bib <- getBib(Rmd)
	} else {
		bib <- bibpath
	}
	keys <- getKeys(Rmd)
	bibtab <- readBibs(bib)
	usedRefs <- filterBibs(bibtab, keys)
	writeBibs(usedRefs, outpath)
}
