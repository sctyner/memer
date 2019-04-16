#' Read in the meme you wish to create
#'
#'
#' @param memename A character describing the meme to get. See [meme_list()]
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
#'    \item{First}{Add the meme to the inst/extdata folder (png)}
#'    \item{Then}{Add row to the blankmemes data `dplyr::add_row(blankmemes, filename = "...", name = "...")`}
#'    \item{Finally}{Run `usethis::use_data(blankmemes, overwrite = T)`}
#' }
#'
meme_get <- function(memename) {
  if (!is.character(memename)) {
    stop("Error: memename must be a character. See meme_list().")
  }

  idx <- which(memer::blankmemes$name == memename)
  filepath <- paste0("extdata/", memer::blankmemes$filename[idx])

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
  return(memer::blankmemes$name)
}
