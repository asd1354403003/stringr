library(stringr)


{
  mi = read.csv('D:/1_COde/R/millennials2.csv', stringsAsFactors = F, encoding='UTF-8')
  
  cat("Twitter data loaded successfully.")
  
  # get unique user name 
  unique_mi = mi[!duplicated(mi$user_screen_name), ]
  
  # get keyword
? keyword = readline('Indicating a location to search: ')
  new_keyword = paste('\\b',keyword, '\\b', sep='')
  
  
  # get sum total_number_locations_unique based on the unique data set filtered above
  total_number_locations_unique = sum(str_detect(str_to?lower(unique_mi$user_location), str_to_lower(new_keyword)))
  
  # you don't need to keep it unique, so use the original dataset
  # like last line, keep them in lower case
  total_number_locations = sum(str_detect(str_to_lower(mi$user_location), str_to_lo?er(new_keyword)))
  
  
  cat('Your location', dQuote(keyword) ,'is present in ', total_number_locations_unique," unique users' locations.", '\n',
      'These users collectively produced ', total_number_locations,' tweets.')
  
}


