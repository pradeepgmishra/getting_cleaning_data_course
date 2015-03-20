run_analysis <- function() {
  
  #Read files  
  
  #Read features
  features2col <- read.csv("uci_har_dataset/features.txt",header=F,sep=" ")    
  features <- features2col[,2] ;
  
  #Find mean related columns
  meanCols <- features[grepl("mean", features)];
  
  #Find mean related columns
  stdCols <- features[grepl("std", features)] ;
  
  #All required columns
  requiredCols <- c(meanCols,stdCols)
  
  #Read test data
  testX <- read.csv("uci_har_dataset/test/X_test.txt",header=F,sep="")  
  test_y <- read.csv("uci_har_dataset/test/y_test.txt",header=F,sep="")   
  testSubject <- read.csv("uci_har_dataset/test/subject_test.txt",header=F,sep="")   
  
  #Assign names to feature columns
  names(testX)  <- features
  
  #Read train data
  trainX <- read.csv("uci_har_dataset/train/X_train.txt",header=F,sep="")  
  train_y <- read.csv("uci_har_dataset/train/y_train.txt",header=F,sep="")   
  trainSubject <- read.csv("uci_har_dataset/train/subject_train.txt",header=F,sep="")   
  
  #Assign names to feature columns
  names(trainX)  <- features
  
  #Create new data sets
  newX <- rbind(testX,trainX);
  new_y <- rbind(test_y,train_y);
  newSubject <- rbind(testSubject,trainSubject);
  
  #Assign names to new feature data set
  names(newX)  <- features
  newX <- newX[requiredCols]
  
  newData <- cbind(newX, newSubject)
  namesNew <- names(newData)
  namesNew[length(namesNew)] <- "Subject"
  names(newData) <- namesNew
    
  
  #Aggregate all the data by subjects
  aggr <- aggregate(. ~ Subject, data=newData, FUN=mean)
  
  #Write the tidy data set in file
  write.table(aggr,file="tidy.txt",row.names=F)
  
  #Persist all data in files
  write.table(newSubject,file="subject.txt",row.names=F)
  write.table(new_y,file="y.txt",row.names=F)
  write.table(newX,file="X.txt",row.names=F)
      
}