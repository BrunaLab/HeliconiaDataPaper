# Corrections Dimona-CF ---------------------------------------------------
correct_dimona_cf <- function(ha_data) {

  # Dimona-CF is CF-4   
  library(tidyverse)
  
  suppressMessages({
  

# 196/194 -----------------------------------------------------------------
  # 196: delete 196 in D6 (it is actually 194). Correct the record for 194
  omit196<-ha_data %>% filter(plot=="Dimona-CF" & 
                                tag_number==196 &
                                row=="D" & 
                                column==6)
  
  ha_data<-anti_join(ha_data,omit196)
  
  rm(omit196)
  
  # correcting 194
  ha_data$code[ha_data$plot == "Dimona-CF" &
                 ha_data$tag_number == 194 &
                 ha_data$year == 2006] <- "sdlg"
  
  ha_data$infl[ha_data$plot == "Dimona-CF" &
                 ha_data$tag_number == 194 &
                 ha_data$year == 2006] <- 0
  

# 197/297 -----------------------------------------------------------------
  # the 197 ion E8 is actually 297
  # add the 2009 measurement to 197 in e10
  ha_data$shts[ha_data$plot == "Dimona-CF" &
                 ha_data$tag_number == 197 &
                 ha_data$row == "E" &
                 ha_data$column == 10 &
                 ha_data$year == 2009] <- 1
  
  ha_data$ht[ha_data$plot == "Dimona-CF" &
               ha_data$tag_number == 197 &
               ha_data$row == "E" &
               ha_data$column == 10 &
               ha_data$year == 2009] <- 12
  
  # add 2007, 2008 measurements to 297
  ha_data$shts[ha_data$plot == "Dimona-CF" &
                 ha_data$tag_number == 297 &
                 ha_data$year == 2007] <- 1
  
  ha_data$ht[ha_data$plot == "Dimona-CF" &
               ha_data$tag_number == 297 &
               ha_data$year == 2007] <- 7
  
  ha_data$code[ha_data$plot == "Dimona-CF" &
                 ha_data$tag_number == 297 &
                 ha_data$year == 2007] <- "sdlg"
  
  ha_data$shts[ha_data$plot == "Dimona-CF" &
                 ha_data$tag_number == 297 &
                 ha_data$year == 2008] <- 1
  
  ha_data$ht[ha_data$plot == "Dimona-CF" &
               ha_data$tag_number == 297 &
               ha_data$year == 2008] <- 4
  
  # delete the 197 in e8
  omit197<-ha_data %>% filter(plot=="Dimona-CF" & 
                                tag_number==197 &
                                row=="E" & 
                                column==8)
  
  ha_data<-anti_join(ha_data,omit197)
  
  rm(omit197)

# 90 ----------------------------------------------------------------------
  # 90 on edge of plot; measurements recorded in a diff plot in one survey year, 
  # which created a duplicate record. Opted for location with the most 
  # measurements, then deleted the other.
  
  # add 2009 measurements to 90 in D10
  ha_data$shts[ha_data$plot == "Dimona-CF" &
                 ha_data$tag_number == 90 &
                 ha_data$year == 2009] <- 1
  
  ha_data$ht[ha_data$plot == "Dimona-CF" &
               ha_data$tag_number == 90 &
               ha_data$year == 2009] <- 7
  
  # delete record in E9
  omit90<-ha_data %>% filter(plot=="Dimona-CF" & 
                                tag_number==90 &
                                row=="E" & 
                                column==9)
  
  ha_data<-anti_join(ha_data,omit90)
  
  rm(omit90)
  
  #correcting column that was entered incorrectly
  ha_data$column[ha_data$plot == "Dimona-CF" & ha_data$column == 11] <- 10


# 81 ----------------------------------------------------------------------
  # plant 81 was not dead in 06
  ha_data$code[ha_data$plot == "Dimona-CF" &
                 ha_data$tag_number == 81 &
                 ha_data$year == 2006] <- "missing"
  
  ha_data$code[ha_data$plot == "Dimona-CF" &
                 ha_data$tag_number == 81 &
                 ha_data$year == 2008] <- "missing"
  
  ha_data$code[ha_data$plot == "Dimona-CF" &
                 ha_data$tag_number == 81 &
                 ha_data$year == 2009] <- "missing"
  
  # location
  ha_data$row[ha_data$plot == "Dimona-CF" & ha_data$tag_number == 89] <- "E"
  ha_data$column[ha_data$plot == "Dimona-CF" & ha_data$tag_number == 167] <- 10
  ha_data$column[ha_data$plot == "Dimona-CF" & ha_data$tag_number == 192] <- 10
  
  
# 195 / 185 ----------------------------------------------------------------
  # 195 was recorded as 185 incorrectly in 2006.
  # Add its measurments in 2006 to 185
  ha_data$shts[ha_data$plot == "Dimona-CF" & ha_data$year == 2006 & ha_data$tag_number == 195] <- 2
  ha_data$ht[ha_data$plot == "Dimona-CF" & ha_data$year == 2006 & ha_data$tag_number == 195] <- 8
  ha_data$code[ha_data$plot == "Dimona-CF" & ha_data$year == 2006 & ha_data$tag_number == 195] <- "sdlg"
  
  # delete the incorrect one recorded as 195 in C10
  omit185<-ha_data %>% filter(plot=="Dimona-CF" & 
                                tag_number==185 &
                                row=="E" & 
                                column==8)
  
  ha_data<-anti_join(ha_data,omit185)
  
  rm(omit185)
  
  })  
  
  return(ha_data)
}
