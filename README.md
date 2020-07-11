# Predict_Word_NLP
Natural language processing(NLP) techniques used to perform the analysis and build the predictive model.
[Word Predictor](https://amudhanarayanan.shinyapps.io/word-predict/)

##Overview
##========================================================
**Goal** - To build smart shiny app to predict next word/phrase for mobile device using optimized prediction engine.

**Builded with following Components** [Architecture](https://amudhanarayanan.shinyapps.io/word-predict/)
![Algorithm Screenshot](algorithm.png)



##Algorithm & Performance 
##========================================================
- Dataset is pre-processed to remove whitespace,numbers
- Freq from 4-gram to uni-gram were extracted as matrix
- Sorted N-grams by frequency of occurrence
- N-gram model with back-off strategy was used to predict
  - Iterates from 4-gram to 2-gram in back to match
  - Uses word with high freq in matching N-gram as output
  - For details refer to Architecture tab in [Word Predictor](https://amudhanarayanan.shinyapps.io/word-predict/)

**Performance Improvements**
- Created optimized n-gram dictionary file of just *5.83MB*
- Average response time to predict is under *0.05 seconds*
- Application memory usage under *200MB*



##Application Interface
##========================================================
- Lightweight and Easy to use with just 3 simple steps
![Application Screenshot](app-screenshot.png)



##Tools/Lib Used and Reference Links
##========================================================
 - IDE - RStudio 
 - Language - R, shell scripts ,jquery
 - Libraries - Rweka,tm,strini,Revobase,stylo,data.table
 - Web - Shiny Dashboard

**Reference Link**
 - Data from [HC Corpora](http://www.corpora.heliohost.org/)
 - Natural Language Processing [CRAN - NLP](http://cran.r-project.org/web/views/NaturalLanguageProcessing.html)
 - Shiny Dashboard [Samples](https://rstudio.github.io/shinydashboard/get_started.html)
 - Coursera [Data science](https://www.coursera.org/specializations/jhu-data-science)

## Word Predictor User Guide

- In shiny dashboard ,User interface of Word Predictor framework is designed in such a way that it can be made to fit in **Mobile Device**.

-



![Application Screenshot](app-screenshot.png)


## Word Predictor User Guide

- In shiny dashboard ,User interface of Word Predictor framework is designed in such a way that it can be made to fit in **Mobile Device**.

-



![Application Screenshot](app-screenshot.png)
