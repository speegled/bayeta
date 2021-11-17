#' Retinal Thickness
#'
#' Thickness of various measurements of the retina by age.
#'
#' @format A data frame with 297 observations of 6 variables
#' \describe{
#'   \item{sex}{female or male}
#'   \item{age}{in years}
#'   \item{onl_central}{thickness of central outer nuclear layer (micrometers)}
#'   \item{onl_inner}{inner outer nuclear layer}
#'   \item{onl_outer}{outer outer nuclear layer}
#'   \item{onl_mean}{mean of inner and outer outer nuclear layer, as per authors}
#' }
#'
#' This data is used to investigate whether retinal thickness is associated with age. From the authors: "New optical coherence tomography (OCT) techniques are excellent tools for the noninvasive, in vivo, high-resolution visualization of the retina. Such tools can be used to monitor retinal thickness in the region of the macula as this measurement is useful for the diagnosis and follow up of many macular and optic nerve disorders. It is, therefore, important that we can distinguish between pathological changes and those associated with age."
#'
#' The original article has many more measurements of other parts of the retina.
#'
#' @source https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0194169
"retina"
