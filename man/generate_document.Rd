% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exam.R
\name{generate_document}
\alias{generate_document}
\alias{generate_document.exam}
\title{Generate the exam document}
\usage{
generate_document(ex, out_dir, output_format, encoding, new_pages)

\method{generate_document}{exam}(
  ex,
  out_dir = NULL,
  output_format = "pdf_document",
  encoding = "UTF-8",
  new_pages = NULL
)
}
\arguments{
\item{ex}{An `exam` object.}

\item{out_dir}{A string indicating the output folder.}

\item{output_format}{A vector of strings specifying the desired output formats.}

\item{encoding}{A string specifying the encoding.}

\item{new_pages}{A string with the values 'all', 'none', or NULL.}
}
\value{
An `exam` object.
}
\description{
From an exam object, we generate different instances of the exam to deliver to
the individuals being examined. To do this, we need to specify the folder where
they will be generated (using parameter `out_dir`), the output format (using
parameter `output_format`), the encoding (using parameter `encoding`), and whether
we want each exercise to start on a new page, include exercises until the pages
are filled, or preserve the definition of the exercise in this regard (using
parameter `new_pages` with the values 'all', 'none', or NULL).
}
\examples{

\dontrun{
rmd <- system.file("extdata/template01.Rmd", package = "rexer")
exercises <- system.file("extdata/exercises.csv", package = "rexer")
ex <- exam(
  rmd = rmd,
  examinees = NULL,
  instances_num = 1,
  random = TRUE,
  reorder_exercises = TRUE
) |>
  define_exercises_from_csv(exercises) |>
  generate_document(out_dir = tempdir(), new_pages = 'all')
}

}
\seealso{
Other exam definition: 
\code{\link{exam}()},
\code{\link{generate_correction_document}()}
}
\concept{exam definition}
