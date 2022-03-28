# FIXME: broken work in progress
# You have been warned

gg_raincloud <- function(dataframe, x_var, y_var, y_label,orientation = "horizontal") {
  if (orientation == "horizontal") {
    dataframe %>%
      ggplot(aes(x = x_var, y = y_var, fill = x_var)) +
      ggdist::stat_halfeye(
        adjust = 0.5,
        width = 0.6,
        .width = 0,
        justification = -.2,
        alpha = 0.75
      ) +
      geom_boxplot(width = 0.15,
                   outlier.shape = NA,
                   alpha = 0.75) +
      gghalves::geom_half_point(side = "1",
                                range_scale = 0.4,
                                alpha = 0.1) +
      scale_fill_manual(values = usyd_palette("extended")) +
      labs(x = NULL,
           y = y_label) +
      theme(legend.position = "none") +
      coord_flip()
  } else {
    dataframe %>%
      ggplot(aes(x = x_var, y = y_var, fill = x_var)) +
      ggdist::stat_halfeye(
        adjust = 0.5,
        width = 0.6,
        .width = 0,
        justification = -.2,
        alpha = 0.75
      ) +
      geom_boxplot(width = 0.15,
                   outlier.shape = NA,
                   alpha = 0.75) +
      gghalves::geom_half_point(side = "1",
                                range_scale = 0.4,
                                alpha = 0.1) +
      scale_fill_manual(values = usyd_palette("extended")) +
      labs(x = NULL,
           y = y_label) +
      theme(legend.position = "none")
  }
}
