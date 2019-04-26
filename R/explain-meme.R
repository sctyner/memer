#' Explain a meme (for the old people out there)
#' 
#' Takes a meme name from memer and takes you to the 
#' knowyourmeme page that can explain it for us old
#' people.
#'
#' @param memename A character describing the meme to get. See [meme_list()]
#' @param launch Whether to launch the link in your browser 
#'   (defaults to TRUE if in interactive session)
#' @param content_warning Whether to warn about potentially offensive content
#'   on knowyourmeme
#'
#' @return The link to the knowyourmeme article about a meme
#' @export
#'
#' @examples
#' meme_explain("HotlineDrake", launch = FALSE)
meme_explain <- function(memename, 
                         launch = interactive(), 
                         content_warning = TRUE) {
  link <- meme_links[meme_links$name == memename, ]
  link <- link$url
  if (length(link) == 0 || is.na(link)) {
    stop(paste0("Could not find link for meme: ", memename), call. = FALSE)
  }
  
  if (launch) {
    if (content_warning) {
      cat("knowyourmeme can contain potentially offensive results,\n  are you sure you want to open it? [Y]es / [N]o:\n")
      result <- tryCatch(scan("", what = "character", quiet = TRUE, nlines = 1), error = function(x) "N")
      if (!identical(toupper(result), "Y")) {
        return(NULL)
      }
    }
    utils::browseURL(link)
    invisible(link)
  } else {
    if (content_warning) {
      message("knowyourmeme can contain potentially offensive results.")
    }
    link
  }
}