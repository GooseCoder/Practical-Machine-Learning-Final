# This script tests the model using the provided test data to measure the model accuracy
# You need to take into account that is required to change the working directory to the script
# directory in order to generate the prediction solutions.
# Load model and test data (model and test_data)
load(file = "Model.rda", verbose=TRUE)
load(file = "TestData.rda", verbose=TRUE)

# Function to write predictions to separate files
write_solution_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("predictions_test_data/test_data_id_",i,".txt")
    write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}

# The prediction is generated using the model and using the test data to predict the results.
library(randomForest)
library(caret)
answers <- predict(model, test_data)

# write answers to the files
write_solution_files(answers)

