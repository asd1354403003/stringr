library(stringr)
library(SentimentAnalysis)

taw = read.csv('D:/1_COde/R/to_alexwagner.csv', stringsAsFactors = F, encoding='UTF-8')


text = taw$tweet
sentiment <- analyzeSentiment(text)


#my_function <- function(text, method) {
#}



gi = convertToDirection(sentiment)$SentimentGI

total = length(str_count(gi, 'positive'))
total = total/100

cat('GI N positives: ', sum(str_count(gi, 'positive')),'GI % positives:', sum(str_count(gi, 'positive'))/ total  )
cat('GI N positives: ', sum(str_count(gi, 'negative')),'GI % positives:', sum(str_count(gi, 'negative'))/ total )
cat('GI N positives: ', sum(str_count(gi, 'neutral')),'GI % positives:', sum(str_count(gi, 'neutral'))/ total  )



he = convertToDirection(sentiment)$SentimentHE
cat('HE N positives: ', sum(str_count(he, 'positive')),'HE % positives:', sum(str_count(he, 'positive'))/ total  )
cat('HE N positives: ', sum(str_count(he, 'negative')),'HE % positives:', sum(str_count(he, 'negative'))/ total )
cat('HE N positives: ', sum(str_count(he, 'neutral')),'HE % positives:', sum(str_count(he, 'neutral'))/ total  )




lm = convertToDirection(sentiment)$SentimentLM
cat('LM N positives: ', sum(str_count(lm, 'positive')),'HE % positives:', sum(str_count(lm, 'positive'))/ total  )
cat('LM N positives: ', sum(str_count(lm, 'negative')),'HE % positives:', sum(str_count(lm, 'negative'))/ total )
cat('LM N positives: ', sum(str_count(lm, 'neutral')),'HE % positives:', sum(str_count(lm, 'neutral'))/ total  )




q = convertToDirection(sentiment)$SentimentQDAP
cat('QDAP N positives: ', sum(str_count(q, 'positive')),'HE % positives:', sum(str_count(q, 'positive'))/ total  )
cat('QDAP N positives: ', sum(str_count(q, 'negative')),'HE % positives:', sum(str_count(q, 'negative'))/ total )
cat('QDAP N positives: ', sum(str_count(q, 'neutral')),'HE % positives:', sum(str_count(q, 'neutral'))/ total  )




