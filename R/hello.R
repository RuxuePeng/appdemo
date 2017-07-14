#' Hello World
#' 
#' Basic hello world function to be called from the demo app
#' 
#' @export
#' @param myname your name. Required.
hello <- function(myname = ""){
  if(myname == ""){
    stop("Tell me your name!")
  }
  iTunes = fromJSON("https://rss.itunes.apple.com/api/v1/us/tv-shows/top-tv-episodes/25/non-explicit/json")
  pool = data.frame(Name = iTunes$feed$results$artistName, 
                    Detail = paste("Episode:",iTunes$feed$results$name), 
                    category = iTunes$feed$results$primaryGenreName,
                    from = "iTunes")
  pool = as.character(paste(pool$Name,collapse = "//  "))
  list(
    message = paste("hello", myname, "! This is", pool)
  )
}
