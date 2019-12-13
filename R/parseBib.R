readBibs <- function(file) {
	purrr::map_df(file,bib2df::bib2df)
}

filterBibs <- function(bibtab, keys){
	tab <- dplyr::filter(bibtab, BIBTEXKEY %in% keys)
	dplyr::distinct(tab)
}

writeBibs <- function(bibtab, path = "./") {
	bib2df::df2bib(bibtab, file = path)
}
