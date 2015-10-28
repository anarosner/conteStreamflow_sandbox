
weather_new_england <- weather_retrieve( gages_no_barr[1:10,], periods=c("month","wateryear") )

View(weather_new_england[["month"]])
View(weather_new_england[["wateryear"]])
# weather_new_england <- weather_records
# save( weather_new_england, file="weather_d_month_wyear_10_14.rdata")
