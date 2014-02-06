\name{GetPubMedByID}
\alias{GetPubMedByID}
\title{Retrieve citation information from NCBI's Entrez for a set of PubMed IDs}
\usage{
GetPubMedByID(id, db = "pubmed", ...)
}
\arguments{
  \item{id}{character vector; PubMed ID's for searching
  NCBI's Entrez.}

  \item{db}{string; Entrez database to search.}

  \item{...}{additional parameters to use for the search.
  See the Entrez documentation listed in the
  \emph{References}.}
}
\value{
a BibEntry object.
}
\description{
Uses NCBI's E-Utilities to retrieve bibliographic
information given a vector of PubMed ID's and returns the
results as a BibEntry object.
}
\note{
If journal information is returned for an ID, then and
Article entry will be created; otherwise, a Misc entry will
be created.
}
\examples{
GetPubMedByID(c("11209037", "21245076"))
}
\references{
\url{http://www.ncbi.nlm.nih.gov/books/NBK25500/}
}
\seealso{
Other pubmed: \code{\link{GetPubMedRelated}};
\code{\link{LookupPubMedID}}; \code{\link{ReadCrossRef}};
\code{\link{ReadPubMed}}
}
\keyword{database}
