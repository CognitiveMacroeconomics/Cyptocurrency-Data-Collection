require(formatR);
require(yaml);
require(googleVis);
require(knitr);
require(quantmod);


op <- options(gvis.plot.tag="chart");


top_cc <- get_marketcap_ticker_all();
kable(head(top_cc));


mapply(class,top_cc);


for(i in c(4:ncol(top_cc))) {
  top_cc[,i] <- as.double(top_cc[,i])
};



mark <- gvisColumnChart(top_cc[1:15, ], "name", "market_cap_usd", 
                        options = list(title = "Market Cap Of Leading Cryptocurrencies", 
                                                                                 legend = "left"));
plot(mark)



var <- gvisColumnChart(top_cc[1:15, ], "name", c("percent_change_1h", "percent_change_24h", 
                                                 "percent_change_7d"), 
                       options = list(title = "% change of prices", legend = "top"));
plot(var);


vol <- gvisColumnChart(top_cc[1:15, ], "name", c("X24h_volume_usd"), options = list(title = "Volume", 
                                                                                    legend = "top"));
plot(vol);




coins <- unique(data1$name)
s_date = Sys.Date() - 1
data1$market_growth <- NA
for (i in coins) {
  data1[data1$name == i, ]$market_growth = Delt(data1[data1$name == i, ]$market, 
                                                type = "arithmetic", k = 90)
}
c_data = data1[complete.cases(data1), ]  #complete.cases is used to get rwcords without NA
mg_3 = gvisColumnChart(c_data[c_data$date == s_date, ], "name", "market_growth", 
                       options = list(title = "Market Growth in the last 3 months", scaleType = "allfixed", 
                                      legend = "top"))
plot(mg_3)
