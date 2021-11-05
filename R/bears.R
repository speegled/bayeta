#' Bear Rubbing
#'
#' Number of offspring and rubbing behavior of bears.
#'
#' @format A data frame with 87 observations of 4 variables
#' \describe{
#'   \item{albeta_offspring_id}{Unique ID of bear}
#'   \item{sex}{F or M}
#'   \item{mates}{number of mates the bear had}
#'   \item{offspring}{number of offspring the bear had}
#'   \item{num_rubs}{standardized number of rub objects that the bear rubbed on}
#'   \item{num_occasion}{standardized number of occasions the bear rubbed on an object}
#'   \item{rel_age}{age of bear determined by number of generations of offspring, standardized}
#' }
#'
#' This data is used to investigate why bears rub on things. From the authors: "Several species of bears are known to rub deliberately against trees and other objects, but little is known about why bears rub. Patterns in rubbing behavior of male and female brown bears (Ursus arctos) suggest that scent marking via rubbing functions to communicate among potential mates or competitors."
#'
#' @source https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0247964
"bears"
