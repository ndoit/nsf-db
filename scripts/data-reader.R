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
data.specs <- list(year=c(2013L,2012L,2011L,2010L),
                         url=c('http://www.nsf.gov/statistics/herd/data/exp2013.csv',
                               'http://www.nsf.gov/statistics/herd/data/exp2012.csv',
                               'http://www.nsf.gov/statistics/herd/data/exp2011.csv',
                               'http://www.nsf.gov/statistics/herd/data/exp2010.csv'))

output.specs <- "output-data/NsfRdData.csv"

# Create empty data frame to hold aggregate datafile
nsf.data <- data.frame()

# Loop through the specs and pick up each file
for (i in 1:length(data.specs$year))
{
  # Read the datafile
  raw.data <- read.table(file=data.specs$url[[i]],
                   header=TRUE,
                   sep=",",
                   quote="\"",
                   colClasses = c('integer',
                                  'integer',
                                  'character',
                                  'character',
                                  'character',
                                  'integer',
                                  'integer',
                                  'integer',
                                  'character',
                                  'character',
                                  'character',
                                  'character',
                                  'integer',
                                  'integer',
                                  'integer',
                                  'character',
                                  'integer',
                                  'character',
                                  'integer',
                                  'character',
                                  'integer',
                                  'character',
                                  'integer',
                                  'character',
                                  'integer',
                                  'character',
                                  'integer',
                                  'character',
                                  'integer',
                                  'character',
                                  'integer',
                                  'character',
                                  'integer',
                                  'character',
                                  'character',
                                  'character',
                                  'character'),
                   skip=0,
                   row.names=NULL,
                   stringsAsFactors=FALSE,
                   fileEncoding="utf-8")
  
  # Add the year to the dataset
  raw.data$year <- data.specs$year[[i]]
  
  # Do restructuring here
  
  # Bind the data to the data frame
  nsf.data <- rbind.fill(nsf.data,raw.data)
  
  # Housekeeping
  rm(raw.data)
}

# Housekeeping
rm(i)
rm(data.specs)

# Write the full datafile
write.table(nsf.data,
            file=output.specs,
            append=FALSE,
            quote=TRUE,
            sep=",",
            row.names=FALSE,
            col.names=TRUE,
            na = "")               # Set the missing values to blanks

# Housekeeping
rm(nsf.data)
rm(output.specs)
