library(dplyr)

loadData <- function() {
  read.table('data.txt',sep=';', header=TRUE) %>%
    mutate(Date = as.Date(Date, '%d/%m/%Y')) %>%
    mutate(Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))) %>%
    filter(Time >= strptime('2007-02-01 00:00:00'), Time < strptime('2007-02-02 00:00:00')) %>%
    tbl_df
}
