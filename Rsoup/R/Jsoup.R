#' CLASS Jsoup
#'
#' The core public access point to the jsoup functionality.
#'
#' The core public access point to the jsoup functionality.
#'
#' @import rJava
#' @section Fields:
#' \describe{
#' \item{\code{jsoup}:}{Object of class \code{"jclassName"}}
#' }
#'
#' @section Methods:
#' \describe{
#' \item{\code{new(...)}:}{ Create a new \code{Jsoup} object. ... is used to define the appropriate slots.}
#' \item{\code{connect(url)}:}{ Creates a new \code{\link{Connection}} to a URL. Use to fetch and parse a HTML page. To the connection you can add data, cookies, and headers; set the user-agent, referrer, method; and then execute. 
#' \describe{
#' \item{\code{url: }}{URL to connect to. The protocol must be http or https.}
#' }
#' }
#' \item{\code{parse(html, baseUri)}:}{ Parse HTML into a Document. The parser will make a sensible, balanced document tree out of any HTML.
#' \describe{
#' \item{\code{html: }}{A character string. HTML to parse}
#' \item{\code{baseUri: }}{A character string. The URL where the HTML was retrieved from. Used to resolve relative URLs to absolute URLs, that occur before the HTML declares a <base href> tag. If NA is specified, absolute URL detection relies on the HTML including a <base href> tag.}
#' }
#' }
#' \item{\code{clean(bodyHtml, whitelist, baseUri = NA)}:}{ Parse HTML into a Document. The parser will make a sensible, balanced document tree out of any HTML.
#' \describe{
#' \item{\code{bodyhtml: }}{A character string. input untrusted HTML (body fragment) }
#' \item{\code{whitelist: }}{A \code{\link{Whitelist}}. The default is type = "none". See Whitelist documentation for detail.}
#' \item{\code{baseUri: }}{A character string. The URL where the HTML was retrieved from. Used to resolve relative URLs to absolute URLs, that occur before the HTML declares a <base href> tag. If NA is specified, absolute URL detection relies on the HTML including a <base href> tag.}
#' }
#' }
#' \item{\code{isValid(bodyHtml, whitelist)}:}{ Test if the input HTML has only tags and attributes allowed by the Whitelist. Useful for form validation. The input HTML should still be run through the cleaner to set up enforced attributes, and to tidy the output. 
#' \describe{
#' \item{\code{bodyhtml: }}{A character string. input untrusted HTML (body fragment) }
#' \item{\code{whitelist: }}{A \code{\link{Whitelist}}. The default is type = "none". See Whitelist documentation for detail.}
#' }
#' }
#' }
#' @include init.R
#' @export Jsoup
#' @exportClass Jsoup
#' @aliases Jsoup
#' 
Jsoup <- setRefClass("Jsoup",
                     fields = list(
                       jsoup = "jclassName"
                     ),
                     methods = list(
                       initialize = function(){
                         jsoup <<-  J("org.jsoup.Jsoup")
                       },
                       
                       connect = function(url){
                         
                         Connection$new(url = url)$import(.self)
                         
                       },
                       
                       parse = function(html, baseUri = NA_character_){
                         if(is.na(baseUri)){
                           document <- .self$jsoup$parse(html)
                         }else{
                           document <- .self$jsoup$parse(html, baseUri)
                         }
                         
                         Document$new(document = document)$import(.self)
                       }
                       
                       
                     )
)
