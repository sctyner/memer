README
================

## `memer`

A `tidyverse`-compatible `R` package for creating memes. Mostly wrappers
around `magick` functions.

``` r
library(memer)
meme_get("DistractedBf") %>% 
  meme_text_distbf("tidyverse", "new R users", "base R")
```

<img src="README_files/figure-gfm/cdistbf-1.png" style="display: block; margin: auto;" />

``` r
meme_get("OprahGiveaway") %>% 
  meme_text_bottom("EVERYONE GETS A %>%!!!")
```

<img src="README_files/figure-gfm/oprah-1.png" style="display: block; margin: auto;" />
