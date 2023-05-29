##This script looops through the payment transaction files and
##parses the Bitcoin Block Chain data on output volume
##
##Estimated Transaction Volume
##Similar to the total output volume with the addition of an algorithm which attempts to remove change from the total value. 
##This may be a more accurate reflection of the true transaction volume.
##
##
## Author : Segun Bewaji
## Modified : Segun Bewaji
## Modifications Made 25 Sept 2015:
##        1) variable and input file name changes to match raw input data file
##        2) 
##        3)  
##        4)  
##        5) 
##        6)  
## Modified : 
## Modifications Made :
##        7) 
##        8) 
##           
##        9)  
##            
##           
##       10) 
##
## Creation Date : 25 Sept 2015
## 
## $Id$

##the usual
gc();
rm(list=ls());
gc();

require(lubridate);# handles that date elements of the data
require(dplyr);# contains method and function calls to be used to filter and select subsets of the data
require(data.table);#used to store and manipiulate data in the form of a data table similar to a mySQL database table
require(xts);#used to manipulate date-time data into quarters
require(ggplot2);#used to plot data
require(magrittr);#contains method/function calls to use for chaining e.g. %>%
require(scales);#component of ggplot2 that requires to be manually loaded to handle the scaling of various axies
require(foreach);#handles computations for each element of a vector/data frame/array/etc required the use of %do% or %dopar% operators in base R
require(iterators);#handles iteration through for each element of a vector/data frame/array/etc


##initial variable declarations 
##
SOURCE.dir <- "C:/Projects/RawData/Bitcoin";
working.dir <- "C:/Projects/BitcoinDataTable";

btcEstimatedTransactionVolumeNameString <- c("C:/Projects/BitcoinDataTable/btcEstimatedTransactionVolumeDataSeries.Rdata");

full.file.names <- NULL;
save.file.names <- NULL;
btcEstimatedTransactionVolume <- NULL; #declare the merged data series object as a NULL to assigned as data.table later on in the code
tempbtcEstimatedTransactionVolumeTablesList <- NULL; #declare the merged data table list object as a NULL for use with the rbindlist(a,b) call 
#to append datatables

##Determine current and set required the working directories
cur.dir <- getwd();
setwd(SOURCE.dir);


##this substrRight(inputList, numberOfChars) function/method takes an input string/character list or vector and returns the last
##numberOfChars (i.e. n) characters in each of the elements of the string/character list or vector
##it will be used to select the approriate dierectories from which to collate the data being utilised
substrRight <- function(inputList, numberOfChars){
  substr(inputList, nchar(inputList)-numberOfChars+1, nchar(inputList));
}


##loop through the list of directories from which to collate data and create a list of folder paths
for (i in SOURCE.dir){
  setwd(i);
  tmp <- list.files(pattern="estimated-transaction-volume.txt");
  digitTMP <- substrRight((gsub("[^0-9]","",tmp)), 2); ##Returns [1] "0801" "0802" "0803" "0804" "0805" "0806" "0807" "0808" "0809" "0810" "0811" "0812"
  digitTMP <- as.numeric(digitTMP);
  save.tmp <- sapply(tmp,function(x){paste(strsplit(x,"\\.")[[1]][1],"Rdata",sep=".")},USE.NAMES=FALSE);
  if (length(tmp) != 0){
    ##build the full path
    full.path <- paste(i,tmp,sep="/");
    save.path <- paste(working.dir,save.tmp,sep="/");
    rm(tmp);
    full.file.names <- c(full.file.names,full.path);
    save.file.names <- c(save.file.names,save.path);
  }
  setwd(SOURCE.dir)
}

##this function reads in a raw text file and outputs the clean dataset
source.file.process <- function(x){
  raw.data <- read.csv(x,stringsAsFactors=F,header=F);
  raw.data <- tbl_df(raw.data);
  clean.data <- select(raw.data,V1,V2);
  colnames(clean.data) <- c("date.time","EstimatedTransactionVolume");
  #clean.data$date.time <- ymd_hms(paste(clean.data$date,clean.data$time,sep=" "),tz="America/New_York");
  #clean.data$date <- ymd(paste(year(clean.data$date.time),month(clean.data$date.time),days_in_month(clean.data$date.time)),tz="America/New_York");
  clean.data$Year_Month <- ymd(paste(year(clean.data$date.time),month(clean.data$date.time),1),tz="America/New_York");
  clean.data$Year_Quarter <- as.yearqtr(clean.data$Year_Month);#add a field to set the date-time in form of quarters
  clean.data$Year_Quarter <- format(clean.data$Year_Quarter, "%Y Q %q");#set the format for reporting of the quaters field
  clean.data <- as.data.table(clean.data);
  return(clean.data);
  
}

##This method carries out a deep copy of the passed data table
dataTableCopy <- function(inputeDataTable){
  outputDataTable <- copy(inputeDataTable);
  return(outputDataTable);
}

gc(); #free up memory
##now loop over the files and save them
for (i in 1:length(full.file.names)){
  
  #check if the btcVolume datatable has been created/initialised as a datatable. If not deep copy the created 
  #lvts.trans datatable into btcVolume to instantiate it. Else append the new lvts.trans datatable to the end of the 
  #btcVolume datatable. 
  if(is.null(btcEstimatedTransactionVolume)){
    btcEstimatedTransactionVolume  <- source.file.process(full.file.names[i]);
  } else{
    tempbtcVolumeTablesList <- list(btcEstimatedTransactionVolume,source.file.process(full.file.names[i]));
    btcEstimatedTransactionVolume  <- rbindlist(tempbtcEstimatedTransactionVolumeTablesList);
  }
  
  #check if all lvts.trans files have been created and the save.file.names list has been completely looped through
  #if so save the mergedLVTSTrans datatable
  if(i == length(save.file.names)){
    save(btcEstimatedTransactionVolume,file=btcEstimatedTransactionVolumeNameString);
  }
  gc();
}

##return to the original directory
gc();
setwd(cur.dir);