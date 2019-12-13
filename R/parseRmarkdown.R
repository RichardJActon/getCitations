getKeys <- function(file) {
	unlist(
		stringr::str_extract_all(
			readr::read_lines(file), "@\\w+"
		)
	)
}

getBib <- function(file) {
	bibline <- unlist(
		stringr::str_extract_all(
			readr::read_lines(file), "bibliography: .*"
		)
	)

}
