#' Place text in the meme
#'
#'
#' @param img An image of class \code{magick_image}. See \code{\link[=meme_get]{meme_get()}}.
#' @param txt A character string
#'
#' @examples
#' meme_get("AllTheThings") %>% meme_text_top("GGPLOT ALL THE THINGS!")
#' meme_get("OprahGiveaway") %>% meme_text_bottom("EVERYONE GETS A %>%!!!")
#' @importFrom magick image_annotate geometry_point
#' @inheritDotParams magick::image_annotate -image -text
#'
#' @export
#' @describeIn meme_text_top Place text in center top of meme
meme_text_top <- function(img, txt, ...) {
  image_annotate(img, txt,
    font = "Impact",
    color = "white", strokecolor = "black",
    gravity = "North", size = 44, ...
  )
}

#' @export
#' @describeIn meme_text_top Place text in bottom center of meme
meme_text_bottom <- function(img, txt, ...) {
  image_annotate(img, txt,
    font = "Impact",
    color = "white", strokecolor = "black",
    gravity = "South", size = 44, ...
  )
}

#' Specialized functions for placing text in memes
#'
#' @param img An image of class \code{magick_image}. See \code{\link[=meme_get]{meme_get()}}.
#' @param newgirl A character string. Text for the left-most person in the \code{"distractedbf"} meme.
#' @param guy A character string. Text for the center person in the \code{"distractedbf"} meme.
#' @param oldgirl A character string. Text for the right-most person in the \code{"distractedbf"} meme.
#'
#' @importFrom magick image_annotate geometry_point
#' @importFrom stringr str_wrap
#' @inheritDotParams magick::image_annotate -image -text
#'
#' @examples
#' meme_get("DistractedBf") %>%
#'   meme_text_distbf("tidyverse", "new R users", "base R")
#' @export
#' @describeIn meme_text_distbf Text function for the distracted boyfriend meme.
meme_text_distbf <- function(img, newgirl, guy, oldgirl, ...) {
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

#' @param img An image of class \code{magick_image}. See \code{\link[=meme_get]{meme_get()}}.
#' @param dwayne A character string. Text for the top speech bubble in the \code{"therockdriving"} meme.
#' @param girl A character string. Text for the other speech bubble in the \code{"therockdriving"} meme.
#'
#' @describeIn meme_text_distbf Text function for The Rock driving meme.
#'
#' @examples
#' meme_get("TheRockDriving") %>%
#'   meme_text_rock("What's your favorite thing to do in R?" , "Write for loops.")
#' @export
meme_text_rock <- function(img, dwayne, girl, ...) {
  image_annotate(img, str_wrap(dwayne,20),
                 font = "Impact",
                 color = "black", strokecolor = NULL,
                 gravity = "North", location = geometry_point(90,20), size = 16, ...
  ) %>%
    image_annotate(girl,
                   font = "Impact",
                   color = "black", strokecolor = NULL,
                   gravity = "Center", location = geometry_point(80,-42), size = 16, ...
    )
}

#' @param img An image of class \code{magick_image}. See \code{\link[=meme_get]{meme_get()}}.
#' @param robin A character string. Text for the Robin's speech bubble in the \code{"batmanrobin"} meme.
#' @param batman A character string. Text for the Batman's speech bubble in the \code{"batmanrobin"} meme.
#'
#' @describeIn meme_text_distbf Text function for the Batman slaps Robin meme.
#'
#' @examples
#' meme_get("BatmanRobin") %>%
#'   meme_text_batman("Hey, I'm Batman!" , "No, you idiot, I'm Batman!")
#' @export
meme_text_batman <- function(img, robin, batman, ...) {
  image_annotate(img, str_wrap(robin,20),
                 font = "Impact",
                 color = "black", strokecolor = NULL,
                 gravity = "NorthWest", location = geometry_point(10,0), size = 20, ...
  ) %>%
    image_annotate(str_wrap(batman, 20),
                   font = "Impact",
                   color = "black", strokecolor = NULL,
                   gravity = "NorthEast", location = geometry_point(20,0), size = 20, ...
    )
}

#' @param img An image of class \code{magick_image}. See \code{\link[=meme_get]{meme_get()}}.
#' @param rightpg A character string. Text for the right page in the \code{"trumpbill"} meme.
#' @param leftpg A character string. Text for the left page in the \code{"trumpbill"} meme.
#'
#' @describeIn meme_text_distbf Text function for the Trump "first order of business" meme.
#'
#' @examples
#' meme_get("TrumpBillSigning") %>%
#'   meme_text_trump("Nonsense", "Stuff and")
#' @export
meme_text_trump <- function(img, rightpg, leftpg = "", ...){
  image_annotate(img, str_wrap(rightpg,20),
                 font = "Impact", color = "black", strokecolor = NULL,
                 gravity = "East", location = geometry_point(60,0), size = 20, ...
  ) %>%
    image_annotate(str_wrap(leftpg,20),
                   font = "Impact", color = "black", strokecolor = NULL,
                   gravity = "Center", location = geometry_point(0,0), size = 20, ...
                   )
}
