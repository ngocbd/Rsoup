#' CLASS Document
#'
#' Parser
#'
#' Parses HTML into a Document. Generally best to use one of the more convenient parse methods in Jsoup. 
#'
#' @import methods
#' @import rJava
#' @section Fields:
#' \describe{
#' \item{\code{parser}:}{Object of class \code{"jobjRef"}}
#' }
#'
#' @section Methods:
#' \describe{
#' \item{\code{new(...)}:}{ Create a new \code{Parser} object. ... is used to define the appropriate slots.}
#' \item{\code{getErrors()}:}{ Retrieve the parse errors, if any, from the last parse.}
#' \item{\code{parse(html, baseUri)}:}{ Parse HTML into a \code{\link{Document}}. The parser will make a sensible, balanced document tree out of any HTML.
#' \describe{
#' \item{\code{html: }}{A character string. HTML to parse}
#' \item{\code{baseUri: }}{A boolean. The URL where the HTML was retrieved from. Used to resolve relative URLs to absolute URLs, that occur before the HTML declares a <base href> tag. If NA is specified, absolute URL detection relies on the HTML including a <base href> tag.}
#' }
#' }
#' \item{\code{htmlParser()}:}{ Create a new HTML parser. This parser treats input as HTML5, and enforces the creation of a normalised document, based on a knowledge of the semantics of the incoming tags. }
#' \item{\code{xmlParser()}:}{ Create a new XML parser. This parser assumes no knowledge of the incoming tags and does not treat it as HTML, rather creates a simple tree directly from the input. }
#' }
#' @export Parser
#' @exportClass Parser
#' @aliases Parser

Parser <- setRefClass("Parser",
                        fields = list(
                          parser = "jclassName"
                        ),
                        
                        methods = list(
                          initialize = function(){
                            parser <<- J("org.jsoup.parser.Parser")
                          },
                          
                          getErrors = function(){
                            parser$getErrors()
                          },
                          
                          parse = function(html, baseUri){
                            Document$new(document = parser$parse(html = html, baseUri = baseUri))$import(Jsoup())
                          },
                          
                          htmlParser = function(){
                            parser$htmlParser()
                          },
                          
                          xmlParser = function(){
                            parser$xmlParser()
                          }
                        )
)
