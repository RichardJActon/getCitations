readRmd <- function(file) {
	fileObj <- readr::read_lines(file)

	# detect chunks
	# unmatched chunk delimeter handling...?
	state <- TRUE
	chunkState <- function(line){
		if(grepl("^```", line) & isTRUE(state)){
			state <<- FALSE
		} else if (grepl("^```", line) & isFALSE(state)) {
			state <<- TRUE
		}
		return(state)
	}

	scanlines <- function(fileObj) {
		fileObj[
			purrr::map_lgl(fileObj, chunkState) &
			!grepl("^```", fileObj) & # not trailing chunk delimiter
			!fileObj == "" # not empty
		]
	}

	return(scanlines(fileObj))
}

parseKeys <- function(fileObj) {
	## exclude contenct of chunks - direct S4 object accessor syntax conflict
	unlist(
		stringr::str_extract_all(
			fileObj, "@\\w+"
		)
	)
}

getKeys <- function(file) {
	#parseKeys(readRmd(file))
	keys <- unique(
		Reduce(
			"c", purrr::map(
				file, ~parseKeys(readRmd(.x))
			)
		)
	)
	gsub("@","",keys)
}

parseBib <- function(fileObj) {
	bibline <- unlist(
		stringr::str_extract_all(
			fileObj, "bibliography: .*"
		)
	)
	bibstr <- stringr::str_remove(bibline,"bibliography: ")
	if(grepl("`r .*`", bibstr)){
		# e.g. "`r normalizePath('inst/extdata/library.bib')`"
		rsnippet <- stringr::str_remove_all(bibstr, "(?:^`r )|(?:`$)")
		bibstr <- eval(parse(text = rsnippet)) ## executes arbitary R!!!
	}
	unlist(
		stringr::str_extract_all(bibstr,"[~\\/\\.\\w]+")
	)
}

getBib <- function(file) {
	#parseBib(readRmd(file))
	unique(
		Reduce(
			"c", purrr::map(
				file, ~parseBib(readRmd(.x))
			)
		)
	)
}


