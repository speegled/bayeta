#' Video Games
#'
#' Number of players of video games in February, 2021.
#'
#' @format A data frame with 231 observations of 15 variables
#' \describe{
#'   \item{gamename}{name of game}
#'   \item{avg}{average number of players at same time}
#'   \item{gain}{change from January, 2021}
#'   \item{peak}{highest number of players since release}
#'   \item{avg_peak_perc}{average number of players as a percentage of peak}
#'   \item{number}{game number}
#'   \item{release_date}{release datae}
#'   \item{price}{us dollars}
#'   \item{ownwers}{estimated number of people owning this game}
#'   \item{developer}{group that developed game}
#'   \item{publisher}{group that published game}
#'   \item{average_playtime}{average playtime in minutes}
#'   \item{median_playtime}{median playtime in minutes}
#'   \item{metascore}{rating}
#'   \item{age}{number of days between release and February 2021}
#' }
#'
#' @source \url{https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-07-30} and \url{https://github.com/rfordatascience/tidytuesday/tree/master/data/2021/2021-03-16}
"games"
