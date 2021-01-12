#PSYC 259 Homework 1 - Data Import
#This assignment should be completed in RStudioCloud
#For full credit, provide answers for at least 4/8 questions

#List names of students collaborating with (no more than 2): 

#Load packages
library(tidyverse)
library(vroom)
library(visdat)
library(here)

#data_raw contains 12 files of data. 
#Each file (6192_3.txt) notes the participant (6192) and block number (3)
#The header contains metadata about the session
#The remaning rows contain 4 columns, one for each of 20 trials:
  #trial_number, speed_actual, speed_response, correct
#Speed actual was whether the figure on the screen was actually moving faster/slower
#Speed response was what the participant report
#Correct is whether their response matched the actual speed

### Question 1 ---------- 

#The code below reads in one of the raw data files, but there's a problem...
#Fix the code below so that all 20 trials are read in.

col_names = c("trial_num","speed_actual","speed_response","correct")
ds1 <- read_tsv("data_raw/6191_1.txt", skip = 10, col_names = col_names)

#ANSWER


### Question 2 ---------- 

#Write code below to read in block 2 for 6191, and store it to another dataframe

#ANSWER

### Question 3 ----------

#Use the visdat package to explore the data for 6191_1 and 6191_2. What's wrong?
#BONUS: We didn't cover this yet, but if you know how you can fix the problem

#ANSWER

### Question 4 ----------

#The PI wants the cleaned data to be stored in a directory for each participant
#with a single CSV file for each block named '1.csv', '2.csv', etc
#Write 6191_1 and 6191_2 to separate csv files in 'data_cleaned/6191/
#BONUS: Use the 'here' function to generate the filenames

#ANSWER

### Question 5 ----------
#Use list.files to get all of the data file names in data_raw

#ANSWER


### Question 6 ----------

#Use vroom to read in all 12 data files from data_raw into a tibble called 'ds'
#BONUS: read the vroom help (type ?vroom) and use the id parameter to retain the filename
#(otherwise how would you know which data were which?)
#(use your file_name output from 5, otherwise you will have to create a list of every file name!)

#ANSWER


### Question 7 ----------

#Wait, we forgot to read in the metadata for the files from the header
#Use a read_* function to read in the header into a tibble with 2 columns, "field" and "value"
#Read in the header for 6192_1 and 6192_2 to separate data frames
#Hint: The header uses a different format from the data, so take a close look at the data file

#ANSWER


### Question 8 --------

#Use the header information to add columns for participant, sex, age, order, first speed, and block
#to one (or both) of the blocks
#Rewrite the data to data_cleaned using your code from Question 4
#BONUS: Add those columns at the beginning of the tibble rather than the end

#ANSWER