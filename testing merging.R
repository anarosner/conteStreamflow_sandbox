# get just month records
q_month <- flow_new_england[["month"]] 
dim(q_month)
w_month <- weather_new_england[["month"]] 

#merge
d_month <- q_month %>% 
               left_join(w_month, by=c( "month_date","weather_filename","weather_region","weather_set" ) )
#check dimensions and missing values
dim(d_month)
sum(is.na(d_month$precip_raw_total))

#remove flow data outside range of livneh 1950-2013 data set
d_month <- d_month %>% 
     filter( year(month_date) <= 2013 ) %>% 
     filter( year(month_date) >= 1950 ) 
#check dimensions and missing values
dim(d_month)
sum(is.na(d_month$precip_e_total))
d_month <- d_month %>% 
     filter( !is.na(precip_e_total) )
     #note: values missing precip are first two monthsof livneh time period, and 
     #    have been removed because lag2 values aren't available
     #View( d_month %>% filter( is.na( precip_raw_total ) ) )
dim(d_month)

tail(d_month)
head(d_month)

#merge w/ gages
#check all flow records have matching gage basin info, and they do...
dim( d_month %>% 
          inner_join( gages_no_barr@data, by=c("site_no", "weather_filename", "weather_region", "weather_set") ) )
#merge
d_month <- d_month %>% 
     left_join( gages_no_barr@data, by=c("site_no", "weather_filename", "weather_region", "weather_set") )
dim(d_month)

#check drainage area estimates
plot(gages_no_barr@data$da_nwis_sqkm, gages_no_barr@data$AreaSqKM)
plot(gages_no_barr@data$da_nwis_sqkm,gages_no_barr@data$da_nwis_sqkm-gages_no_barr@data$AreaSqKM)
sum(abs(gages_no_barr@data$da_nwis_sqkm-gages_no_barr@data$AreaSqKM)>10)
dim( d_month %>% 
     filter( abs(da_nwis_sqkm-AreaSqKM)<10 ) )
#we'll leave these in for now

d_month <- d_month %>% 
     filter( flow_mean>0 )

d_month <- d_month %>% 
     mutate( da_model_sqmi = da_nwis_sqkm ) %>% 
     mutate( month = month(month_date) ) %>% 
     mutate( year = year(month_date) )

View(d_month)




# View( d_month %>% 
#      filter(is.na(precip_e_total)) )
# View( d_month %>% 
#      filter( !(weather_filename %in% unique(w_month$weather_filename) ) ) )
# foo <- q_month %>% 
#      filter( !(weather_filename %in% unique(w_month$weather_filename) ) )
# View(foo)
# unique(foo$site_no)
# foo <- foo[,"month_date"]
# head(foo)
# str(foo)
# foo2 <- year(foo)
# 
# library(lubridate)
# hist( foo2 )
# 
# names(weather_records[["month"]])
# summary(weather_records[["month"]]$n_days_lag2)
# 
# 
