#' Read in the meme you wish to create
#'
#'
#' @examples
#' meme_get("AllTheThings")
#' @export
#' @importFrom magick image_read
#' @importFrom readr read_csv
#' @importFrom utils data
#'
#' @section To add a new meme to the data:
#' \describe{
#'    \item{First}{Add the meme to the data folder (png)}
#'    \item{Then}{Add row to the blankmemes data \code{dplyr::add_row(filename = "...", name = "...")}}
#'    \item{Finally}{Run \code{usethis::use_data(blankmemes, overwrite = T)}}
#' }
#'
meme_get <- function(memename) {
  if (!is.character(memename)) {
    stop("Error: memename must be a character. See meme_list().")
  }
  data(blankmemes)
  idx <- which(blankmemes$name == memename)
  filepath <- paste0("data/", blankmemes$filename[idx])

  p <- image_read(system.file(filepath, package = "memer", lib.loc = NULL, mustWork = T))
  return(p)
}

#' List available memes
#'
#'
#' @examples
#' meme_list()
#' @export
meme_list <- function() {
  data("blankmemes")
  return(blankmemes$name)
}
