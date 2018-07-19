#' Creates Wikipedia dataset
#'
#' Run this to recreate wikidk.RData.
#'
#' @param Path to file.
#'
#' @return RData file to subdirectory /data.
#'
#' @examples
#' create_wikidk(file = "data/wikipedia-dk-abstract.txt")
create_wikidk <- function(file) {
  wikidk <- readr::read_file(file, locale = readr::locale(encoding = 'UTF-8'))

  wikidk <- stringr::str_split(wikidk, pattern = "</doc>")[[1]]

  wikidk <- stringr::str_remove(wikidk, "<.*>\\n*.*\\n*")
  wikidk <- stringr::str_remove(wikidk, "\n")

  save(wikidk, file="data/wikidk.RData")
}
