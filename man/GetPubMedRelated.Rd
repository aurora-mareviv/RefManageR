\name{GetPubMedRelated}
\alias{GetPubMedRelated}
\title{Retrieve related articles from PubMed using PubMed ID's}
\usage{
GetPubMedRelated(id, database = "pubmed", batch.mode = TRUE,
  max.results = 10, return.sim.scores = FALSE, return.related.ids = FALSE)
}
\arguments{
  \item{id}{either a character vector of PubMed ID's or a
  BibEntry object, which is expected to have at least some
  entries with \code{eprinttype = "pubmed"} and eprint
  field specifying a PubMed ID.}

  \item{database}{string; the Entrez database to search}

  \item{batch.mode}{logical; if \code{TRUE}, the PubMed IDs
  in \code{id} are combined by Entrez when searching for
  linked IDs so that only one set of linked IDs is
  returned.  If \code{FALSE}, a set of linked IDs is
  obtained for each ID in \code{id}. will be returned}

  \item{max.results}{numeric vector; the maximum number of
  results to return if \code{batch.mode} \code{TRUE}; or if
  \code{batch.mode} is \code{FALSE}, this should have the
  same length as \code{id} with each element giving the
  maximum number of results to return for the corresponding
  ID.}

  \item{return.sim.scores}{logical; Entrez returns a
  similarity score with each returned citation giving a
  measure of how similar the returned entry is to the ones
  specified by the query.  If \code{TRUE} these scores are
  added to the returned BibEntry object in a field called
  \sQuote{score}.}

  \item{return.related.ids}{logical; should the original
  PubMed ID(s) that a returned entry is related to be
  stored in a field called \sQuote{PMIDrelated}.}
}
\value{
an object of class BibEntry.
}
\description{
Searches PubMed for articles related to a set of PubMed
ID's using NCBI's E-Utilities.
}
\examples{
if (interactive() && url.exists("http://eutils.ncbi.nlm.nih.gov/")){
  file.name <- system.file("Bib", "RJC.bib", package="RefManageR")
  bib <- ReadBib(file.name)
  bib <- LookupPubMedID(bib[[101:102]])
  toBiblatex(GetPubMedRelated(bib, batch.mode = TRUE, max.results = 2,
  return.sim.scores = TRUE, return.related.ids = TRUE))
  GetPubMedRelated(bib, batch.mode = FALSE, max.results = c(2, 2))
}
}
\references{
\url{http://www.ncbi.nlm.nih.gov/books/NBK25500/}
}
\seealso{
Other pubmed: \code{\link{GetDOIs}};
\code{\link{GetPubMedByID}}; \code{\link{LookupPubMedID}};
\code{\link{ReadCrossRef}}; \code{\link{ReadPubMed}}
}
\keyword{database}

