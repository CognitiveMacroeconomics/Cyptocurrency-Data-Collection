##A chart of the number of unique bitcoin addresses used per day.
numberOfUniqueAddressesUsedURL <- 
  c("https://blockchain.info/charts/n-unique-addresses?showDataPoints=false&timespan=all&show_header=true&daysAverageString=1&scale=0&format=csv&address=");

##Number of blocks mined per day not part of the main chain.
numberOfOrphanedBlocksURL <- 
  c("https://blockchain.info/charts/n-orphaned-blocks?showDataPoints=false&timespan=all&show_header=true&daysAverageString=1&scale=0&format=csv&address=");


##The total value of all transaction outputs per day. This includes coins that were returned to the sender as change.
totalOutputVolumeURL <- 
  c("https://blockchain.info/charts/output-volume?showDataPoints=false&timespan=all&show_header=true&daysAverageString=1&scale=0&format=csv&address=");

##A graph showing the historical total number of bitcoins which have been mined.
totalBitcoinsInCirculationURL <- 
  c("https://blockchain.info/charts/total-bitcoins?showDataPoints=false&timespan=all&show_header=true&daysAverageString=1&scale=0&format=csv&address=");

##A graph showing the total number of bitcoins in circulation * the market price in USD.
marketCapitalizationURL <- 
  c("https://blockchain.info/charts/market-cap?showDataPoints=false&timespan=all&show_header=true&daysAverageString=1&scale=0&format=csv&address=");

##A chart showing the total BTC value of transaction fees miners earn per day.
totalTransactionFeesURL <- 
  c("https://blockchain.info/charts/transaction-fees?showDataPoints=false&timespan=all&show_header=true&daysAverageString=1&scale=0&format=csv&address=");

##A chart showing the total USD value of transaction fees miners earn per day.
totalUSDTransactionFeesURL <- 
  c("https://blockchain.info/charts/transaction-fees-usd?showDataPoints=false&timespan=all&show_header=true&daysAverageString=1&scale=0&format=csv&address=");

##Shows difference between transaction fees and cost of bitcoin mining.
totalNetworkDeficitPerDayURL <- 
  c("https://blockchain.info/charts/network-deficit?showDataPoints=false&timespan=all&show_header=true&daysAverageString=1&scale=0&format=csv&address=");


##Shows difference between transaction fees and cost of bitcoin mining.
totalNetworkDeficitPerDayURL <- 
  c("https://blockchain.info/charts/network-deficit?showDataPoints=false&timespan=all&show_header=true&daysAverageString=1&scale=0&format=csv&address=");


##A chart of the total number of unique bitcoin transactions per day.
totalNumberOfDailyTransactionsURL <- 
  c("https://blockchain.info/charts/n-transactions?showDataPoints=false&timespan=all&show_header=true&daysAverageString=1&scale=0&format=csv&address=");


##A chart of the total number of unique bitcoin transactions.
totalNumberOfTransactionsURL <- 
  c("https://blockchain.info/charts/n-transactions-total?showDataPoints=false&timespan=all&show_header=true&daysAverageString=1&scale=0&format=csv&address=");


##A chart showing the total number of unique bitcoin transactions per day excluding those which involve any of the top 100 most popular addresses
##popular addresses tend to be online gaming, betting & casino, bitcoin trading, cloud minning sites with over 61,000 outputs 
## these include sites such as satoshibones, satoshibet, betcoin, and Eobot 
totalNumberOfDailyTransactionsExcludingPopularAddressesURL <- 
 c("https://blockchain.info/charts/n-transactions-excluding-popular?showDataPoints=false&timespan=
   all&show_header=true&daysAverageString=1&scale=0&format=csv&address=");


##A chart showing the total number of bitcoin transactions per day excluding those part of long chain transaction chains. 
##There are many legitimate reasons to create long transaction chains however they may also be caused by coin mixing or possible 
##attempts to manipulate transaction volume. 
totalNumberofTransactionsexcludingLongChainsURL <- 
  c("https://blockchain.info/charts/n-transactions-excluding-chains-longer-than-100?showDataPoints=false&timespan=
    all&show_header=true&daysAverageString=1&scale=0&format=csv&address=");


##A chart of the average number of transactions per block.
averageNumberOfTransactionsPerBlockURL <- 
  c("https://blockchain.info/charts/n-transactions-per-block?showDataPoints=false&timespan=all&show_header=true&daysAverageString=1&scale=0&format=csv&address=");


