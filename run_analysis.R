# 1.1 Imnport test data
X_test <- read.table("X_test.txt", sep = "", header = F)
y_test <- read.table("y_test.txt", sep = "", header = F)
subject_test <- read.table("subject_test.txt", sep = "", header = F)

# 1.2 Import train data
X_train <- read.table("X_train.txt", sep = "", header = F)
y_train <- read.table("y_train.txt", sep = "", header = F)
subject_train <- read.table("subject_train.txt", sep = "", header = F)

# 1.3 Import features and activity labels
features <- read.table("features.txt", col.names = c("ID", "Name"))
activity_labels <- read.table("activity_labels.txt", col.names = c("IdActivity", "Activity"))

# 1.4 Add colnames
colnames(X_test) <- features$Name
colnames(y_test) <- "IdActivity"
colnames(subject_test) <- "IdSubject"

colnames(X_train) <- features$Name
colnames(y_train) <- "IdActivity"
colnames(subject_train) <- "IdSubject"

# 1.5 Merge data
test.data <-  cbind(subject_test, y_test, X_test)
train.data <- cbind(subject_train, y_train, X_train)

all.data <-  rbind(test.data, train.data)

# 2. Extract only mean and std of each measurement
all.data_m_std <-  all.data[, grepl("mean|std|IdSubject|IdActivity",colnames(all.data))]

# 3. Use descriptive activity names to name the activities in the data set
install.packages("plyr")
library(plyr)

all.data_m_std <-  join(all.data_m_std, activity_labels, by = "IdActivity", match = "first")

all.data_m_std <- all.data_m_std[,-1] # delete first column
all.data_m_std <- all.data_m_std[, c(81, 1:80)] # change coloumn order: last order first


# 4. Label the data set with descriptive variable names. 
names(all.data_m_std) <- gsub("Acc", "Accelerometer",names(all.data_m_std))
names(all.data_m_std) <- gsub("Gyro", "Gyroscope",names(all.data_m_std))
names(all.data_m_std) <- gsub("Mag", "Magnitude",names(all.data_m_std))
names(all.data_m_std) <- gsub("Freq", "Frequency",names(all.data_m_std))
names(all.data_m_std) <- gsub("angle", "Angle",names(all.data_m_std))
names(all.data_m_std) <- gsub("gravity", "Gravity",names(all.data_m_std))
names(all.data_m_std) <- gsub("^t", "Time",names(all.data_m_std))
names(all.data_m_std) <- gsub("^f", "Frequency",names(all.data_m_std))

names <- names(all.data_m_std)

# 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
all.data_m_std_tidy <-  aggregate(all.data_m_std[,3:81], by = list(all.data_m_std$Activity, all.data_m_std$IdSubject), mean) # get the means by the two groups

colnames(all.data_m_std_tidy)[1:2] <- c("Activity","IdSubject") # change first two column names

# final step: create text file of output 5
write.table(all.data_m_std_tidy,"./tidy_dataset.txt", row.names = F)
