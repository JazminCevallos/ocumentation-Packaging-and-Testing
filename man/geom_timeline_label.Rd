\name{geom_timeline_label}
\alias{geom_timeline_label}
\title{Label Largest Earthquakes on Timeline}
\usage{
geom_timeline_label(mapping = NULL, data = NULL, stat = "identity",
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
\code{geom_timeline_label} works best when used with
\code{\link{geom_timeline}}, labeling the top \code{n} earthquakes, by
magnitude, with a specified label field.  By default, the labels are for
the top 5 earthquakes for each country specified, however, the user may
adjust this with the \code{n_max} aesthetic.
}
\section{Aesthetics}{

\code{geom_timeline_label} undertands the following aesthetics (required
aesthetics are in bold):
\itemize{
 \item \strong{x}: recommend \code{DATE}
 \item \strong{label}: recommend \code{LOCATION_NAME}
 \item \strong{magnitude}: recommend \code{EQ_PRIMARY}
 \item y: recommend \code{COUNTRY}
 \item n_max: default 5. Top \code{n} earthquakes to label,
       sorted by magnitude.
 \item color
 \item linetype
 \item size
 \item alpha
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
  geom_timeline_label(aes(x = DATE, y = COUNTRY, magnitude = EQ_PRIMARY,
                         label = LOCATION_NAME, n_max = 5)) +
  scale_size_continuous(name = 'Richter scale value') +
  scale_color_continuous(name = '# of Deaths') +
  theme_eq()
}
