# Module 6 Assignment: Fashion MNIST Classification

### Project Description

This project is part of a machine learning assignment that focuses on **image classification** using a **Convolutional Neural Network (CNN)**. The main goal is to develop a model that can identify and classify images from the **Fashion MNIST** dataset.

This task was completed in two main programming languages often used in data science: **Python** and **R**.

### Tasks Completed

This project includes three main tasks according to the provided instructions:

1.  **CNN Development**:
    * Building a **Convolutional Neural Network (CNN)** model with 6 layers.
    * The model is trained to classify images from the **Fashion MNIST** dataset.

2.  **Prediction**:
    * Making predictions on several sample images from the test dataset to verify the model's performance.

### Files Included

This project consists of two main files containing the equivalent source code:

* `Module 6 Assignment.ipynb`: Python code developed in a Jupyter Notebook environment.
* `Module 6 Assignment.R`: The equivalent R code, designed to be run in RStudio.

### Technical Requirements

To run this code, make sure you have the following software and libraries installed on your system.

#### For Python Code (`.ipynb`)
* **Python 3.9 - 3.11**
* **Jupyter Notebook** (or JupyterLab)
* **TensorFlow/Keras**
* **NumPy**
* **Matplotlib**

#### For R Code (`.R`)
* **R**
* **RStudio** (recommended)
* **Keras3**
* **TensorFlow**
* **ggplot2**
* **reticulate** (to connect R with Python)

### How to Run the Code

#### Using Python

1.  Open a terminal or command prompt, then navigate to the directory where the file is saved.
2.  Run Jupyter Notebook with the command:
    ```
    jupyter notebook
    ```
3.  Jupyter will open in your browser. Click on the `Module 6 Assignment.ipynb` file and run each cell from top to bottom.

#### Using R

1.  Make sure you have R and RStudio installed.
2.  Install the `keras3` and `tensorflow` packages in R by running this command in the R console:
    ```R
    install.packages("keras3")
    keras3::install_keras()
    ```
3.  Open the `Module 6 Assignment.R` file in RStudio.
4.  In RStudio, click the **"Source"** button (usually in the top-right corner of the script editor) to run the entire code from the start.

### Expected Output

After the code is run, you will see a series of outputs:

* **Training Process**: Information about the *epochs*, *loss*, and accuracy during model training.
* **Test Accuracy**: The final accuracy result of the model on the test data.
* **Prediction Plot**: A plot window that displays 5 random images from the test data along with the predicted label (P:) and the original label (T:).
