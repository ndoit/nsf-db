# 
# Read NSF Data From Web
# Restructure for DB Load
#
# Jason P. Casey
# 22MAY2015
# First Revision
#

# Load Libraries
library(reshape2)     #For data transpositions
library(plyr)         #For aggregation and iterative changes to records
library(ggplot2)      #For quick plots and diagnostics

# URL's to public release files from NSF
data.specs <- data.frame(year=c(2013L,2012L,2011L,2010L),
                         url=c('http://www.nsf.gov/statistics/herd/data/exp2013.csv',
                               'http://www.nsf.gov/statistics/herd/data/exp2012.csv',
                               'http://www.nsf.gov/statistics/herd/data/exp2011.csv',
                               'http://www.nsf.gov/statistics/herd/data/exp2010.csv'))

# Read the data
# dat <- read.table(file=data.specs$url[1],
#                   header=TRUE,
#                   sep=",",
#                   quote="\"",
#                   skip=0,
#                   row.names=NULL,
#                   stringsAsFactors=FALSE,
#                   fileEncoding="utf-8")
