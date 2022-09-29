library(stringr)


{
  mi = read.csv('D:/1_COde/R/millennials2.csv', stringsAsFactors = F, encoding='UTF-8')

  
  cat("Twitter data loaded successfully.")
  
  # get unique user name 
  mil_uniq = mi[!duplicated(mi$user_screen_name), ]
  
  # get location key word
  keyword = readline('Please enter a location: ')
  
  
  # get user_location containing the location
  l = mil_uniq[   str_detect(       str_to_lower(mil_uniq$user_location)    ,     str_to_lower(keyword)     ), ]
  
  
  # count the frequency 
  df = data.frame(  sort(       table(    str_to_lower(l$user_location)   ),      decreasing = T) [1:10])
  
  
  # change colnames
  colnames(df) <- c('location','Freq')
  
  df
  
}
