\name{eq_load_clean_data}
\alias{eq_load_clean_data}
\title{Load Clean Earthquakes Data}
\usage{
eq_load_clean_data()
}
\value{
A \code{tbl_df} of NOAA Significant Earthquakes Data, cleaned with
  the functions \link{eq_clean_data} and \link{eq_location_clean}.
}
\description{
\code{eq_load_clean_data} is a shortcut to loading and cleaning the NOAA
\code{\link{quakes}} data supplied with this package.
}
\details{
This function is a quick shortcut to load the \code{\link{quakes}} data
supplied with this package.  If the April 1, 2017 cutoff is sufficient for
you, use this function to save a few keystrokes.
}
\examples{
library(dplyr)
quakes1 <- eq_load_clean_data()
# is equivalent to:
quakes2 <- quakes \%>\% eq_clean_data() \%>\% eq_location_clean()
}
