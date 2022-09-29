library(stringr)

q ="People like me know that there is no magic. There is only the grind. Work looks like magic to those unwilling to do it. You say you’re not a hero? Heroes aren’t born. You just go out there and grind it out. You fail and you look foolish and you just keep grinding. There is nothing else. There is no ‘chosen one,’ there is no destiny, nobody wakes up one day and finds out they’re amazing at something. There’s just slamming your head into the wall, refusing to take no for an answer. Being relentless, until either the wall or your head breaks."

# calculate length 
len = str_length(q)

# check 'magic'
magic_bol = str_detect(q, 'magic')

# check 'wand'
wand_bol = str_detect(q, 'wand')


# combine the results
cat('The following quote: \n \n', q, '\n \n', 'Contains ', len, ' characters.', '\n',
    'It is ', magic_bol, " that the string 'magic' appears in it.", '\n',
    'It is ', wand_bol, " that the string 'wand' appears in it.", 
    sep = '')
