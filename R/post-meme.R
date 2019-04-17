#' Posts a meme to Twitter
#'
#'
#' @param meme an external pointer of class 'magick-image' 
#' @param tweet_text The text that you want to post along with your meme
#' @param tag_rstatsmemes adds two hashtags and tags the "rstatsmemes" account 
#' 
#' @examples
#' meme_get("OprahGiveaway") %>% 
#'   meme_text_bottom("EVERYONE GETS R MEMES!!!", size = 36) %>% 
#'   tweet_meme(tweet_text = "It's dangerous to meme alone. Here take this.", tag_rstatsmemes = T)
#' @export
#' @importFrom magick image_write
#' @importFrom rtweet post_tweet
#'
#' @section Share Your Meme with Twitter
#' \describe{
#'    \item{First}{Authenticate your Twitter account, i.e. create a token)}
#'    \item{Then}{Create meme of your liking}
#'    \item{Finally}{Post meme to Twitter}
#' }
#'
tweet_meme <- function(meme, tweet_text = "It's dangerous to meme alone. Here take this.", tag_rstatsmemes = F) {
  
  ## create temporary filename
  fname <- tempfile(fileext = paste0(".png"))
  
  ## temporarily write file
  image_write(meme, path = fname)
  
  ## option to tag rstatsmemes
  if (tag_rstatsmemes == T) {
    tweet_text <- str_glue(tweet_text, "\n\n#rstats #rstatsmemes @rstatsmemes")
  }
  
  ## post tweet from rtweet
  post_tweet(status = tweet_text, media = fname)
  
}