
#' `memer` package
#'
#' Wrapper functions around `magick` package functions to create memes in R.
#'
#' See the README on
#' or \href{https://github.com/sctyner/memer#README}{GitHub}
#'
#' @docType package
#' @name memer
NULL

##  from https://github.com/STAT545-UBC/Discussion/issues/451:
## quiets concerns of R CMD check re: the .'s that appear in pipelines
if(getRversion() >= "2.15.1")  utils::globalVariables(c("blankmemes", "filename", "name"))
