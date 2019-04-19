library(readr)
library(usethis)

meme_links <- read_csv(
  "data-raw/know-your-meme-links.csv", 
  col_types = cols(.default = col_character())
)

use_data(meme_links, internal = TRUE)