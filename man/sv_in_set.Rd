% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rules.R
\name{sv_in_set}
\alias{sv_in_set}
\title{Validate that a field is part of a defined set}
\usage{
sv_in_set(
  set,
  message_fmt = "Must be in the set of {values_text}.",
  set_limit = 3
)
}
\arguments{
\item{set}{A vector or list of elements for which the field value must be a
part of (\code{value \%in\% set} must be \code{TRUE}) to pass validation. To allow an
empty field, \code{NA} should be included in the \code{set} vector. Optionally, \code{NaN}
can be included as well.}

\item{message_fmt}{The validation error message to use if a value fails to
match the rule. The message can be customized by using the
\code{"{values_text}"} string parameter, which allows for the insertion of \code{set}
values (formatted internally as a text list and controlled via the
\code{set_limit} parameter). While the default message uses this string
parameter, it is not required in a user-defined \code{message_fmt} string.}

\item{set_limit}{The limit of \code{set} values to include in the
automatically-generated error message (i.e., when \code{message = NULL}, the
default). If the number of elements provided in \code{set} is greater than
\code{set_limit} then only the first \verb{<message_limit>} set elements will be
echoed along with text that states how many extra elements are part of the
\code{set}.}
}
\value{
A function suitable for use as an
\code{\link[=InputValidator]{InputValidator$add_rule()}} rule.
}
\description{
The \code{sv_in_set()} function checks whether the field value is a member of a
specified set of values.
}
\examples{
## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
library(shinyvalidate)

ui <- fluidPage(
  textInput("rating", "Rating")
)

server <- function(input, output, session) {
  
  # Validation rules are set in the server, start by
  # making a new instance of an `InputValidator()`
  iv <- InputValidator$new()

  # Basic usage: `sv_in_set()` requires a value
  # set given as a vector; a message will be
  # shown if the validation of `input$rating` fails
  iv$add_rule("rating", sv_in_set(1:5))

  # Finally, `enable()` the validation rules
  iv$enable()
}

shinyApp(ui, server)

}

}
\seealso{
The \code{\link[=sv_between]{sv_between()}} function, which tests whether a field values
between two boundary values.

Other rule functions: 
\code{\link{compose_rules}()},
\code{\link{sv_between}()},
\code{\link{sv_email}()},
\code{\link{sv_equal}()},
\code{\link{sv_gte}()},
\code{\link{sv_gt}()},
\code{\link{sv_integer}()},
\code{\link{sv_lte}()},
\code{\link{sv_lt}()},
\code{\link{sv_not_equal}()},
\code{\link{sv_numeric}()},
\code{\link{sv_optional}()},
\code{\link{sv_regex}()},
\code{\link{sv_required}()},
\code{\link{sv_url}()}
}
\concept{rule functions}
