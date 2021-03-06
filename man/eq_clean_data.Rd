\name{eq_clean_data}
\alias{eq_clean_data}
\title{Clean Earthquake Data}
\usage{
eq_clean_data(data)
}
\arguments{
\item{data}{A data frame of NOAA significant earthquake data, similar to what
can be loaded with \code{data(quakes)}. At a minimum, the data needs to
have \code{YEAR}, \code{MONTH}, \code{DAY}, \code{LATITUDE},
\code{LONGITUDE}, \code{DEATHS}, \code{TOTAL_DEATHS}, and \code{EQ_PRIMARY}
features.}
}
\value{
A \code{tbl_df} with the same supplied data, but with
  \code{LATITUDE}, \code{LONGITUDE}, \code{DEATHS}, \code{TOTAL_DEATHS}, and
  \code{EQ_PRIMARY} converted from \code{character} to \code{numeric}, and a
  new column \code{DATE}.
}
\description{
\code{eq_clean_data} takes a data frame of NOAA earthquake data and cleans it
up for further analysis.
}
\details{
This function takes a data frame of NOAA earthquake data, which may be
obtained from NOAA's
\href{https://www.ngdc.noaa.gov/nndc/struts/form?t=101650&s=1&d=1}{Significant
EarthQuake Database}, or loaded into the envirnoment with \code{data(quakes)}
(April 1, 2017 snapshot), and cleans it up for further analysis.  In
particular, it creates a \code{DATE} feature by combing the \code{YEAR},
\code{MONTH}, and \code{DAY} features, and makes sure the \code{LATITUDE} and
\code{LONGITUDE} features are of type \code{numeric}.  Also converts the
\code{DEATHS}, \code{TOTAL_DEATHS}, and \code{EQ_PRIMARY} (Richter scale
value) to type \code{numeric}.

For the \code{DATE} variable, note that R does not handle years before 1CE
correctly (see documentation for \code{\link[base]{as.Date}}). This function
has attempted to make an approximation of those dates, but the user should
handle with care.  Also, for some events the month and day are not available,
so those are approximated by January and 01, respectively.
}
\examples{

data(quakes)
quakes_clean <- eq_clean_data(quakes)
}
