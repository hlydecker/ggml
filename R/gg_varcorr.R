# TODO: make actually good

library(corrr)
vars_to_exclude <- c("treatment","data_group","rhythm_during_echo")

gg_variable_correlation <- function(dataframe, target_var, corr_threshold){
  
  df_cor <- dataframe %>%
    correlate() %>%
    corrr::focus(target_var)
  
  df_cor %>%
    mutate(term = fct_reorder(term, target_var)) %>%
    ggplot(aes(x = target_var, y = term, fill = abs(target_var))) +
    geom_bar(stat = "identity") +
    geom_vline(xintercept = corr_threshold, color = "black") +
    geom_vline(xintercept = -corr_threshold, color = "black") +
    scale_fill_gradientn(colours = usyd_palette("flametree", 100, type = "continuous")) +
    labs(y = NULL,
         x = "Age") +
    theme(legend.position = "none")
}
