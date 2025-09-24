# === CNN Fashion MNIST with 6 layers ===

# 1. Load Libraries
# Make sure you have installed these packages beforehand:
# install.packages("keras3")
# install.packages("tensorflow")
# install.packages("ggplot2")
# keras3::install_keras()

library(keras3)
library(tensorflow)
library(ggplot2)

# ---

# 2. Load Dataset
# Keras in R has built-in functions for the Fashion MNIST dataset.
fashion_mnist <- dataset_fashion_mnist()
x_train <- fashion_mnist$train$x
y_train <- fashion_mnist$train$y
x_test <- fashion_mnist$test$x
y_test <- fashion_mnist$test$y

# ---

# 3. Data Preprocessing
x_train <- x_train / 255
x_test <- x_test / 255

x_train <- array_reshape(x_train, c(dim(x_train)[1], 28, 28, 1))
x_test <- array_reshape(x_test, c(dim(x_test)[1], 28, 28, 1))

y_train <- to_categorical(y_train, 10)
y_test <- to_categorical(y_test, 10)

# ---

# 4. Build CNN Model (6 layers)
# Keras in R uses the pipe operator (%>%) from the magrittr package
model <- keras_model_sequential() %>%
  layer_conv_2d(filters = 32, kernel_size = c(3, 3), activation = 'relu', input_shape = c(28, 28, 1)) %>%
  layer_conv_2d(filters = 64, kernel_size = c(3, 3), activation = 'relu') %>%
  layer_max_pooling_2d(pool_size = c(2, 2)) %>%
  layer_flatten() %>%
  layer_dense(units = 128, activation = 'relu') %>%
  layer_dense(units = 10, activation = 'softmax')

# ---

# 5. Compile Model
model %>% compile(
  optimizer = "adam",
  loss = "categorical_crossentropy",
  metrics = c("accuracy")
)

# ---

# 6. Train Model
history <- model %>% fit(
  x_train, y_train,
  epochs = 5,
  batch_size = 64,
  validation_split = 0.2,
  verbose = 2
)

# ---

# 7. Evaluate Model
test_loss <- model %>% evaluate(x_test, y_test, verbose = 0)
cat(paste("✅ Test accuracy:", format(test_loss$accuracy, digits = 4), "\n"))

# ---

# 8. Prediction and Plot
# Class names for Fashion MNIST
class_names = c('T-shirt/top', 'Trouser', 'Pullover', 'Dress', 'Coat',
                'Sandal', 'Shirt', 'Sneaker', 'Bag', 'Ankle boot')

# Select 5 random samples from the test set
indices <- sample(1:nrow(x_test), 5)

# Predictions
preds <- model %>% predict(x_test[indices, , , , drop = FALSE])
predicted_classes <- apply(preds, 1, which.max) - 1 

# Plot 5 images in one row
par(mfrow = c(1, 5), mar = c(0, 0, 1.5, 0))
for (i in 1:length(indices)) {
  img <- x_test[indices[i], , , ]
  image(t(img), col = gray.colors(256), axes = FALSE, ylim = c(1, 0))
  title(paste("P:", class_names[predicted_classes[i] + 1], "\nT:", class_names[y_test[indices[i], ] %>% which.max]), cex.main = 1)
}