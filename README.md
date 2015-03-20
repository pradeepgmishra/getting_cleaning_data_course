#Course Project for Getting &amp; Cleaning Data

run_analysis.R reads all the files from the folder uci_har_dataset

First it finds out all the column names containing mean and std uysing grepl method

Then it reads all the files one by one from both test and train folder

Then it combines the corresponding files from test and train into new files subject.txt, X.txt and y.txt

It also creates a new data frame based on the mean and std columns for all the subjects

This dataframe is combined with the subject dataframe using cbind to create a new dataframe (newData)

Then aggregate function is run on newData for all columns based on the column Subject

The output of above dataframe is written into a file tidy.txt


