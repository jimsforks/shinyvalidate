% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validator.R
\name{input_provided}
\alias{input_provided}
\title{Check whether an input value has been provided}
\usage{
input_provided(val)
}
\arguments{
\item{val}{Values to test for availability in a Shiny context.}
}
\value{
A logical vector of length 1.
}
\description{
This function takes an input value and uses heuristics to guess whether it
represents an "empty" input vs. one that the user has provided. This will
vary by input type; for example, a \code{\link[shiny:textInput]{shiny::textInput()}} is \code{""} when empty,
while a \code{\link[shiny:numericInput]{shiny::numericInput()}} is \code{NA}.

\code{input_provided} returns \code{TRUE} for all values except:
\itemize{
\item \code{NULL}
\item \code{""}
\item An empty atomic vector or list
\item An atomic vector that contains only missing (\code{NA}) values
\item A character vector that contains only missing and/or \code{""} values
\item An object of class \code{"try-error"}
\item A value that represents an unclicked \code{\link[shiny:actionButton]{shiny::actionButton()}}
}
}
\details{
This function is based on \code{\link[shiny:req]{shiny::isTruthy()}} but tweaked here in
shinyvalidate to change the treatment of \code{FALSE} values: \code{isTruthy(FALSE)}
returns \code{FALSE}, but \code{input_provided(FALSE)} returns \code{TRUE}. This difference
is motivated by \code{shiny::checkboxInput()}, where \code{isTruthy()} answers the
question of "is the input present \emph{and checked}" while \code{input_provided} is
just "is the input present".
}
