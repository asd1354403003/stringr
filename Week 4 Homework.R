library(stringr)


{
  cat('Please enter three strings: \n')
  # input strings
  string_1 = readline('String 1： ')
  string_2 = readline('String 2： ')
  string_3 = readline('String 3： ')
  search_term = readline('Please enter a search term: ')
  
  # put strings into vector
  vector = c(string_1, string_2, string_3)
  
  
  # for case insensitive:
  # vector = c(str_to_lower(string_1), str_to_lower(string_2), str_to_lower(string_3))
  # search_term = str_to_lower(search_term)
  
  
  # calcualte length for each string 
  len_vector = str_length(vector)
  # summation of string length
  sum_len = sum(len_vector)
  # first count appearances in each string and sum them up
  sum_appear = sum(str_count(vector, search_term))
  

  
  cat('Your three string lengths are ', len_vector,
      ', which amount to a total of ', sum_len,' characters. \n',
      'Your search term appears in your strings a total of', sum_appear,'times.', sep = ' ')
}


