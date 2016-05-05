#' CLASS Response
#'
#' Represents a HTTP response. 
#'
#' Represents a HTTP response. 
#'
#' @import methods
#' @import rJava
#' @section Fields:
#' \describe{
#' \item{\code{response}:}{Object of class \code{"jobjRef"}}
#' }
#'
#' @section Methods:
#' \describe{
#' \item{\code{new(...)}:}{ Create a new \code{Response} object. ... is used to define the appropriate slots.}
#' \item{\code{body()}:}{Get the body of the response as a plain string.}
#' \item{\code{bodyAsBytes()}:}{Get the body of the response as an array of bytes.}
#' \item{\code{charset()}:}{Get the character set name of the response.}
#' \item{\code{contentType()}:}{Get the response content type (e.g. "text/html")}
#' \item{\code{parse()}:}{Parse the body of the response as a \code{\link{Document}}. }
#' \item{\code{statusCode()}:}{Get the status code of the response.}
#' \item{\code{statusMessage()}:}{Get the status code of the response.}
#' }
#' @include Connection.R
#' @export Response
#' @exportClass Response
#' @aliases Response

Response <- setRefClass("Response",
                        fields = list(
                          response = "jobjRef"
                        ),
                        
                        contains = "Connection", 
                        
                        methods = list(
                          initialize = function(response, ...){
                            callSuper(...)
                            response <<- response
                          },
                          
                          body = function(){
                            response$body()
                          },
                          
                          bodyAsBytes = function(){
                            response$bodyAsBytes()
                          },
                          
                          charset = function(){
                            response$charset()
                          },
                          
                          contentType = function(){
                            response$contentType()
                          },
                          
                          parse = function(){
                            Document$new(document = response$parse())$import(Jsoup)
                          },
                          
                          statusCode = function(){
                            response$statusCode()
                          },
                          
                          statusMessage = function(){
                            response$statusMessage()
                          }
                          
                        )
)