library(stringr)



{
  taw = read.csv('D:/1_COde/R/to_alexwagner.csv', stringsAsFactors = F, encoding='UTF-8')

  taw_date = unique( taw$date )
  
  
  
  rts_per_date = sapply ( taw_date,function (x) sum(taw[ taw$date == x,"likes"]))

  
  data.frame( sort( rts_per_user,decreasing = T)[1:10])
  
  
  }
