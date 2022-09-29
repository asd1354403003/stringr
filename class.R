library(stringr)

v1 = 'v1'
v2 = 'v2'

v3 = paste('learn ', v1, ' apply to ', v2, sep = '')
cat(v3, '\n')
cat(v1)



library(stringr)
v = 'MSIS is a we asd'
str_length(v)
str_to_lower(v)
str_detect(v, 'a')


a = readline('input ')
cat(str_detect(a, 'Trump'?)


a = 'asd is 123'
str_replace(a, 'asd', 'qwe')

str_count('asdasd', 'a')

str_sub(a, 1, -5)

word(a, 1)

str_squish('asdasd            asdas qeqw           q')





char_vector = c('asdasd', 'b', 'c')
char_vector[1]
length(char_vector)
str_count(char_ve?tor)
str_detect(char_vector, 'a')

char_vector = append(char_vector, c('qwe', 'zxc'))
char_vector[c(1:3)]
c(char_vector, 'asdasdasdf')


c(1 ,2, 3, 4, 5) +1





mi = read.csv('D:/1_COde/R/millennials2.csv', stringsAsFactors = F, encoding='UTF-8')

mean_st?_len = mean(str_length(mi$tweet_text))

head(str_length(mi$tweet_text), 10)

mi[1:10, c('tweet_created_at', 'in_reply_to_status_id_str')]


mi[c(2, 4, 6), c('tweet_created_at', 'in_reply_to_status_id_str')]


upper = str_to_upper(mi$tweet_text)
head(upper)?

sum(mi$retweet_count)

max(str_length(mi$tweet_text))
mi[str_length(mi$tweet_text) == 12, 'tweet_text']








sum(str_length(mi$tweet_text) >= 20)
mi[str_length(mi$tweet_text) >= 12,c('user_screen_name', 'tweet_text')]
sum(str_length(mi$tweet_text) >= ?000000)

sum(str_detect(str_to_lower(mi$user_description), 'millennial'))



uniq_ds = mi[!duplicated(mi$user_screen_name), 'user_description']
sum(str_detect(str_to_lower(uniq_ds), 'millennial'))



uniq_unique = mi[!duplicated(mi$user_screen_name), ]
uni?_unique[str_detect(uniq_unique$user_location, 'NC'), 'user_location']
uniq_unique[str_detect(uniq_unique$user_location, '\\bNC\\b'), 'user_location']



sum(str_detect(str_to_lower(mi$tweet_text), 'http'))

tweet_lower = str_to_lower(mi$tweet_text)

# is h?tp not https
tweet_lower[str_detect(tweet_lower, 'http') &! str_detect(tweet_lower, 'https')]


sum(str_detect(tweet_lower, 'http')) / length(tweet_lower)

sum(mi$user_verified == 1) / nrow(mi)

mi[mi$user_created_at == mi$tweet_created_at, c('user_screen_?ame', 'tweet_text')]

sum(mi$user_friends_count > mi$user_followers_count)



mil_uniq = mi[!duplicated(mi$user_screen_name), ]
nrow(mil_uniq[mil_uniq$user_followers_count / mil_uniq$user_friends_count>= 10, ] )
sum(na.omit((mil_uniq$user_followers_count /?mil_uniq$user_friends_count) )>= 10)
sum(is.na(mil_uniq$user_followers_count / mil_uniq$user_friends_count))


sum(mil_uniq$user_location == 'NYC' |mil_uniq$user_location == 'New York City' )





data.frame(sort(table(mi$user_screen_name), decreasing = T)?[1:10])
mil_uniq[str_detect(mil_uniq$user_description, 'GO UNTO ALL THE WORLD'), 'user_screen_name']


tl = data.frame(sort(table(mi$lang), descreasing = T)[1:10])
tl$Freq/nrow(mi)x





nc = c('north carolina', '\\bnc\\b', 'old north carolina')
nc = paste??c, collapse = '|')
mil_uniq[str_detect(str_to_lower(mil_uniq$user_location), nc), 'user_location']




south_re = '\\bDC\\b|\\bFL\\b|\\bGA\\b|\\bNC\\b|\\bTN\\b|\\bTX\\b' 
up_mi = str_to_upper(mil_uniq$user_location)
s_b = str_detect(up_mi, south_re)
sub =??p_mi[s_b]
data.frame(sort(table(sub), decreasing = T) [1:10])




capitals = '[A-Z]'
capitals = '[^A-Z]' # 除了A到Z
lower = '[a-z]'
u_l = '[A-Za-z]'
str_extract_all('A, awsda, qE', capitals)
str_replace_all('asdasdqWEEQWESADASasdasd', capitals,?'      ?)



years = '19[0-9][0-9]|20[0-9][0-9]'
#           随便给两个数  
years = '19\\d{2}|20[0-9][0-9]' 
str_extract_all('asdasd2022 asdasdasdasd1980', years)






regex1 = '#[a-zA-z]'
str_extract_all('#hello #this asd', regex1?



punc_regex = '[!@#$%^?*()?.,}{=_+\\]\\[]'
            # '[^A-Za-z 0-9]'
str_remove_all('asdasdasd#$%^&*', puc_regex)


regex1 = '\\b[A-z][A-Za-z]'

regex4 = '\\b(S|s)earch'
regex4 = '\\b(S|search'
regex4 = '\\b[Ss]earch'


regex5 = '^http'
str_count('h?tp://goggle is good anoth?r is https://twiiter.com', regex5)

regex6 = '[.!?]$'
str_detect('is is right?', regex6)


str_extract_all('#2018', '#[0-9]+')

str_extract_all('#2018 #2019 #678996789 123123', '#[0-9]{4}\\b')


str_extract_all('I have searched al? day and I am still searc?ing, search', '\\bsearch[a-z]*')





number ='2022 123123123123123 345345345345'
fourdigit = '\\b[0-9]{4}\\b'
seventeng = '\\b\\d{7,10}\\b'
str_extract_all(number, fourdigit)



a = '\\b[dm]is[a-z]+\\b'
str_extract_all('misasdasd?disasd asdasd', a)






?oboregex = '[a-zA-Z]+\\-\\d+'

robo = unlist(str_extract_all(mi$tweet_text, roboregex))

data.frame(sort(table(str_to_lower(robo)), decreasing = T)[1:10])




link_regex = '(?<=://)(\\S+)'
links = unlist(str_extract_all(mi$tweet_t?xt, link_regex))


ment_r?gex = '(?<!RT )(@\\w+)'
unlist(str_extract_all(mi$tweet_text, ment_regex))[1:10]




link_regex = '(?<=://)(\\S+)(?=\\b)'
mi$link_count = str_count(mi$tweet_text, link_regex)
View(mi)


t.test(mi[mi$user_verified==0, 'link_count']? mi[mi$user_verified==1, ?link_count'])

mi$zero_ff = as.integer(mi$user_followers_count == 0 & mi$user_friends_count ==0)





mi$ff_ratio = mi$user_followers_count/mi$user_friends_count
sum(mi[is.finite(mi$ff_ratio), ]$ff_ratio >= 10)
sum(is.infinite(mi$?f_ratio))
# sum(mil_uniq[?s.finite(mil_uniq$ff_ratio), ]$ff_ratio >= 10)



mi2 = mi[is.finite(mi$ff_ratio), ]
sum(is.na(mi2$ff_ratio))




wc = 'Length: 1,000 words' 
str_extract_all(wc, '(?<=Length: )(.+)(?=words)')



quantile(mil_uniq$user_followers_co?nt, c(.8,.9,.95,.99))


m?l_uniq$top10_fc = mil_uniq$user_followers_count >= quantile(mil_uniq$user_followers_count, .9)
mil_uniq[, c("user_followers_count", "top10_fc")]
mil_uniq[1:10, c("user_followers_count", "top10_fc")]
sum(mil_uniq$top10_fc == T)



?


hashtags = str_to_lowe?(hashtags)

most_like_ht = sapply(unique(hashtags), function(x)  sum(taw[str_detect(  str_to_lower(    taw$tweet   )  , x   ), 'likes']      )   )



taw$by_news_media = as.integer(str_to_lower(taw$username)  %in%  media_list)



?


uniq_users = unique(ta?$username)

most_like_users = sapply ( uniq_users,function (x) sum(taw[ taw$username == x,"likes"]))


top10users = data.frame( sort( most_like_users,decreasing = T)[1:10])
top10username = rownames(top10users)



sum(top10username?%in% taw$username)
sum(sa?ply(top10username, function(x) sum(taw$username == x)))





data.frame(sort(table(taw$date), decreasing = T) [1:10])

unlist(str_extract_all(mi$tweet_created_at, '2017\\-[0-9][0-9]'))
str_sub(mi$tweet_created_at, 1,7)

mi$month =?tr_sub(mi$tweet_created_a?, 1,7)
> data.frame(table(mi$month))




mean(unlist(taw[ 1, c('sent_gi', 'sent_he', 'sent_lm', 'sent_qap')],1))





ensemble = function( txt, stypes= c('SentimentGI',
                                    'SentimentHE',
          ?                         ?SentimentLM',
                                    'SentimentSDAP')){
    
  sent_txt = analyzeSentiment(txt)
  sents = unlist(sent_txt[names(sent_txt)  %in%  stypes])
  return( mean(sents))
  
}




library(quanteda)
library(topic?odels)




my_k_val= 5
my?method = "VEM"
#the other choice here is "Gibbs"
my_alpha_constant= 50
my_alpha=  my_alpha_constant/my_k_val



taw_corpus = corpus(taw$tweet)

custom_stopwords = stopwords('english')
more_stopwords = c('check', 'day', 'know', 'l?fe','alexwagner', 'think',?'pic.twitter.com')

custom_stopwords = unique(append(custom_stopwords, more_stopwords))


taw_dfm =dfm(taw_corpus,
             remove=custom_stopwords,
             stem=T, remove_punct=T, remove_numbers=T)

taw_dfm=dfm(taw_dfm,?elect="^.{3,}$",valuetype=?regex")
taw_dfm = dfm_trim ( taw_dfm,max_termfreq = 10000)
taw_dfm = dfm_trim ( taw_dfm,max_docfreq = 3000)

taw_tm = LDA(convert( taw_dfm,to ="topicmodels"), 
             k= my_k_val , 
             method= my_method , 
       ?     control = list(alpha ? my_alpha ))

get_terms(taw_tm,10)





library(SentimentAnalysis)

taw = read.csv('D:/1_COde/R/to_alexwagner.csv', stringsAsFactors = F, encoding='UTF-8')


taw$tweet_length= str_length(taw$tweet)
#taw$n_hashtags = str_count(taw$tweet,    '#[:alnum:]')
#t?w$n_hashtags = str_count(taw$tweet,    '#[A-Za-z0-9]')
taw$n_hashtags = str_count(taw$tweet,    '#\\w+')

#taw$n_mentions = str_count(taw$tweet,    '@[A-Za-z0-9_]+')
taw$n_mentions = str_count(taw$tweet,    '@\\w+')

taw$img = str_count(taw$tweet,    'pic.?witter.com')


taw$emoji = str_count(taw$tweet,       '<Emoji')


taw$sentiment = analyzeSentiment(taw$tweet)
taw$sent_qdap = taw$sentiment$SentimentQDAP


taw$question = as.integer(str_detect(taw$tweet, '\\w+\\?'))

taw$n_links = str_count(taw$tweet,    '?ttp')
taw$n_links = str_count(taw$tweet,    'https?://\\S+')
str_extract(taw$tweet,    'https?://\\S+')


taw$pct_cap = str_count(taw$tweet,     '[A-Z]')  /   str_count(taw$tweet,     '[A-Za-z]')




taw_lm_rt = lm(retweets ~ n_hashtags +n_mentions + img  ?, data =taw)
summary(taw_lm_rt)







usreps= read.csv('us_reps_tweets.csv', stringsAsFactors = F, encoding='UTF-8')
us_edges = usreps[, c('screen_name', 'tweet_text')]
us_edges$Source = str_to_lower(us_edges$screen_name) 
us_edges$Target = str_extract(us?edges$tweet_text, '(?<=RT @)(\\w+)')
us_edges = na.omit(us_edges)
us_edges$Target = str_to_lower(us_edges$Target)

