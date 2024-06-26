#' Braille dot heights
#'
#' Reading time and other statistics related to the height of braille dot heights.
#'
#' @format A data frame with 36 observations of 15 variables
#' \describe{
#'   \item{subject}{Number of subject, 1-12}
#'   \item{trial}{Trial, 1-3}
#'   \item{height}{Height of braille dots; 1 = low, 2 = medium, 3 = high}
#'   \item{reading_rate_wpm}{words per minute read}
#'   \item{total_backwards_count}{number of times hand moved backwards at least 1/4 inch}
#'   \item{primary_regressions_count}{count of first regressive movement to a particular word or a series of words}
#'   \item{repeat_regressions_count}{count of all other (non-first) regressive movement to a particular word or a series of words}
#'   \item{total_rereading_time_s}{amount of time spent re-reading words or phrases, in seconds}
#'   \item{mean_forward_speed_cm_s}{speed moving forward, cm per second}
#'   \item{mean_backward_speed_cm_s}{speed moving backward, cm per second}
#'   \item{age}{Age in years of participant}
#'   \item{gender}{Gender of participant}
#'   \item{handedness_score}{Edinburgh Handedness Inventory. Less than -0.4 is left-handed, between -0.4 and 0.4 is ambi, and greater than 0.4 is right-handed}
#'   \item{hand_used}{Hand used when reading}
#' }
#'
#' From the authors: "It is well known that people who read print or braille sometimes make eye or finger movements against the reading direction. The way these regressions are elicited has been studied in detail by manipulating linguistic aspects of the reading material. Actually, it has been shown that reducing the physical intensity or clarity of the visual input signal can also lead to increased regressions during reading. We asked whether the same might be true in the haptic realm while reading braille."
#'
#' @source https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0214799
"braille"
