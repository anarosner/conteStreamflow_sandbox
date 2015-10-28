library(waterData)
# flow_new_england <- flow_retrieve( gages_no_barr, periods=c("day","month","wateryear") )
# save( flow_new_england, file="flow_d_month_wyear_10_14.rdata")

#version with date of max flow
flow_new_england <- flow_retrieve( gages_no_barr, periods=c("day","month","wateryear") )
save( flow_new_england, file="flow_d_month_wyear_10_22.rdata")
# flow_new_england[["month"]] <- flow_new_england[["month"]] %>% 
#      rename( flow_max_date=max_flow_date )
# flow_new_england[["wateryear"]] <- flow_new_england[["wateryear"]] %>% 
#      rename( flow_max_date=max_flow_date )


View( attr(flow_new_england,"n_records") %>% 
     filter( period=="month") )
ggplot( attr(flow_new_england,"n_records"), 
        aes( x=da_nwis_sqkm, y=n_period_records, col=period ) ) +
     geom_point() +
     facet_wrap( ~period ) +
     theme_bw()

attr(flow_new_england,"error_gages")

attr(flow_new_england,"download_info")[1:3]


head(flow_new_england[["day"]],20)

head(flow_new_england[["month"]],20)
tail(flow_new_england[["month"]],10)

head(flow_new_england[["wateryear"]],20)
tail(flow_new_england[["wateryear"]],10)



# boo <- attr(flow_new_england,"n_records") %>% 
#      filter( period=="wateryear") %>% 
#      select( site_no )
# boo2 <- gages_no_barr@data %>% 
#      filter( !(site_no %in% boo$site_no) ) %>% 
#      select( site_no )
# boo3 <- attr(flow_new_england,"n_records") %>%  
#      filter(!(site_no %in% boo$site_no) )
# 
# boo4 <- attr(flow_new_england,"n_records") %>% 
#      mutate( n_period_records=as.numeric(n_period_records) ) %>% 
#      filter( period != "0" )
# 
# ggplot( boo4, aes( x=da_nwis_sqkm, y=n_period_records, col=period ) ) +
#      geom_point() +
#      facet_wrap( ~period, scales="free_y" ) +
#      theme_bw()
# 
# 
# 
# which(!(gages_no_barr$site_no %in% boo$site_no))
# which(!(gages_no_barr$site_no %in% boo$site_no))
# 
# 
# 
# 
# 
# boo <- flow_retrieve( gages_no_barr[1:5,], periods=c("day","month","wateryear") )
# 
# str(boo[[1]])
# str(boo[[2]])
# str(boo[[3]])
# 
# View( attr(boo,"n_records") )
# str( attr(boo,"n_records") )
# 
# attr(boo,"n_records") %>% 
#      filter( period=="month")
# ggplot( attr(boo,"n_records"), aes( x=da_nwis_sqkm, y=n_period_records, col=period ) ) +
#      geom_point() +
#      facet_wrap( ~period ) +
#      theme_bw()
#      
# 
# attr(boo,"download_info")[1:3]
# attr(boo,"error_gages")
# 
# head(boo[["day"]],20)
# 
# head(boo[["month"]],20)
# tail(boo[["month"]],20)
# 
# head(boo[["wateryear"]],20)
# tail(boo[["wateryear"]],20)
# # 
# # 
# # tail(boo[[1]],20)
# # attributes(boo)
# # attr(boo,"n_records")["01047200"]
# # attr(boo,"download_info")["01049218"]
# # 
# 

