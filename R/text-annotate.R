#' Place text in the meme
#'
#'
#' @param img An image of class `magick_image`. See [meme_get()].
#' @param txt A character string
#' @param font string with font family such as `"sans"`, `"mono"`, `"serif"`, `"Times"`, `"Helvetica"`, `"Trebuchet"`, `"Georgia"`, `"Palatino"` or `"Comic Sans"`.
#' @param color a valid [color string](https://www.imagemagick.org/Magick++/Color.html) such as `"navyblue"` or `"#000080"`
#' @param strokecolor a [color string](https://www.imagemagick.org/Magick++/Color.html) adds a stroke (border around the text)
#' @param gravity string with [gravity](https://www.imagemagick.org/Magick++/Enumerations.html#GravityType) value from [gravity_types].
#' @param size font-size in pixels
#' @examples
#' meme_get("AllTheThings") %>% meme_text_top("GGPLOT ALL THE THINGS!")
#' meme_get("OprahGiveaway") %>% meme_text_bottom("EVERYONE GETS A %>%!!!")
#' @importFrom magick image_annotate geometry_point
#' @inheritDotParams magick::image_annotate location degrees boxcolor
#'
#' @references
#' Jeroen Ooms (2018). magick: Advanced Graphics and Image-Processing in R. R package version 2.0.
#' \url{https://CRAN.R-project.org/package=magick}
#' @export
#' @describeIn meme_text_top Place text in center top of meme
meme_text_top <- function(img, txt, font = "Impact",
                          color = "white", strokecolor = "black",
                          gravity = "North", size = 44, ...) {
  image_annotate(img, txt, font = font,
                 color = color, strokecolor = strokecolor,
                 gravity = gravity, size = size, ...)
}

#' @export
#' @describeIn meme_text_top Place text in bottom center of meme
meme_text_bottom <- function(img, txt, font = "Impact",
                             color = "white", strokecolor = "black",
                             gravity = "South", size = 44, ...) {
  image_annotate(img, txt, font = font,
                 color = color, strokecolor = strokecolor,
                 gravity = gravity, size = size, ...
  )
}

#' Specialized functions for placing text in memes
#'
#' @param newgirl A character string. Text for the left-most person in the `"DistractedBf"` meme.
#' @param guy A character string. Text for the center person in the `"DistractedBf"` meme.
#' @param oldgirl A character string. Text for the right-most person in the `"DistractedBf"` meme.
#' @param font string with font family such as `"sans"`, `"mono"`, `"serif"`, `"Times"`, `"Helvetica"`, `"Trebuchet"`, `"Georgia"`, `"Palatino"` or `"Comic Sans"`.
#' @param color a valid [color string](https://www.imagemagick.org/Magick++/Color.html) such as `"navyblue"` or `"#000080"`
#' @param strokecolor a [color string](https://www.imagemagick.org/Magick++/Color.html) adds a stroke (border around the text)
#' @param size font-size in pixels
#' @importFrom magick image_annotate geometry_point
#' @importFrom stringr str_wrap
#' @inheritDotParams magick::image_annotate location degrees boxcolor
#'
#' @examples
#' meme_get("DistractedBf") %>%
#'   meme_text_distbf("tidyverse", "new R users", "base R")
#' @export
#' @describeIn meme_text_distbf Text function for the distracted boyfriend meme.
meme_text_distbf <- function(img, newgirl, guy, oldgirl, font = "Impact",
                             color = "white", strokecolor = "black", size = 44, ...) {
  image_annotate(img, newgirl,
    font = font,
    color = color, strokecolor = strokecolor,
    gravity = "SouthWest", location = geometry_point(65, 0), size = size, ...
  ) %>%
    image_annotate(guy,
                   font = font,
                   color = color, strokecolor = strokecolor,
      gravity = "Center", location = geometry_point(65, 0), size = size, ...
    ) %>%
    image_annotate(oldgirl,
                   font = font,
                   color = color, strokecolor = strokecolor,
      gravity = "SouthEast", location = geometry_point(10, 30), size = size, ...
    )
}

#' @param img An image of class `magick_image`. See [meme_get()].
#' @param dwayne A character string. Text for the top speech bubble in the `"TheRockDriving"` meme.
#' @param girl A character string. Text for the other speech bubble in the `"TheRockDriving"` meme.
#'
#' @describeIn meme_text_distbf Text function for The Rock driving meme.
#'
#' @examples
#' meme_get("TheRockDriving") %>%
#'   meme_text_rock("What's your favorite thing to do in R?" , "Write for loops.")
#' @export
meme_text_rock <- function(img, dwayne, girl, font = "Impact",
                           color = "black", strokecolor = NULL, size = 16, ...) {
  image_annotate(img, str_wrap(dwayne,20),
                 font = font,
                 color = color, strokecolor = strokecolor,
                 gravity = "North", location = geometry_point(90,20), size = size, ...
  ) %>%
    image_annotate(girl,
                   font = font,
                   color = color, strokecolor = strokecolor,
                   gravity = "Center", location = geometry_point(80,-42), size = size, ...
    )
}

#' @param robin A character string. Text for the Robin's speech bubble in the `"BatmanRobin"` meme.
#' @param batman A character string. Text for the Batman's speech bubble in the `"BatmanRobin"` meme.
#'
#' @describeIn meme_text_distbf Text function for the Batman slaps Robin meme.
#'
#' @examples
#' meme_get("BatmanRobin") %>%
#'   meme_text_batman("Hey, I'm Batman!" , "No, you idiot, I'm Batman!")
#' @export
meme_text_batman <- function(img, robin, batman, font = "Impact",
                             color = "black", strokecolor = NULL, size = 20, ...) {
  image_annotate(img, str_wrap(robin,20),
                 font = font,
                 color = color, strokecolor = strokecolor,
                 gravity = "NorthWest", location = geometry_point(10,0), size = size, ...
  ) %>%
    image_annotate(str_wrap(batman, 20),
                   font = font,
                   color = color, strokecolor = strokecolor,
                   gravity = "NorthEast", location = geometry_point(20,0), size = size, ...
    )
}

#' @param rightpg A character string. Text for the right page in the `"TrumpBillSigning"` meme.
#' @param leftpg A character string. Text for the left page in the `"TrumpBillSigning"` meme.
#'
#' @describeIn meme_text_distbf Text function for the Trump "first order of business" meme.
#'
#' @examples
#' meme_get("TrumpBillSigning") %>%
#'   meme_text_trump("Stuff and nonsense")
#' @export
meme_text_trump <- function(img, rightpg, leftpg = "", font = "Impact",
                            color = "black", strokecolor = NULL, size = 20, ...){
  image_annotate(img, str_wrap(rightpg,12),
                 font = font, color = color, strokecolor = strokecolor,
                 gravity = "East", location = geometry_point(60,0), size = size, ...
                ) %>%
    image_annotate(str_wrap(leftpg,12),
                   font = font, color = color, strokecolor = strokecolor,
                   gravity = "Center", location = geometry_point(0,0), size = size, ...
                   )
}


#' @param isthis A character string. Text for the question in the `"IsThisAPigeon"` meme.
#' @param humanoid A character string. Text for the humanoid in the `"IsThisAPigeon"` meme.
#' @param butterfly A character string. Text for the butterfly in the `"IsThisAPigeon"` meme.
#'
#' @describeIn meme_text_distbf Text function for the Is this a pigeon? meme.
#'
#' @examples
#' meme_get("IsThisAPigeon") %>%
#'   meme_text_pigeon("Is this a pigeon?" , "Me", "Not a pigeon")
#' @export
meme_text_pigeon <- function(img, isthis, humanoid, butterfly, font = "Impact",
                             color = "white", strokecolor = "black", size = 30,
                             ...) {
  image_annotate(img, isthis,
                 font = font, color = color, strokecolor = strokecolor,
                 gravity = "South", size = size*1.5, ...
  ) %>%
  image_annotate(str_wrap(humanoid,20),
                 font = font, color = color, strokecolor = strokecolor,
                 gravity = "West", location = geometry_point(160,-60), size = size, ...
  ) %>%
    image_annotate(str_wrap(butterfly, 20),
                   font = font, color = color, strokecolor = strokecolor,
                   gravity = "NorthEast", location = geometry_point(100,100), size = size, ...
    )
}


#' @param sr1 A character string. Text for the first panel in the `"AmericanChopper"` meme.
#' @param jr1 A character string. Text for the second panel in the `"AmericanChopper"` meme.
#' @param sr2 A character string. Text for the third panel in the `"AmericanChopper"` meme.
#' @param jr2 A character string. Text for the fourth panel in the `"AmericanChopper"` meme.
#' @param sr3 A character string. Text for the fifth panel in the `"AmericanChopper"` meme.
#'
#' @describeIn meme_text_distbf Text function for the American Chopper Senior vs. Junior fight meme.
#'
#' @examples
#' meme_get("AmericanChopper") %>%
#'   meme_text_chopper("Stop calling yourself 'just an R user'!",
#'                     "But I've never written a package!",
#'                     "So?? You're still an important part of the R community!",
#'                     "But people who write packages are more important",
#'                     "NO! All members of the R community are valued & deserve respect!")
#' @export
meme_text_chopper <- function(img, sr1, jr1, sr2, jr2, sr3,
                              font = "Impact", color = "white", strokecolor = "black",
                              size = 20, ...){
  image_annotate(img, str_wrap(sr1,35),
                 font = font, color = color, strokecolor = strokecolor,
                 gravity = "North", location = geometry_point(5,150), size = size, ...
                 ) %>%
  image_annotate(str_wrap(jr1,35),
                 font = font, color = color, strokecolor = strokecolor,
                gravity = "Center", location = geometry_point(0,-110), size = size, ...
    ) %>%
    image_annotate(str_wrap(sr2,35),
                   font = font, color = color, strokecolor = strokecolor,
                   gravity = "Center", location = geometry_point(0,50), size = size, ...
                   ) %>%
    image_annotate(str_wrap(jr2,35),
                   font = font, color = color, strokecolor = strokecolor,
                   gravity = "Center", location = geometry_point(0,250), size = size, ...

    ) %>%
    image_annotate(str_wrap(sr3,35),
                   font = font, color = color, strokecolor = strokecolor,
                   gravity = "South", location = geometry_point(0,0), size = size, ...
                   )
}


#' @param br1 A character string. Text for the first panel in the `"ExpandingBrain"` meme.
#' @param br2 A character string. Text for the second panel in the `"ExpandingBrain"` meme.
#' @param br3 A character string. Text for the third panel in the `"ExpandingBrain"` meme.
#' @param br4 A character string. Text for the fourth panel in the `"ExpandingBrain"` meme.
#'
#' @describeIn meme_text_distbf Text function for the expanding brain meme.
#'
#' @examples
#' meme_get("ExpandingBrain") %>%
#'   meme_text_brain("text1",
#'                     "text2",
#'                     "text3",
#'                     "text4")
#' @export
meme_text_brain <- function(img, br1, br2, br3, br4,
                            font = "Impact", color = "black", strokecolor = NULL,
                            size = 24, ...){
  image_annotate(img, str_wrap(br1,35),
                 font = font, color = color, strokecolor = strokecolor,
                 gravity = "NorthWest", location = geometry_point(10,20), size = size, ...
  ) %>%
    image_annotate(str_wrap(br2,35),
                   font = font, color = color, strokecolor = strokecolor,
                   gravity = "West", location = geometry_point(10,-130), size = size, ...
    ) %>%
    image_annotate(str_wrap(br3,35), font = font, color = color, strokecolor = strokecolor,
                   gravity = "West", location = geometry_point(10,40), size = size, ...
    ) %>%
    image_annotate(str_wrap(br4,35),
                   font = font, color = color, strokecolor = strokecolor,
                   gravity = "SouthWest", location = geometry_point(10,120), size = size, ...
    )
}


#' @param good A character string. A good idea for the `"OffRamp"` meme.
#' @param dark A character string. A tempting, bad idea for the `"OffRamp"` meme.
#'
#' @describeIn meme_text_distbf Text function for the Off Ramp meme.
#'
#' @examples
#' meme_get("EvilKermit") %>%
#'   meme_text_kermit("Me: Your text here", "Me: Your evil text here")
#'
#' @export
meme_text_kermit <- function(img, good, dark,
                             font = "Impact", color = "black", strokecolor = NULL,
                             size = 20, ...){
  image_annotate(img, str_wrap(good,100),
                 font = font, color = color, strokecolor = strokecolor,
                 gravity = "NorthWest", location = geometry_point(10,30), size = size, ...
  ) %>%
    image_annotate(str_wrap(dark,100),
                   font = font, color = color, strokecolor = strokecolor,
                   gravity = "NorthWest", location = geometry_point(10,100), size = size, ...
    )
}

#' @param lbtn A character string. The left button in the `"TwoButtonsAnxiety"` meme.
#' @param rbtn A character string. The right button in the `"TwoButtonsAnxiety"` meme.
#'
#' @describeIn  meme_text_distbf Text function for the Two Buttons Anxiety meme.
#'
#' @examples
#' meme_get("TwoButtonsAnxiety") %>%
#'   meme_text_buttons("Should I do this?", "Or this?")
#'
#' @export
meme_text_buttons <- function(img, lbtn, rbtn, font = "Impact",
                              color = "black", strokecolor = NULL,
                              size = 18, ...){
  image_annotate(img, str_wrap(lbtn,15), degrees = -15,
                 font = font, color = color, strokecolor = strokecolor,
                 gravity = "NorthWest", location = geometry_point(30,60), size = size, ...
  ) %>%
    image_annotate(str_wrap(rbtn, 15), degrees = -10,
                   font = font, color = color, strokecolor = strokecolor,
                   gravity = "North", location = geometry_point(20,35), size = size, ...
                   )
}

#' @param top A character string. Text for the top panel in the `"HotlineDrake"` meme.
#' @param bot A character string. Text for the bottom panel in the `"HotlineDrake"` meme.
#'
#' @describeIn  meme_text_distbf Text function for the Drake meme.
#'
#' @examples
#' meme_get("HotlineDrake") %>%
#'   meme_text_drake("Handcrafted memes", "Reproducible memes")
#'
#' @export
meme_text_drake <- function(img, top, bot,
                            font = "Impact", color = "black", strokecolor = NULL,
                            size = 30, ...){
  image_annotate(img, str_wrap(top,15),
                 font = font, color = color, strokecolor = strokecolor,
                 gravity = "North", location = geometry_point(125,0), size = size, ...
  ) %>%
    image_annotate(str_wrap(bot,15), font = "Impact", color = "black", strokecolor = NULL,
                   gravity = "Center", location = geometry_point(125,50), size = size, ...
    )
}

#' @param left A character string. Text for the left panel in the `"MoneyPrinter"` meme.
#' @param right A character string. Text for the right panel in the `"MoneyPrinter"` meme.
#'
#' @describeIn  meme_text_distbf Text function for the Money Printer meme.
#'
#' @examples
#' meme_get("MoneyPrinter") %>%
#'   meme_text_printer("nooooo!!!!!! you can't just use open source software to
#'                     make memes without annoying watermarks on them nooooo",
#'                     "haha meme printer go brrrr")
#'
#' @export
meme_text_printer <- function(img, left, right,
                            font = "Impact", color = "black", strokecolor = NULL,
                            size = 13, ...){
  image_annotate(img, str_wrap(left,30),
                 font = font, color = color, strokecolor = strokecolor,
                 gravity = "SouthWest", location = geometry_point(15,10), size = size, ...
  ) %>%
    image_annotate(str_wrap(right,30), font = "Impact", color = "black", strokecolor = NULL,
                   gravity = "SouthEast", location = geometry_point(125,60), size = size, ...
    )
}

#' @param anakin A character string. Text for Anakin  in the `"AnakinPadmeRight"` meme.
#' @param padme A character string. Text for Padme in the `"AnakinPadmeRight"` meme.
#'
#' @inheritParams stringr::str_wrap
#' @describeIn  meme_text_distbf Text function for the Anakin/Padme meme.
#'
#' @examples
#' meme_get("AnakinPadmeRight") %>%
#'   meme_text_anakin("I'm going to set my working directory",
#'                    "With the {here} package, right?")
#'
#' @export
meme_text_anakin <- function(img, anakin, padme,
                             font = "sans",
                             size = 16, width = 35, ...){
  img %>%
    image_annotate(str_wrap(anakin, width),
                   font = font, color = "white", strokecolor = NULL,
                   gravity = "Center", location = geometry_point(-125,-35), size = size, ...
    ) %>%
    image_annotate(str_wrap(padme, width),
                   font = font, color = "yellow", strokecolor = NULL,
                   gravity = "Center", location = geometry_point(125,-35), size = size, ...
    ) %>%
    image_annotate(str_wrap(padme, width),
                   font = font, color = "yellow", strokecolor = NULL,
                   gravity = "Center", location = geometry_point(125,215), size = size, ...
    )
}

#' @param evergiven A character string. Big text for the ship in the `"SuezExcavator"` meme.
#' @param excavator A character string. Little text for the excavator in the `"SuezExcavator"` meme.
#'
#' @inheritParams stringr::str_wrap
#' @describeIn  meme_text_distbf Text function for the Suez canal excavator meme.
#'
#' @examples
#' meme_get("SuezExcavator") %>%
#'   meme_text_suez("R programming",
#'                  "Me learning R programming")
#'
#' @export
meme_text_suez <- function(img, evergiven, excavator,
                           font = "Impact", color = "white", strokecolor = NULL,
                           size = 40, width = 30, ...){
  img %>%
    image_annotate(str_wrap(evergiven, width),
                   font = font, color = color, strokecolor = strokecolor,
                   gravity = "Center", location = geometry_point(60,-200), size = size, ...
    ) %>%
    image_annotate(str_wrap(excavator, width),
                   font = font, color = color, strokecolor = strokecolor,
                   gravity = "Center", location = geometry_point(-60,80), size = size / 2, ...
    )
}

