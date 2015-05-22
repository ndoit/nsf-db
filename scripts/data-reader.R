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
specs <- c('http://www.nsf.gov/statistics/herd/data/exp2013.csv',
           'http://www.nsf.gov/statistics/herd/data/exp2012.csv',
           'http://www.nsf.gov/statistics/herd/data/exp2011.csv',
           'http://www.nsf.gov/statistics/herd/data/exp2010.csv')

