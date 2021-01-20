#PSYC 259 Homework 1 - Data Import
#This assignment should be completed in RStudioCloud
#For full credit, provide answers for at least 4/8 questions

#List names of students collaborating with: 

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
ds1 <- read_tsv("data_raw/6191_1.txt", skip = 7, col_names = col_names)

### Question 2 ---------- 

#Write code below to read in block 2 for 6191, and store it to another dataframe

#ANSWER
ds2 <- read_tsv("data_raw/6191_2.txt", skip = 7, col_names = col_names)

### Question 3 ----------

#Use the visdat package to explore the data for 6191_1 and 6191_2. What's wrong?
#BONUS: We didn't cover this yet, but if you know how you can fix the problem

#ANSWER
vis_miss(ds1)
vis_miss(ds2) #'Correct' is missing for the last trial
ds2 <- ds %>% mutate(correct = speed_actual == substring(speed_response,1,3))

### Question 4 ----------

#The PI wants the cleaned data to be stored in a directory for each participant
#with a single CSV file for each block named '1.csv', '2.csv', etc
#Write 6191_1 and 6191_2 to separate csv files in 'data_cleaned/6191/
#BONUS: Use the 'here' function to generate the filenames

#ANSWER
write_csv(ds1, here("data_cleaned","6191","1.csv"))
write_csv(ds2, here("data_cleaned","6191","2.csv"))

### Question 5 ----------
#Use list.files to get all of the data file names in data_raw

file_names <- list.files("data_raw", full.names = T)

### Question 6 ----------

#Use vroom to read in all 12 data files from data_raw into a tibble called 'ds'
#BONUS: read the vroom help (type ?vroom) and use the id parameter to retain the filename
#(otherwise how would you know which data were which?)
#(use your file_name output from 5, otherwise you will have to create a list of every file name!)

#ANSWER
ds <- vroom(file_names, id = "file", skip = 7, col_names = col_names)

### Question 7 ----------

#Wait, we forgot to read in the metadata for the files from the header
#Use a read_* function to read in the header into a tibble with 2 columns, "field" and "value"
#Read in the header for 6192_1 and 6192_2 to separate data frames
#Hint: The header uses a different format from the data, so take a close look at the data file

#ANSWER

header1 <- read_delim("data_raw/6191_1.txt", delim = " ", n_max = 7, col_names = c("field","value"))
header2 <- read_delim("data_raw/6191_2.txt", delim = " ", n_max = 7, col_names = c("field","value"))

### Question 8 --------

#Use the header information to add columns for participant, sex, age, order, first speed, and block
#to one (or both) of the blocks
#Rewrite the data to data_cleaned using your code from Question 4
#BONUS: Add those columns at the beginning of the tibble rather than the end

participant <- header1 %>% filter(field == "Participant") %>% pull(value)
sex <- header1 %>% filter(field == "Sex") %>% pull(value)
age <- header1 %>% filter(field == "Age") %>% pull(value)
order <- header1 %>% filter(field == "Order") %>% pull(value)
first_speed <- header1 %>% filter(field == "FirstSpeed") %>% pull(value)
block <- header1 %>% filter(field == "Block") %>% pull(value)

ds1 <- ds1 %>% 
  add_column(participant = participant,
             sex = sex,
             age = age,
             order = order,
             first_speed = first_speed,
             block = block,
             .before = "trial_num")

write_csv(ds1, here("data_cleaned","6191","1.csv"))
