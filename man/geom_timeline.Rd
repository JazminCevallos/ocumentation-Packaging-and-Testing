\name{geom_timeline}
\alias{geom_timeline}
\title{Timeline of Earthquakes}
\usage{
geom_timeline(mapping = NULL, data = NULL, stat = "identity",
  position = "identity", na.rm = FALSE, show.legend = NA,
  inherit.aes = TRUE, ...)
}
\arguments{
\item{mapping}{See \code{ggplot2} \code{\link[ggplot2]{layer}}}

\item{data}{See \code{ggplot2} \code{\link[ggplot2]{layer}}}

\item{stat}{See \code{ggplot2} \code{\link[ggplot2]{layer}}}

\item{position}{See \code{ggplot2} \code{\link[ggplot2]{layer}}}

\item{na.rm}{See \code{ggplot2} \code{\link[ggplot2]{layer}}}

\item{show.legend}{See \code{ggplot2} \code{\link[ggplot2]{layer}}}

\item{inherit.aes}{See \code{ggplot2} \code{\link[ggplot2]{layer}}}

\item{...}{other arguments passed on to \code{\link{layer}}.}
}
\description{
\code{geom_timeline} shows a timeline of NOAA Significant earthquakes,
plotting individual countries along the y-axis and dates along the x-axis.
The size of the points is relatative to the earthquakes' magnitude, and
the color is related to the total number of deaths.
}
\details{
It is highly recommended that this geom is not used in isolation. For
best results, use it with the \code{\link{eq_timeline}} wrapper function.
}
\section{Aesthetics}{

\code{geom_timeline} undertands the following aesthetics (required
aesthetics are in bold):
\itemize{
 \item \strong{x}: recommend \code{DATE}
 \item y: recommend \code{COUNTRY}
 \item size: recommend \code{EQ_PRIMARY}
 \item color: recommend \code{TOTAL_DEATHS}
 \item alpha
 \item shape
 \item stroke
 \item fill
}
}

\examples{
library(dplyr); library(ggplot2)
quakes <- eq_load_clean_data()

quakes \%>\%
  dplyr::filter(COUNTRY \%in\% c('USA', 'UK')) \%>\%
  dplyr::filter(DATE > '2000-01-01') \%>\%
  ggplot() +
  geom_timeline(aes(x = DATE, y = COUNTRY, color = TOTAL_DEATHS,
                    size = EQ_PRIMARY)) +
  scale_size_continuous(name = 'Richter scale value') +
  scale_color_continuous(name = '# of Deaths') +
  theme_eq()
}
