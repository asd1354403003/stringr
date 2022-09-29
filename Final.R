library(quanteda)
library(topicmodels)
library(stringr)
library(dplyr)
library(lubridate)
library(ggplot2)
library(SentimentAnalysis)
library(psych)
library(xts)
library(data.table)
library(lubridate)
library(igraph)
library(janeaustenr)
library(tidytext)
library(slam)
library(tm)

nft = read.csv('C:/Users/13544/Downloads/ye.csv', stringsAsFactors = F, encoding='UTF-8')

describe(nft)

#detect_l  =  detect_language(nft$text)

#nft$language_detect = detect_l

ori_df = data.frame(nft)

df = subset(ori_df, ori_df$lang =='en' )

cat('Exact English text percent =>', nrow(df)/ nrow(ori_df))

df = distinct(df)
df = df[!is.na(df$text),]

df$text = str_to_lower(df$text)

df =  subset(df, select=-c(user_public_metrics,public_metrics))



cat('Exact English text percent =>', nrow(df)/ nrow(ori_df))





df$created_at = ymd_hms(df$created_at)


cat(max(df$created_at) - min(df$created_at))


df$created_hour = as.integer(substr(df$created_at, 11, 13))

df$created_min = as.integer(substr(df$created_at, 15, 16))



cat( table(df$created_hour)  )


barplot( table(df$created_hour)  )


x = df[1: 54908, ]
y = df[54909: 109817, ]
z = df[109818: nrow(df), ]


x$sentiment = analyzeSentiment(x$text)
y$sentiment = analyzeSentiment(y$text)
z$sentiment = analyzeSentiment(z$text)

new_df = rbind(x, y, z)


write.csv(new_df, 'new_ye.csv')




q = read.csv('D:/1_COde/R/new_ye.csv', stringsAsFactors = F, encoding='UTF-8')


barplot( table(q$created_hour) , col= 'purple', ylab = "Total amount", xlab = "Hour" )










data.frame(sort(table(q$user_location), decreasing = T)[1:10])
unique_id = df[!duplicated(df$id), ]

median(unique_id$followers_count, na.rm=T)
quantile(    unique_id$following_count, c(.32, .50, .98) , na.rm=T)  

sum(str_detect(as.numeric(df$like_count), '0'),  na.rm=T)
mean(str_count(df$text,    '#\\w+'))
sort(table(unlist(str_extract_all( str_to_lower(df$text),    '#\\w+')))   ,   decreasing = T) [1:10]
str_count(str_to_lower(df$text),    'https://discodS+')


free_b = grepl(c("free mint", "freemint"), q$text)
give_away = grepl(c("giveaway", 'give away'), q$text)




my_k_val = 3
my_method = "VEM" #the other choice here is "Gibbs"/"VEM"
my_alpha_constant = 50 
my_alpha = my_alpha_constant / my_k_val

awag_corpus = corpus(q$tweet)
custom_stopwords = stopwords("english")


awag_fm = dfm(q[q$free_mint == 'TRUE', ]$text,
              remove=custom_stopwords,
              stem=F,
              remove_punct=T,
              remove_numbers=T) 

awag_fm = dfm(awag_fm,
              select="^.{3,}$",
              valuetype="regex")

awag_fm = dfm(awag_fm,
              remove="@\\w+",
              valuetype="regex")

awag_fm = dfm_trim(awag_fm,
                   max_docfreq = 3000)

tf_idf = dfm_tfidf(awag_fm)




q$free_mint = free_b
q$give_away = give_away

q[q$free_mint == 'TRUE', ]$text
sort(table(q[q$free_mint == 'TRUE', ]$text), decreasing = T)[1:5]
sum(sort(table(q[q$free_mint == 'TRUE', ]$text), decreasing = T)[1:5])

q[q$give_away == 'TRUE', ]$text
sort(table(q[q$give_away == 'TRUE', ]$text), decreasing = T)[1:5]
sum(sort(table(q[q$give_away == 'TRUE', ]$text), decreasing = T)[1:5])











mean(q$sentiment.SentimentGI)
mean(q$sentiment.SentimentHE)
mean(q$sentiment.SentimentLM)
mean(q$sentiment.SentimentQDAP)



sent4 = c('sentiment.SentimentGI', 'sentiment.SentimentHE', 'sentiment.SentimentLM', 'sentiment.SentimentQDAP')


sent_df <- data.frame(matrix(ncol = 3, nrow = 0))
colnames(sent_df) <- c('Hour', 'Method', 'Mean')


for (i in unique(q$created_hour)) {

  
  for(j in sent4){
    mean_value = mean(  unlist(select(q[q$created_hour == i, ], j  ))  )
    cat(i, j)
    cat(  mean_value    , typeof(mean_value)  )
    
    sent_df[nrow(sent_df) + 1,] <- c(i, substr(j, 20, nchar(j))   , mean_value             )
    
    
  }
}

sent_df$Mean = as.numeric(sent_df$Mean)


# Grouped
ggplot(sent_df, aes(fill=Method, y=Mean, x=Hour)) + 
  geom_bar(position="dodge", stat="identity")



i7=1868.79
i8 =1872.96
i9 = 1860.18
i10 = 1852.83
i11 = 1851.14

ic = c(i7, i8, i9, i10, i11)

sent_mean = aggregate(sent_df$Mean, list(sent_df$Hour), FUN=mean)

cor(ic, sent_mean$x)

rate_sen = (sent_mean$x - lag(sent_mean$x)) / lag(sent_mean$x)

rate_i = (ic - lag(ic)) / lag(ic)


cor(rate_i[2:5], rate_sen[2:5])


plot(rate_i[2:5], rate_sen[2:5], ylab = "index change rate", xlab = "sentiment change rate" )



q$created_at_floor = floor_date(ymd_hms(q$created_at), "5 minute")



sent_minute_df <- data.frame(matrix(ncol = 3, nrow = 0))
colnames(sent_minute_df) <- c('minute', 'Method', 'Mean')


for (i in unique(q$created_at_floor)) {
  
  
  for(j in sent4){
    mean_value = mean(  unlist(select(q[q$created_at_floor == i, ], j  ))  )
    cat(i, j)
    cat(  mean_value    , typeof(mean_value)  )
    
    sent_minute_df[nrow(sent_minute_df) + 1,] <- c(i, substr(j, 20, nchar(j))   , mean_value             )
    
    
  }
}

sent_minute_df$Mean = as.numeric(sent_minute_df$Mean)
sent_minute_df$minute = as.POSIXct(as.integer(sent_minute_df$minute), origin="1970-01-01", tz="UTC")


# Grouped
g2 = ggplot(sent_minute_df, aes(fill=Method, y=Mean, x=minute)) + 
  geom_bar(position="dodge", stat="identity")

g2+ theme(axis.text.x = element_text(angle = 90, hjust = 1))




mic = c(1868.36, 1868.79,1869.15,1873.82, 1873.57,1872.73, 1871.5,
        1872.96,1873.05, 1872.92, 1868.67, 1863.6, 1862.58, 1862.26, 1862.5, 1862.55, 1862.29, 1862.15, 1861.31,
        1860.18, 1858.48, 1855.96, 1855.57, 1851.93, 1853, 1853.26, 1853.19, 1852.27, 1852.36, 1852.38, 1852.86,
        1852.83, 1852.51, 1852.42, 1852.52, 1850.27, 1844.85, 1844.67,1844.02, 1843.97, 1843.92, 1843.91, 1843.82,
        1843.74, 1848.39, 1848.28, 1848.44, 1850.03, 1849.09, 1849.84,1851.48, 1850.78, 1850.86, 1850.87, 1851.14)

sent_minute_mean = aggregate(sent_minute_df$Mean, list(sent_minute_df$minute), FUN=mean)


cor(as.numeric(sent_minute_mean$x[1:length(mic)]),        mic   )
plot(as.numeric(sent_minute_mean$x[1:length(mic)]), mic , ylab = "index", xlab = "sentiment")

rate_sen_minute = (sent_minute_mean$x - lag(sent_minute_mean$x)) / lag(sent_minute_mean$x)
rate_i_minute = (mic - lag(mic)) / lag(mic)
cor(          scale(  rate_i_minute[2:length(mic)]       ,center=TRUE,scale=TRUE),         scale(   rate_sen_minute[2:length(mic)]   ,center=TRUE,scale=TRUE)         )
plot( rate_sen_minute[2:length(mic)], rate_i_minute[2:length(mic)], ylab = "index change rate", xlab = "sentiment change rate")



sd(rate_sen_minute[2:length(rate_sen_minute)])
sd(rate_sen[2:length(rate_sen)])






buy = q[, c("id",  "retweet_count" , "reply_count",  "like_count" ,"quote_count" ,"followers_count" , "tweet_count" )]

buy = subset(buy, buy$followers_count >=1000 )

buyratio = buy$followers_count / (buy$retweet_count + buy$reply_count+ buy$like_count + buy$quote_count)

buyratio =  as.double(str_replace_all(buyratio, 'Inf',   '-1'))

buy$buyratio = buyratio

sum(buyratio> 0.2) / length(buyratio)




x = df[1: 54908, ]
y = df[54909: 109817, ]
z = df[109818: nrow(df), ]

dd1 <- Corpus(VectorSource(df[1: 30000, ]$text)) 

dd1 <- tm_map(dd1, stripWhitespace)
dd1 <- tm_map(dd1, tolower)
dd1 <- tm_map(dd1, removePunctuation)
dd1 <- tm_map(dd1, removeWords, stopwords("english"))
dd1 <- tm_map(dd1, stemDocument)
dd1 <- tm_map(dd1, removeNumbers)
dtm1 <- DocumentTermMatrix(dd1, control = list(weighting = weightTfIdf))
m = as.matrix(dtm1)


dd2 <- Corpus(VectorSource(q[54909: 109817, ]$text)) 


dd3 <- Corpus(VectorSource(q[109818: nrow(df), ]$text)) 








