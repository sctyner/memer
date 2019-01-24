README
================

## `memer`

A `tidyverse`-compatible `R` package for creating memes. Mostly wrappers
around `magick` functions.

``` r
library(memer)
get_meme("DistractedBf") %>% 
  distbf_text("tidyverse", "new R users", "base R")
```

<img src="README_files/figure-gfm/cdistbf-1.png" style="display: block; margin: auto;" />
