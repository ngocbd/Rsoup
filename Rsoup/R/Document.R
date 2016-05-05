#' CLASS Document
#'
#' A HTML Document.
#'
#' A HTML Document.
#'
#' @import methods
#' @import rJava
#' @section Fields:
#' \describe{
#' \item{\code{document}:}{Object of class \code{"jobjRef"}}
#' }
#'
#' @section Methods:
#' \describe{
#' \item{\code{new(...)}:}{ Create a new \code{Document} object. ... is used to define the appropriate slots.}
#' \item{\code{connect(url)}:}{ Creates a new \code{\link{Connection}} to a URL. Use to fetch and parse a HTML page. To the connection you can add data, cookies, and headers; set the user-agent, referrer, method; and then execute. 
#' \describe{
#' \item{\code{url: }}{URL to connect to. The protocol must be http or https.}
#' }
#' }
#' \item{\code{parse(html, baseUri)}:}{ Parse HTML into a Document. The parser will make a sensible, balanced document tree out of any HTML.
#' \describe{
#' \item{\code{html: }}{A character string. HTML to parse}
#' \item{\code{baseUri: }}{A boolean. The URL where the HTML was retrieved from. Used to resolve relative URLs to absolute URLs, that occur before the HTML declares a <base href> tag. If NA is specified, absolute URL detection relies on the HTML including a <base href> tag.}
#' }
#' }
#' }
#' @include Jsoup.R
#' @export Document
#' @exportClass Document
#' @aliases Document

Document <- setRefClass("Document",
                        fields = list(
                          document = "jobjRef"
                        ),
                        
                        contains = "Jsoup", 
                        
                        methods = list(
                          initialize = function(document){
                            document <<- document
                          }
                        )
)