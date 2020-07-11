# Predict_Word_NLP
In this project Natural language processing(NLP) techniques used to perform the analysis and build the predictive model.
Lightweight and Easy to use shiny app [Word Predictor](https://amudhanarayanan.shinyapps.io/word-predict/)

## Overview
**Goal** - To build smart shiny app to predict next word/phrase for mobile device using optimized prediction engine.

## Tools/Lib Used

 - IDE - RStudio 
 - Language - R, shell scripts ,jquery
 - Libraries - Rweka,tm,strini,Revobase,stylo,data.table
 - Web - Shiny Dashboard
 
## Data

 - Data from [HC Corpora](http://www.corpora.heliohost.org/)

## Architecture 
The System Architecture of Word Predictor app have the following main components:

1. Datasets - The dataset contains text files of news,blog entires ,twitter in English from HC Corpora.

2. Text Processing Engine - Deals with text cleaning(removing ASCII,whitespace,numbers),text pre-processing (convert to lower case), profanity filtering and corpus creation.

3. Model Builder - Uses n-gram tokenizers for n(2,3,4) to build n-grams and store them as data frames.For more details on dataset ,Text Processing and Model buider of n-gram tokenizer refer to Report.

4. Prediction Engine - Uses data frames of Model buider and a Backoff Model with probability estimators to predict the top next words list .For more details refer to section Algorithms.

5. Shiny App - Invoke Prediction Engine with Input Text and display the list of top predicted words/phrases predicted through Prediction Engine

For details refer to Architecture tab in [Word Predictor](https://amudhanarayanan.shinyapps.io/word-predict/)


## Algorithm & Performance 

- Dataset is pre-processed to remove whitespace,numbers
- Freq from 4-gram to uni-gram were extracted as matrix
- Sorted N-grams by frequency of occurrence
- N-gram model with back-off strategy was used to predict
  - Iterates from 4-gram to 2-gram in back to match
  - Uses word with high freq in matching N-gram as output
  - For details refer to 'algorithm section' in Architecture tab in [Word Predictor](https://amudhanarayanan.shinyapps.io/word-predict/)

### Performance
- Created optimized n-gram dictionary file of just *5.83MB*
- Average response time to predict is under *0.05 seconds*
- Application memory usage under *200MB*

## Reference Link
 - Natural Language Processing [CRAN - NLP](http://cran.r-project.org/web/views/NaturalLanguageProcessing.html)
 - Shiny Dashboard [Samples](https://rstudio.github.io/shinydashboard/get_started.html)
 - Coursera [Data science](https://www.coursera.org/specializations/jhu-data-science)

