#' CLASS Connection
#'
#' A Connection provides a convenient interface to fetch content from the web, and parse them into Documents.
#'
#' To get a new Connection, use Jsoup$connect(String). Connections contain Connection.Request and Connection.Response objects. The request objects are reusable as prototype requests.
#' Request configuration can be made using either the shortcut methods in Connection (e.g. userAgent(String)), or by methods in the Connection.Request object directly. All request configuration must be made before the request is executed. 
#'
#' @section Fields:
#' \describe{
#' \item{\code{connection}:}{Object of class \code{"jobjRef"}}
#' }
#'
#' @section Methods:
#' \describe{
#' \item{\code{new(...)}:}{ Create a new \code{Connection} object. ... is used to define the appropriate slots.}
#' \item{\code{cookie(name, value)}:}{Set a cookie to be sent in the request. 
#' \describe{
#' \item{\code{name: }}{Character: name of cookie }
#' \item{\code{value: }}{Character: value of cookie}
#' }
#' }
#' \item{\code{cookies(cookies)}:}{Adds each of the supplied cookies to the request.
#' \describe{
#' \item{\code{cookies: }}{list: A list of cookie names and value pairs. The list values should be of type character.}
#' }
#' }
#' \item{\code{GET()}:}{Execute the request as a GET, and parse the result. Returns a \code{\link{Document}}}
#' \item{\code{POST()}:}{Execute the request as a POST, and parse the result. Returns a \code{\link{Document}}}
#' \item{\code{getUrl()}:}{Get the URL}
#' \item{\code{setUrl()}:}{Set the URL}
#' }
#' 
#' @include Jsoup.R
#' @export Connection
#' @exportClass Connection
#' @aliases Connection

Connection <- setRefClass("Connection",
                          fields = list(
                            #                            url = "character",
                            connection = "jobjRef"
                          ),
                          
                          contains = "Jsoup",
                          
                          methods = list(
                            initialize = function(url = "http://www.google.com/ncr", ...){
                              #                              url <<- url
                              callSuper(...)
                              connection <<- jsoup$connect(url)
                            },
                            
                            cookie = function(name, value){
                              if(is.character(name) && is.character(value)){
                                connection$cookie(name= name, value = value)
                              }else{
                                stop("Cookie name and value should be character strings")
                              }
                            },
                            
                            cookies = function(cookies){
                              if(is.list(cookies)){
                                m <- .jnew("java/util/HashMap")
                                for(key in names(cookies)){
                                  m$put(key, cookies[[key]])
                                }
                                connection$cookies(m)
                              }else{
                                stop("cookies should be a list")
                              }
                            },
                            
                            GET = function(){
                              Document$new(document = connection$get())$import(.self$export('Jsoup'))
                            },
                            
                            POST = function(){
                              Document$new(document = connection$post())$import(.self$export('Jsoup'))
                            },
                            
                            getUrl = function(){
                              connection$url()
                            },
                            
                            setUrl = function(url){
                              jUrl <- .jnew('java.net.URL', url)
                              connection$url(jUrl)
                            }
                            
                          )
)