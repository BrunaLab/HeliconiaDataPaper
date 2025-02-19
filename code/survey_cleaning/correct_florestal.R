correct_florestal <- function(ha_data) {

  library(tidyverse)
  # Florestal is CF-1   
  
  suppressMessages({
  

# 277 ---------------------------------------------------------------------
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 (ha_data$year == 2005 |
                    ha_data$year == 2006|
                    ha_data$year == 2007) &
                 ha_data$tag_number == 277] <- NA
  
  ha_data$shts[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 277] <- NA
  
  ha_data$ht[ha_data$plot == 'Florestal-CF' &
               ha_data$year == 2004 &
               ha_data$tag_number == 277] <- NA
  
  ha_data$infl[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 277] <- NA

# 1 -----------------------------------------------------------------------
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 1] <- "missing"

# 1508 --------------------------------------------------------------------
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 1508] <- "missing"
  
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 1508] <- "missing"
  
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 1508] <- "missing"

# 799 ---------------------------------------------------------------------
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 799] <- "missing"
  
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 799] <- "missing"

# correcting column "0" ---------------------------------------------------

  ha_data$column[ha_data$plot == "Florestal-CF" & ha_data$column == 0] <- 1

# 590 ---------------------------------------------------------------------
  # plant size entered incorrectly (entered as 449, should be 49)
  ha_data$ht[ha_data$plot == "Florestal-CF" & 
               ha_data$year == 2003 &
               ha_data$tag_number == 590] <- 49

# 1916 --------------------------------------------------------------------
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == "Florestal-CF" &
                 ha_data$year == 2008 & 
                 ha_data$tag_number == 1916] <- "ULY"

# 967 ---------------------------------------------------------------------
  # incorrectly recorded the ht as 73 (it is 7.3). Rounded down.
  ha_data$ht[ha_data$plot == "Florestal-CF" &
               ha_data$year == 2001 & 
               ha_data$tag_number == 967] <- 7

# 378 ---------------------------------------------------------------------
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == "Florestal-CF" &
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 378] <- "ULY"
  
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == "Florestal-CF" &
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 378] <- "ULY"

# 1578 --------------------------------------------------------------------
  # incorrectly recorded as seedling ("nova com cara de velha")
  ha_data$code[ha_data$plot == "Florestal-CF" &
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 1578] <- "ULY"

# 1290 --------------------------------------------------------------------
  # correction (found after referring to the datasheet to fix 378 above)
  ha_data$shts[ha_data$plot == "Florestal-CF" &
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 1290] <- 2
  ha_data$ht[ha_data$plot == "Florestal-CF" &
               ha_data$year == 2007 & 
               ha_data$tag_number == 1290] <- 16
  ha_data$code[ha_data$plot == "Florestal-CF" &
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 1290] <- NA

# 682 ---------------------------------------------------------------------
  # correcting 682 height in 2003 (entered as 266 instead of 26)
  ha_data<-ha_data %>%
    mutate(ht=replace(ht,(plot=="Florestal-CF" & 
                            tag_number==682 & 
                            year==2003), 26))
  

# 576 ---------------------------------------------------------------------
  # correcting 576
  ha_data<-ha_data %>%
    mutate(row=replace(row,(plot=="Florestal-CF" & 
                              tag_number==576), "E")) %>% 
    mutate(shts=replace(shts,(plot=="Florestal-CF" &
                                tag_number==576 &
                                year==2008), 4)) %>% 
    mutate(ht=replace(ht,(plot=="Florestal-CF" & 
                            tag_number==576 & 
                            year==2008), 66)) %>% 
    filter(!(plot=="Florestal-CF" & 
               tag_number==576 & 
               column==1))


# 258 ---------------------------------------------------------------------
  # 285 incorrect height in 1998
  ha_data<-ha_data %>%
    mutate(ht=replace(ht, plot=="Florestal-CF" & year==1998 & tag_number==285,NA))

# 201 ---------------------------------------------------------------------
  # 201 incorrect height in 2002
  ha_data<-ha_data %>%
    mutate(ht=replace(ht, plot=="Florestal-CF" & year==2001 & tag_number==201,NA))

# code corrections --------------------------------------------------------

# 335 / 727 / 941 / 1053 --------------------------------------------------
  # Correcting NOL code  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="Florestal-CF" & 
                          year==2004 & 
                          tag_number==335,NA)) %>% 
    mutate(code=replace(code, plot=="Florestal-CF" & 
                          year==2002 & 
                          tag_number==727,NA)) %>% 
    mutate(code=replace(code, plot=="Florestal-CF" &
                          year==2002 & 
                          tag_number==941,NA)) %>% 
    mutate(code=replace(code, plot=="Florestal-CF" & 
                          year==2002 &
                          tag_number==1053,NA))
  

# 738 ---------------------------------------------------------------------
  # 738: can tell from numbering on 00 survbey sheet it was a seedling marked in 
  # 2000 but measuremtns weren't recorded, then not measured in 2001
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="Florestal-CF" & 
                          year==2000 & 
                          tag_number==738,"sdlg")) %>% 
    mutate(code=replace(code, plot=="Florestal-CF" & 
                          year==2001 & 
                          tag_number==738,"missing"))

# 578 ---------------------------------------------------------------------
  # in 2002 578 under treefall
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="Florestal-CF" & year==2002 & tag_number==578,"under treefall"))

# 374 ---------------------------------------------------------------------
  # 374: height correction in 1999
  ha_data<-ha_data %>%
    mutate(ht=replace(ht, plot=="Florestal-CF" & 
                        year==1999 & 
                        tag_number==374,101)) 

# 28 ----------------------------------------------------------------------
  # 28: infl in 2003 (from 2004 record) and correcting ht/shts in 2005 
  #  the numbers are written over each other, so it looks like (1, 10) but is 
  # actually (4, 110)
  ha_data<-ha_data %>%
    mutate(infl=replace(infl, plot=="Florestal-CF" & 
                          year==2003 & 
                          tag_number==28,1)) %>% 
    mutate(shts=replace(shts, plot=="Florestal-CF" & 
                          year==2005 &
                          tag_number==28,4)) %>% 
    mutate(ht=replace(ht, plot=="Florestal-CF" & 
                        year==2005 & 
                        tag_number==28,110))
    

# 1079 --------------------------------------------------------------------
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="Florestal-CF" & 
                          year==2004 & 
                          tag_number==1079,"dead")) 

  
# 728 --------------------------------------------------------------------
  # Seedling accidentally entered 2 infl for this seedling during data entry. 
  # validated as error by checking data sheets
  
  ha_data<-ha_data %>%
    mutate(infl=replace(infl, plot=="Florestal-CF" & 
                          year==2000 & 
                          tag_number==728,NA)) 
  
  
  # 1163 --------------------------------------------------------------------
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="Florestal-CF" & 
                          year==2004 & 
                          tag_number==1163,"dead")) 
  
# 96 ----------------------------------------------------------------------
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="Florestal-CF" & 
                          year==2000 & 
                          tag_number==96,"under treefall")) 
 

# 277 / 1004  -------------------------------------------------------------
  # 277 tag changed to 1004 but 1 row not deleted. 1004 dead in 2007. 
  # Correct and delete 277 
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="Florestal-CF" & 
                          year==2007 & 
                          tag_number==1004,"dead")) 
  
  to_delete <- ha_data %>%
    filter(plot == "Florestal-CF" &
             tag_number == 277)
  
    ha_data <- anti_join(ha_data, to_delete)
  
  rm(to_delete)

# 1002 --------------------------------------------------------------------
  # 1002 dead in 2009 
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="Florestal-CF" &
                          year==2009 & 
                          tag_number==1002,"dead")) 

# 187 ---------------------------------------------------------------------
  # delete the 187: couldn't find any info on it
  to_delete <- ha_data %>%
    filter(plot == "Florestal-CF" &
             tag_number == 187)
  
    ha_data <- anti_join(ha_data, to_delete)
  
  rm(to_delete)

# 106 ---------------------------------------------------------------------
  # delete the 106: couldn't find any info on it
  to_delete <- ha_data %>%
    filter(plot == "Florestal-CF" &
             tag_number == 106)
  
    ha_data <- anti_join(ha_data, to_delete)
    
    rm(to_delete)
  
  })
  
   
  return(ha_data)
}