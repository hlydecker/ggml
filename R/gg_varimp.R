#' Make A Ggplot Random Forest Variable Importance Plot
#'
#' This function takes a random forest model objection, and a title description string, and produces a pretty ggplot variable imporance plot.
#'
#' @param random_forest_model a random forest model object
#' @param comparison a string describing the model
#' @export
gg_varimp <- function(random_forest_model,comparison){

  # Bring in your model and get a variable importance object
  varImp_object <- varImp(random_forest_model)
  # Exract a data frame from that
  variables_and_importances <- varImp_object$importance %>%
    rownames_to_column(var = "variable")

  # Make a ggplot
  variables_and_importances %>%
    mutate(variable = fct_reorder(variable, Overall)) %>%
    ggplot(aes(x=Overall,y=variable,fill=Overall)) +
    geom_bar(stat="identity") +
    # Used proprietary USYD colours here
    scale_fill_gradientn(colours=usyd_palette("jacaranda",100, type = "continuous"))+
    labs(
      title = paste0("Random Forest Variable Imporance: \n",comparison),
      x = "Importance",
      y = NULL
    ) +
    theme(legend.position="none")
}
