#' Read in the meme you wish to create
#'
#'
#'
#'
#'
#' @export
#' @importFrom magick image_read
#' @importFrom readr read_csv
#'
get_meme <- function(memename) {
  if (!is.character(memename)){
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
#' @importFrom readr read_csv
#'
#' @examples
#' list_memes()
#'
#' @export
list_memes <- function(){
  data("blankmemes")
  return(blankmemes$name)
}
