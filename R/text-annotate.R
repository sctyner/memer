#' Place text in the meme
#'
#'
#' @param img An image of class \code{magick_image}. See \code{\link[=get_meme]{get_meme()}}.
#' @param txt A character string
#'
#' @examples
#' get_meme("AllTheThings") %>% top_text("R ALL THE THINGS!")
#' get_meme("OprahGiveaway") %>% bottom_text("EVERYONE GETS A %>%!!!")
#'
#' @importFrom magick image_annotate geometry_point
#' @inheritDotParams magick::image_annotate -image -text
#'
#' @export
#' @describeIn top_text Place text in center top of meme
top_text <- function(img, txt, ...) {
  image_annotate(img, txt,
    font = "Impact",
    color = "white", strokecolor = "black",
    gravity = "North", size = 44, ...
  )
}

#' @export
#' @describeIn top_text Place text in bottom center of meme
bottom_text <- function(img, txt, ...) {
  image_annotate(img, txt,
    font = "Impact",
    color = "white", strokecolor = "black",
    gravity = "South", size = 44, ...
  )
}

#' Specialized functions for placing text in memes
#'
#' @param img An image of class \code{magick_image}. See \code{\link[=get_meme]{get_meme()}}.
#' @param newgirl A character string. Text for the left-most person in the \code{"distractedbf"} meme
#' @param guy A character string. Text for the center person in the \code{"distractedbf"} meme
#' @param oldgirl A character string. Text for the right-most person in the \code{"distractedbf"} meme
#'
#' @importFrom magick image_annotate geometry_point
#' @inheritDotParams magick::image_annotate -image -text
#'
#' @examples
#' get_meme("DistractedBf") %>%
#'   distbf_text("tidyverse", "new R users", "base R")
#'
#' @export
#'
distbf_text <- function(img, newgirl, guy, oldgirl, ...) {
  image_annotate(img, newgirl,
    font = "Impact",
    color = "white", strokecolor = "black",
    gravity = "SouthWest", location = geometry_point(65, 0), size = 44, ...
  ) %>%
    image_annotate(guy,
      font = "Impact",
      color = "white", strokecolor = "black",
      gravity = "Center", location = geometry_point(65, 0), size = 44, ...
    ) %>%
    image_annotate(oldgirl,
      font = "Impact",
      color = "white", strokecolor = "black",
      gravity = "SouthEast", location = geometry_point(10, 30), size = 44, ...
    )
}
