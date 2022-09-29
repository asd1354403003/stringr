library(stringr)

taw = read.csv('D:/1_COde/R/to_alexwagner.csv', stringsAsFactors = F, encoding='UTF-8')

cat('Alex Wagner" dataset loaded.')


# USE SPlit funciton to split ','

split_unique= length(  unique(  unlist(strsplit(  taw$mentions , split = ','))))

cat(split_unique, " unique users appeared in this dataset's mentions.")


sum_of_unique = sum(unique(unlist(strsplit(    unlist(taw$mentions) , split = ','))) %in% taw$username) 


cat ( 'These users contributed ', sum_of_unique, ' ( ', sum_of_unique/length(taw$username)," %) tweets of the dataset's ", length(taw$username), ' total')
