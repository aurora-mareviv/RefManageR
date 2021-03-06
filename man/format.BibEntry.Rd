\name{format.BibEntry}
\alias{format.BibEntry}
\title{Encode in a common format}
\usage{
\method{format}{BibEntry}(x, style = .BibOptions$style,
  .bibstyle = .BibOptions$bib.style,
  citation.bibtex.max = getOption("citation.bibtex.max", 1), .sort = TRUE,
  .sorting = "nty", enc = "UTF-8", ...)
}
\arguments{
  \item{x}{- an object of class BibEntry}

  \item{style}{}
}
\value{
character vector containing formatted BibEntry object.
}
\description{
Format a BibEntry object in a pretty format.
}
\seealso{
\code{\link{print.BibEntry}}, \code{\link{BibEntry}}
}
\keyword{internal}

