# read data tables and merge into one dataset
X_train <- read.table("train/X_train.txt")
X_test  <- read.table("test/X_test.txt")
X = rbind(X_train, X_test)

# add names to dataset (requirement 4)
# also make sure all column names are lowercase
features <- read.table("features.txt")
featurenames <- tolower(features[,2])
names(X) <- featurenames

# extract only measurements on the mean and std for each measurement (requirement 2)
# also take out the parentheses and hyphens in the column names
keep_vector = grep("mean[(]|std[(]", featurenames)
X_keep = X[,keep_vector]
featurenamesnobracket <- sub("[(][)]", "", names(X_keep))
featurenamesnohyphen1 <- sub("[-]", "", featurenamesnobracket)
featurenamesfinal <- sub("[-]", "", featurenamesnohyphen1)
names(X_keep) <- featurenamesfinal

# make activity vector, read descriptive activities, and transform to labels (requirements 3,4)
y_train <- read.table("train/y_train.txt")
y_test  <- read.table("test/y_test.txt")
y <- rbind(y_train, y_test)
descriptive.activities <- read.table("activity_labels.txt")
y_labels <- as.data.frame(tolower(descriptive.activities[y[,1],2]))
names(y_labels) <- c("Activity")

# read in subject vectors and combine into one
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
subjects <- rbind(subject_train, subject_test)
names(subjects) <- c("Subject")

# combine into one data frame
# this is the tidy data set (requirement 1)
dataset <- cbind.data.frame(subjects, y_labels, X_keep)

# create average of each variable by activity and subject (requirement 5)
library(dplyr)
dataset.mean <- dataset %>% group_by(Subject, Activity) %>% summarize_all(mean)
write.table(dataset.mean, file="datasetMean.txt", row.names = FALSE)
