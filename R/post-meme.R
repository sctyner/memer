#' Posts a meme to Twitter
#'
#' Make sure to have rtweet installed!
#'
#' @param meme an external pointer of class 'magick-image' 
#' @param tweet_text The text that you want to post along with your meme
#' @param tag_rstatsmemes adds two hashtags and tags the "rstatsmemes" account 
#' @param token Every user should have their own Oauth (Twitter API) token. By
#'   default \code{token = NULL} this function looks for the path to a saved
#'   Twitter token via environment variables (which is what `create_token()`
#'   sets up by default during initial token creation). For instruction on how
#'   to create a Twitter token see the tokens vignette, i.e.,
#'   `vignettes("auth", "rtweet")` or see \code{?tokens}.
#' 
#' @examples
#' meme_get("OprahGiveaway") %>% 
#'   meme_text_bottom("EVERYONE GETS R MEMES!!!", size = 36) %>% 
#'   meme_tweet(tweet_text = "It's dangerous to meme alone. Here take this.", 
#'   tag_rstatsmemes = T)
#' @export
#' @importFrom magick image_write
#' @importFrom stringr str_glue
#'
#' @section Share Your Meme with Twitter
#' \describe{
#'    \item{First}{Authenticate your Twitter account, i.e. create a token)}
#'    \item{Then}{Create meme of your liking}
#'    \item{Finally}{Post meme to Twitter}
#' }
#'
meme_tweet <- function(meme, tweet_text = "It's dangerous to meme alone. Here take this.", 
                       tag_rstatsmemes = FALSE, token = NULL) {
  
  token <- rtweet:::check_token(token)
  
  ## create temporary filename
  fname <- tempfile(fileext = paste0(".png"))
  
  ## temporarily write file
  image_write(meme, path = fname)
  
  ## option to tag rstatsmemes
  if (tag_rstatsmemes == T) {
    tweet_text <- str_glue(tweet_text, "\n\n#rstats #rstatsmemes @rstatsmemes")
  }
  
  ## post tweet from rtweet
  rtweet::post_tweet(status = tweet_text, media = fname, token = token)
  
}
