---
title: "'Shots' Usability Script"
description: "Script for making various shots CSV files usable"
inputs: "raw CSV files for various players"
outputs: "tibble or dataframe that is usable for analysis"
---

# Note: Codes are meant to be run from workout01 working directory
  
library(readr)
library(dplyr)

### Importing CSV files

iguodala <- read.csv("./data/andre-iguodala.csv",
                     stringsAsFactors = FALSE,
                     header = TRUE,
                     colClasses = c('character', 'character','integer','integer',
                                    'integer','integer','character','factor','factor',
                                    'integer','character','integer','integer'),
                     sep = ",")

green <- read.csv("./data/draymond-green.csv",
                     stringsAsFactors = FALSE,
                     header = TRUE,
                     colClasses = c('character', 'character','integer','integer',
                                    'integer','integer','character','factor','factor',
                                    'integer','character','integer','integer'),
                     sep = ",")

durant <- read.csv("./data/kevin-durant.csv",
                     stringsAsFactors = FALSE,
                     header = TRUE,
                     colClasses = c('character', 'character','integer','integer',
                                    'integer','integer','character','factor','factor',
                                    'integer','character','integer','integer'),
                     sep = ",")

thompson <- read.csv("./data/klay-thompson.csv",
                     stringsAsFactors = FALSE,
                     header = TRUE,
                     colClasses = c('character', 'character','integer','integer',
                                    'integer','integer','character','factor','factor',
                                    'integer','character','integer','integer'),
                     sep = ",")

curry <- read.csv("./data/stephen-curry.csv",
                     stringsAsFactors = FALSE,
                     header = TRUE,
                     colClasses = c('character', 'character','integer','integer',
                                    'integer','integer','character','factor','factor',
                                    'integer','character','integer','integer'),
                     sep = ",")


### Adding name column to each respective dataframe

iguodala <- mutate(iguodala, name = 'Andre Iguodala')

green <- mutate(green, name = 'Graymond Green')

durant <- mutate(durant, name = 'Kevin Durant')

thompson <- mutate(thompson, name = 'Klay Thompson')

curry <- mutate(curry, name = 'Stephen Curry')


# Reordering dataframe so name is first column; all other columns retain original order
iguodala <- iguodala[ , c(14,(1:13))]
green <- green[ , c(14,(1:13))]
durant <- durant[ ,c(14(1:13))]
thompson <- thompson[ ,c(14,(1:13))]
curry <- curry[ ,c(14,(1:13))]

# Change values of shot_made_flag to 'shot-no' or 'shot_yes'
iguodala[iguodala$shot_made_flag == 'n', 8] = 'shot_no'
iguodala[iguodala$shot_made_flag == 'y', 8] = 'shot_yes'

green[green$shot_made_flag == 'n', 8] = 'shot_no'
green[green$shot_made_flag == 'y', 8] = 'shot_yes'

durant[durant$shot_made_flag == 'n', 8] = 'shot_no'
durant[durant$shot_made_flag == 'y', 8] = 'shot_yes'

thompson[thompson$shot_made_flag == 'n',8] = 'shot_no'
thompson[thompson$shot_made_flag == 'y',8] = 'shot_yes'

curry[curry$shot_made_flag == 'n',8] = 'shot_no'
curry[curry$shot_made_flag == 'y',8] = 'shot_yes'

# Add column 'minute'
iguodala <- mutate(iguodala, minute = (period * 12) - minutes_remaining)
green <- mutate(green, minute = (period * 12) - minutes_remaining)
durant <- mutate(durant, minute = (period * 12) - minutes_remaining)
thompson <- mutate(thompson, minute = (period *12)- minutes_remaining)
curry <- mutate(curry, minute = (period *12)- minutes_remaining)

# Sink

sink(file = './output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = './output/graymond-green-summary.txt')
summary(green)
sink()

sink(file = './output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = './output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = './output/stephen-curry-summary.txt')
summary(curry)
sink()

# Data frame stacking

shots_data <- rbind(curry,durant,green,iguodala,thompson)

# Exporting/Writing .CSV

write.csv(
    x = shots_data,
    file = './data/shots-data.csv'
)

# Sink summary of shots-data.csv

sink(file = './output/shots-data-summary.txt')
summary(shots_data)
sink()


