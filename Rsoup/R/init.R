#' @import rJava
require(rJava)
.jpackage(name = 'rsoup', jars = "*")


.onLoad <- function(libname, pkgname) {
  library(rJava)
  .jpackage(name = pkgname, jars = "*")
}


.onAttach <- function(libname, pkgname) {
  library(rJava)
  .jpackage(name = pkgname, jars = "*")
}

