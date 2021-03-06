#' Lookup a Bibtex entry using a Digital Object Identifier
#'
#' Uses the DOI System API to look up bibliography information given a set of DOIs.
#'
#' @param doi character vector; DOIs to use to retrieve bibliographic information.
#' @param temp.file string; a file to write the Bibtex data returned by the DOI System to.
#' @param delete.file logical; should \code{temp.file} be deleted when the function exits?
#' @return an object of class BibEntry.
#' @export
#' @details
#' The bibliographic information returned by the search of the \url{http://dx.doi.org} API is temporarily
#' written to a file and then read back into \code{R} and return as a \code{BibEntry} object.
#' @references \url{http://www.doi.org/tools.html}
#' @seealso \code{\link{ReadCrossRef}}, \code{\link{BibEntry}}
#' @examples
#' if (interactive() && url.exists("http://dx.doi.org/"))
#'   GetBibEntryWithDOI(c("10.1016/j.iheduc.2003.11.004", "10.3998/3336451.0004.203"))
GetBibEntryWithDOI <- function(doi, temp.file=tempfile(fileext = '.bib'), delete.file = TRUE){
  file.create(temp.file)
  on.exit(if (delete.file && file.exists(temp.file)) file.remove(temp.file))
  for (i in seq_along(doi)){
    temp <- getURLContent(url=paste0('http://dx.doi.org/', doi[i]),
              .opts = curlOptions(httpheader = c(Accept = "application/x-bibtex"),
                  followLocation=TRUE))
    if (is.raw(temp))
      temp <- rawToChar(temp)
    write(temp, file = temp.file, append=TRUE)
  }
  bib.res <- try(ReadBib(file=temp.file, .Encoding='UTF-8'), TRUE)
  if (inherits(bib.res, "try-error")){
    message(paste0("Error parsing the returned BibTeX results.  If delete.file ",
                   "is FALSE, you can try viewing and editing the file: ", temp.file))
    return()
  }

  bib.res
}
