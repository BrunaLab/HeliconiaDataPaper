create_plot_info_file <- function() {
  library(tidyverse)
  
  

# create version file -----------------------------------------------------

  # source("./code/create_version_file.R")
  # dataset<-"plots"
  # create_version_file(dataset)  
  
  # load the complete and clean Heliconia dataset ---------------------------
  
  
  # these are the years each fragment was isolated
  isolation <- tibble(
    "bdffp_no" = c(2107, 2108, 1104, 3114, 2206, 1202, 3209),
    "yr_isolated" = c(1984, 1984, 1980, 1983, 1984, 1980, 1983)
  ) %>%
    mutate(across(where(is.double), as.factor))
  
  # select the plot id variables
  ha_plots <- read_csv("./data/survey_clean/heliconia_survey_clean.csv",
                       show_col_types = FALSE) %>% 
    select(
      "plot_id",
      "habitat",
      "ranch",
      "bdffp_reserve_no"
    ) %>%
    distinct() %>%
    arrange(plot_id) %>%
    mutate(ranch = recode_factor(ranch, "PortoAlegre" = "porto alegre")) %>%
    mutate(ranch = recode_factor(ranch, "DIM" = "dimona")) %>%
    mutate(ranch = recode_factor(ranch, "PAL" = "porto alegre")) %>%
    mutate(ranch = recode_factor(ranch, "EST" = "esteio")) %>%
    mutate(habitat = recode_factor(habitat, "1-ha" = "one")) %>%
    mutate(habitat = recode_factor(habitat, "10-ha" = "ten")) %>%
    mutate(habitat = recode_factor(habitat, "CF" = "forest")) %>%
    mutate(bdffp_reserve_no = replace(bdffp_reserve_no, bdffp_reserve_no == "none", NA)) %>%
    rename(
      "bdffp_no" = "bdffp_reserve_no"
    ) %>%
    left_join(isolation, by="bdffp_no")
  

# save the csv file -------------------------------------------------------

  
  
  if (!dir.exists("./data/survey_clean")){
    dir.create("./data/survey_clean")
  }else{
    # print(" ")
  }
  
  print("The file has been saved to: 'data/survey_clean/HDP_plots.csv' ")
  
  write_csv(ha_plots, "./data/survey_clean/HDP_plots.csv")
  
  
}

