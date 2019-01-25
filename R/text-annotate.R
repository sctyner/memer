#' Place text on top of the meme.
#'
#'
#' get_meme("AllTheThings") %>% top_text("R ALL THE THINGS!")
#' get_meme("OprahGiveaway") %>% bottom_text("EVERYONE GETS A %>%!!!")
#' get_meme("DistractedBf") %>% distbf_text("tidyverse", "new R users", "base R")
#'
#' @importFrom magick image_annotate geometry_point
#' @export
#'
top_text <- function(img, txt, ...) {
  image_annotate(img, txt,
    font = "Impact",
    color = "white", strokecolor = "black",
    gravity = "North", size = 44, ...
  )
}

#' @export
#'
bottom_text <- function(img, txt, ...) {
  image_annotate(img, txt,
    font = "Impact",
    color = "white", strokecolor = "black",
    gravity = "South", size = 44, ...
  )
}

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
