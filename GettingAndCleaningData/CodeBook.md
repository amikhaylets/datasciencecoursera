GettingAndCleaningData 
Project CodeBook
=================================================
Description of the variables, the data, and transformations that have been performed to clean the data.  
The run_analysis.R detailed work flow:   
 1. Store data in trainData, trainLabel and trainSubject variables from x_train.txt, y_train.txt and subject_train.txt.       
 2. Store data in testData, testLabel and testsubject variablesx_test.txt, y_test.txt and subject_test.txt.  
 3. Join testData to trainData to generate the data frame joinData, join testLabel to trainLabel to generate the data frame joinLabel and join testSubject to trainSubject to generate the data frame joinSubject.  
 4. Store data in features from the features.txt. Extract the measurements on the mean and standard deviation.
 5. Clean the column names of the subset. Remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S".   
 6. Read the activity_labels.txt file from the "./data"" folder and store the data in a variable called *activity*.  
 7. Clean the activity names in the second column of "activity". Make all names to lower cases. If the name has an underscore between letters. Remove the underscore and capitalize the letter right after the underscore.  
 8. Transform the values of "joinLabel" according to the "activity" data frame.  
 9. Join the joinSubject, joinLabel and joinData to get cleaned data frame, cleanedData. 
 10. Write the cleanedData out to "merged_data.txt" file.  
 11. Generate the tidy data set with the average of each measurement for each activity and each subject. 
 12. Write the "result" out to "data_with_means.txt" file. 
