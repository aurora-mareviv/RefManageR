\name{ReadZotero}
\alias{ReadZotero}
\title{Get Bibliography Information From a Zotero Library.}
\usage{
ReadZotero(user, .params, temp.file = tempfile(fileext = ".bib"),
  delete.file = TRUE)
}
\arguments{
  \item{user}{Zotero userID for use in calls to the Zotero
  API.  This is not the same as your Zotero username.  The
  userID for accessing user-owned libraries can be found at
  \url{https://www.zotero.org/settings/keys}.}

  \item{.params}{A \emph{named} list of parameters to use
  in requests to the Zotero API with possible values
  \itemize{ \item q - Search string to use to search the
  library \item qmode - Search mode. Default is
  "titleCreatorYear".  Use "everything" to include
  full-text content in search.  \item key - API key.  This
  must be specified to access non-public libraries.  \item
  collection - name of a specific collection within the
  library to search \item itemType - type of entry to
  search for; e.g., "book" or "journalArticle" \item tag -
  name of tag to search for in library \item limit -
  maximum number of entries to return \item start - index
  of first entry to return }}

  \item{temp.file}{character; file name where the BibTeX
  data returned by Zotero will be temporarily written.}

  \item{delete.file}{boolean; should \code{temp.file} be
  removed on exit?}
}
\value{
An object of class BibEntry
}
\description{
Get Bibliography Information From a Zotero Library.
}
\examples{
\dontrun{
## first two entries in library with bayesian in title
ReadZotero(user='1648676', .params=list(q='bayesian', key='7lhgvcwVq60CDi7E68FyE3br',
  limit=2))

## Search specific collection
## collection key can be found by reading uri when collection is selected in Zotero
ReadZotero(user='1648676', .params=list(q='yu', key='7lhgvcwVq60CDi7E68FyE3br',
  collection='3STEQRNU'))

## Search by tag
## Notice the issue with how Zotero uses a TechReport entry for arXiv manuscripts
## This is one instance where the added fields of BibLaTeX are useful
ReadZotero(user='1648676', .params=list(key='7lhgvcwVq60CDi7E68FyE3br',
  tag='Statistics - Machine Learning'))

## To read these in you must set check.entries to FALSE or "warn"
BibOptions(check.entries = FALSE)
ReadZotero(user='1648676', .params=list(key='7lhgvcwVq60CDi7E68FyE3br',
  tag='Statistics - Machine Learning'))
}
}
\references{
\url{http://www.zotero.org/support/dev/server_api/v2/read_requests}
}
\seealso{
\code{\link{BibEntry}}, \code{\link{getForm}} in package
\code{RCurl}
}
\keyword{database}

