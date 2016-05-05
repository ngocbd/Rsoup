#' CLASS Document
#'
#' Create a whitelist
#'
#' Create a new, empty whitelist. Generally it will be better to start with a default prepared whitelist instead.
#'
#' @import methods
#' @import rJava
#' @section Fields:
#' \describe{
#' \item{\code{whitelist}:}{Object of class \code{"jobjRef"}}
#' }
#'
#' @section Methods:
#' \describe{
#' \item{\code{new(type)}:}{ Create a new \code{Whitelist} object. type can be one of "none", "simpleText", "basic", "basicWithImages", "relaxed". If no type is given type is assummed as "none"
#' #' \describe{
#' \item{\code{none: }}{This whitelist allows only text nodes: all HTML will be stripped.}
#' \item{\code{simpleText: }}{This whitelist allows only simple text formatting: b, em, i, strong, u. All other HTML (tags and attributes) will be removed. }
#' \item{\code{basic: }}{This whitelist allows a fuller range of text nodes: a, b, blockquote, br, cite, code, dd, dl, dt, em, i, li, ol, p, pre, q, small, strike, strong, sub, sup, u, ul, and appropriate attributes.
#' Links ( a elements) can point to http, https, ftp, mailto, and have an enforced rel=nofollow attribute.
#' Does not allow images.}
#' \item{\code{basicWithImages: }}{This whitelist allows the same text tags as basic, and also allows img tags, with appropriate attributes, with src pointing to http or https.}
#' \item{\code{relaxed: }}{This whitelist allows a full range of text and structural body HTML: a, b, blockquote, br, caption, cite, code, col, colgroup, dd, dl, dt, em, h1, h2, h3, h4, h5, h6, i, img, li, ol, p, pre, q, small, strike, strong, sub, sup, table, tbody, td, tfoot, th, thead, tr, u, ul
#' Links do not have an enforced rel=nofollow attribute, but you can add that if desired. }
#' }
#' }
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
#' @export Whitelist
#' @exportClass Whitelist
#' @aliases Whitelist

Whitelist <- setRefClass("Whitelist", 
                         fields = list(
                           whitelist = "jobjRef"
                         ),
                         methods = list(
                           initialize = function(type = NA){
                             if(is.na(type) || type == "none"){
                               whitelist <<- J("org.jsoup.safety.Whitelist")$none()
                             }
                             
                           },
                           
                           addTags = function(tags){
                             whitelist$addTags(.jarray(tags))
                           }
                           )
)