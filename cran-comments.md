## Test environments
* local OS X install, R 3.5.3
* ubuntu 14.04 (on travis-ci), R 3.5.3
* win-builder (devel and release)

## R CMD check results

The warnings are inherited from the way the magick::image_annotate function is documented. 

0 errors | 0 warnings | 1 note

NOTE:
  installed size is  9.1Mb
    sub-directories of 1Mb or more:
      extdata   8.9Mb

The extdata folder contains all of the meme images. Unfortunately, the large size of the folder is unavoidable because of this. 


* This is a new release.
