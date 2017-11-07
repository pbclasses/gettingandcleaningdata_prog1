## Files
This repository contains the following files:
   README.md:       this file
   run_analysis.R:  an R script that will load datafiles from the 
                    UCI HAR Dataset and produce a tidy dataset consisting
                    of the average means and standard deviations of various
                    measurements grouped by subject id and activity

## Running
When running the R script, the working directory should have both the
train and test directories. To run the script, type:
   source("run_analysis.R")

## Dataset
The script will create a tidy dataset file called "datasetMean.txt" which
has columns described in the codebook.
