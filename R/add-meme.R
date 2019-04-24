#' Add meme to `memer` package
#'
#' @param name Name of the meme in CamelCase. 
#' @param file Filename including the file extension.
#' 
#' @keywords internal
#' 
#' @details `memer` uses `memer::blankmemes` to resolve filenames, so to use a
#' new meme you must build and install the package after running `meme_add()`.
#'
#' @examples
#' \dontrun{
#' meme_add("YoDawg", "yodawg.png")
#' }
meme_add <- function(name, file) {
  
  cat('Make sure you have added the image file to the inst/extdata directory')
  
  blankmemes <- dplyr::add_row(blankmemes, filename = file, name = name) %>%
    dplyr::arrange(filename)
  
  usethis::use_data(blankmemes, overwrite = T)
  
}