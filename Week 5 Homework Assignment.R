library(stringr)

{
  # load the data
  tweets = read.csv('D:/1_COde/R/millennials2.csv', stringsAsFactors = F, encoding='UTF-8')
  
  cat("Twitter data loaded successfully.")
  
  # get keyword
  keyword = readline('Please enter a keyword to search: ')
  
  # get tweets' texts
  t_text = tweets$tweet_text
  
  # whether each element contains the keyword
  # put them to lower case 
  check_vector = str_detect(str_to_lower(t_text), str_to_lower(keyword))
  
  # get total number of elements containing the keyword
  total = sum(str_count(check_vector, 'TRUE'))
  cat(total)
}