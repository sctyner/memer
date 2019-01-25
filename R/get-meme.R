#' Read in the meme you wish to create
#'
#'
#' @examples
#' get_meme("AllTheThings")
#' @export
#' @importFrom magick image_read
#' @importFrom readr read_csv
#'
#' # to add a new meme to the data:
#' # add the meme to the data folder (png)
#' # add row to the blankmemes data dplyr::add_row(filename = "...", name = "...")
#' # run usethis::use_data(blankmemes, overwrite = T)
#' #
get_meme <- function(memename) {
  if (!is.character(memename)) {
    stop("Error: memename must be a character. See list_memes().")
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
#' list_memes()
#' @export
list_memes <- function() {
  data("blankmemes")
  return(blankmemes$name)
}
