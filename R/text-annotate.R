#' Place text on top of the meme.
#'
#'
#' get_meme("AllTheThings") %>% top_text("R ALL THE THINGS!")
#' get_meme("OprahGiveaway") %>% bottom_text("EVERYONE GETS A %>%!!!")
#'
#' @importFrom magick image_annotate
#' @export
#'
top_text <- function(img, txt, ...){
  image_annotate(img, txt, font = "Impact",
                 color = "white", strokecolor = "black",
                 gravity = "North", size = 44, ...)
}

#' @export
#'
bottom_text <- function(img, txt, ...){
  image_annotate(img, txt, font = "Impact",
                color = "white", strokecolor = "black",
                gravity = "South", size = 44, ...)
}
