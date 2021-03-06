\name{$.BibEntry}
\alias{$.BibEntry}
\title{Extract fields from a BibEntry object}
\usage{
\method{$}{BibEntry}(x, name)
}
\arguments{
  \item{x}{an object of class BibEntry}

  \item{name}{the field to extract}
}
\value{
a named list of values for the field specified by name for
each entry; \code{NULL} if the field is not present for a
particular entry.  The names attribute of the returned list
contains the entry keys (potentially back-quoted).
}
\description{
used to extract a single field from each entry in a
BibEntry object
}
\note{
\code{name} may be \dQuote{bibtype} to extract entry types
or \dQuote{key} to extract keys.
}
\examples{
file.name <- system.file("Bib", "biblatexExamples.bib", package="RefManageR")
bib <- suppressMessages(ReadBib(file.name))
bib[[50:55]]$author
bib[[seq_len(5)]]$bibtype
}
\seealso{
Other operators: \code{\link{$<-.BibEntry}};
\code{\link{+.BibEntry}}, \code{\link{+.BibEntry}},
\code{\link{merge.BibEntry}}; \code{\link{SearchBib}},
\code{\link{[.BibEntry}}, \code{\link{[.BibEntry}},
\code{\link{[.BibEntry}}; \code{\link{[<-.BibEntry}};
\code{\link{[[.BibEntry}}; \code{\link{[[<-.BibEntry}};
\code{\link{c.BibEntry}}
}

