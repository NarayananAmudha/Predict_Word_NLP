library(shiny)

source("word_prediction.R")
### Function `predict_w4(input_text, ngram4.dt)`
### predicts the next word from a trigram input.
### arguments:  1) input_text, char;
###             2) ngram4.dt,, data.table of 4grams and their frequencies.
### 1) processes the input text,
### 2) makes a data.table from the last 3 words of the input text,
### 3) selects from an existing data.table of 4grams
###     those that match the input trigram, and
### 4) returns a list `tops` of the 4th words ordered by most frequent.


load("tot.freqs_ngram.RData")
### That loads the data.table of 4grams and frequencies
### `tot.freqs`

fix_apo <- function(word){
    ## fix the apostrophe in contractions.
    wordN <- ifelse(grepl("'",word),gsub("'", "\\'",word,fixed=T),word)
    wordN
}

na2commons <- function(word){
    ## `word` is a list of words.
    #commons <- c("the", "be", "to", "of", "and", "a")
    commons <- c("", "", "", "", "", "")
    if(length(word)==1){
        if(is.na(word) | grepl("^na$",word, ignore.case=T))
            word <- commons[round(runif(1,1,6),0)]
    } else{
        for(i in 1:length(word))
            if(is.na(word[i]) | grepl("^na$",word[i], ignore.case=T))
                word[i] <- commons[i]
    }
    word
}

insert_choice <- function(word, end_space){
    ## amends the input text with the chosen word.
    ## `text1` is the input text field (see file 'ui.R').
    ## `end_space` is boolean, and is defined in the shinyServer function.
    paste("$('#text1').val($('#text1').val() + '",
          ifelse(end_space, ""," "),
          word, " ", "').trigger('change'); 
          var input = $('#text1'); 
          input[0].selectionStart =
          input[0].selectionEnd = input.val().length;",
          sep='')
}

babble<-function(intext,N=1,top=TRUE ,X = 1){
    phrase <- ""
    for(i in 1:N){
        ifelse(top,
               wordnext <- na2commons(predict_w4(intext,tot.freqs)[X]),
               #wordnext <- na2commons(predict_w4(intext,tot.freqs)[round(runif(1,1,3),0)])
        )
        phrase <- ifelse(phrase == "", wordnext, paste(phrase,wordnext))
        intext <- paste(intext,phrase)
    }
    phrase
}



clear <- "$('#text1').val('');
var input = $('#text1');
input[0].selectionStart = input[0].selectionEnd = input.val().length;"

shinyServer(
    function(input, output, session) {
        
        intext <- reactive({input$text1})
        
        end_space <- reactive( grepl(" $", intext()) )
        phrase1 <- ""
        phrase2 <- ""
        phrase3 <- ""
        phrase4 <- ""
        phrase5 <- ""

        output$midPanel <- renderUI({
            
            tags$div(
                tags$button(type="button", id="clearbut", rows=2,cols=50, "Clear",
                            class="btn action-button shiny-bound-input",
                            onclick=clear)
            )
        })
        output$bottomPanel <- renderUI({
            #tags$script(src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js")
            #if(input$num_bab >1){
            
            #if (str_sub(intext(), start=-1) == " ") {
            phrase1 <- babble(intext(),input$num_bab,TRUE,1)
            phrase2 <- babble(intext(),input$num_bab,TRUE,2)
            phrase3 <- babble(intext(),input$num_bab,TRUE,3)
            phrase4 <- babble(intext(),input$num_bab,TRUE,4)
            phrase5 <- babble(intext(),input$num_bab,TRUE,5)            

            #}
            
            buttonR1Click <- insert_choice(fix_apo(phrase1),end_space())
            buttonR2Click <- insert_choice(fix_apo(phrase2),end_space())
            buttonR3Click <- insert_choice(fix_apo(phrase3),end_space())
            buttonR4Click <- insert_choice(fix_apo(phrase4),end_space())
            buttonR5Click <- insert_choice(fix_apo(phrase5),end_space())
            
#             ,tags$head(tags$style("#text1{color: blue;font-size: 22px;
#                                  font-style: bold-italic;
#                                  }" ) ) 
            


            tags$div(
                tags$button(type="button", id="wordR1but", phrase1,
                            class="btn action-button shiny-bound-input",
                            style="color:darkred",                            
                            onclick=buttonR1Click)
                            ,tags$head(tags$style("#wordR1but{color: blue;font-size: 18px;
                                                 font-style: bold-italic;
                                                 }" ) ) 
                ,tags$button(type="button", id="wordR2but", phrase2,
                            class="btn action-button shiny-bound-input",
                            style="color:darkred",
                            onclick=buttonR2Click)
                ,tags$head(tags$style("#wordR2but{color: blue;font-size: 18px;
                                                 font-style: bold-italic;
                                                 }" ) ) 
                ,tags$button(type="button", id="wordR3but", phrase3,
                            class="btn action-button shiny-bound-input",
                            style="color:darkred",
                            onclick=buttonR3Click)
                ,tags$head(tags$style("#wordR3but{color: blue;font-size: 18px;
                                                 font-style: bold-italic;
                                                 }" ) ) 
                ,tags$button(type="button", id="wordR4but", phrase4,
                             class="btn action-button shiny-bound-input",
                             style="color:darkred",
                             onclick=buttonR4Click)
                ,tags$head(tags$style("#wordR4but{color: blue;font-size: 18px;
                                                 font-style: bold-italic;
                                                 }" ) ) 
                ,tags$button(type="button", id="wordR5but", phrase5,
                             class="btn action-button shiny-bound-input",
                             style="color:darkred",
                             onclick=buttonR5Click)
                ,tags$head(tags$style("#wordR5but{color: blue;font-size: 18px;
                                                 font-style: bold-italic;
                                                 }" ) ) 
            )

        })

    }    
)