library(stringr)


{
  mi = read.csv('D:/1_COde/R/millennials2.csv', stringsAsFactors = F, encoding='UTF-8')
  
  
  cat("Twitter data loaded successfully." )
  cat('\n')

  # extract all @users and I don't think '!duplicated' works better here
  x = str_extract_all( str_to_lower(mi$tweet_text), '@[a-zA-z0-9]+')
  
  # list to character
  rted  = unlist(x)
  
  
  # count the frequency 
  df = data.frame(       sort(       table( rted )       ,      decreasing = T) [1:10])
  
  

  df
  
}