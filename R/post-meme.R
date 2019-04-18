#' Posts a meme to Twitter
#'
#' Pipe your meme directly into this function to post your meme on Twitter. Make sure to have `rtweet` installed!
#'
#' @param meme an external pointer of class 'magick-image'
#' @param tweet_text The text that you want to post along with your meme
#' @param tag_rstatsmemes adds two hashtags and tags the "rstatsmemes" account
#' @param token Every user should have their own Oauth (Twitter API) token. By
#'   default `token = rtweet::get_token()`, which looks for a saved
#'   Twitter token via environment variables (which is what [rtweet::create_token()]
#'   sets up by default during initial token creation). For instruction on how
#'   to create a Twitter token see the tokens vignette, i.e.,
#'   `vignettes("auth", "rtweet")` or see `?tokens`. See [rtweet::get_token()].
#'
#' @examples
#'\dontrun{
#' meme_get("OprahGiveaway") %>%
#'   meme_text_bottom("EVERYONE GETS R MEMES!!!", size = 36) %>%
#'   meme_tweet(tweet_text = "It's dangerous to meme alone. Here take this.",
#'   tag_rstatsmemes = T)
#'}
#'
#' @importFrom magick image_write
#' @importFrom stringr str_glue
#'
#' @section How to share your meme on Twitter:
#' \describe{
#'    \item{First}{Authenticate your Twitter account, i.e. create a token)}
#'    \item{Then}{Create meme of your liking}
#'    \item{Finally}{Post meme to Twitter}
#' }
#' @references
#' Kearney, M. W. (2018). rtweet: Collecting Twitter Data. R package version 0.6.7 Retrieved from
#' \url{https://cran.r-project.org/package=rtweet}
#' @export
meme_tweet <- function(meme, tweet_text = "It's dangerous to meme alone. Here take this.",
                       tag_rstatsmemes = FALSE, token = rtweet::get_token()) {

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
