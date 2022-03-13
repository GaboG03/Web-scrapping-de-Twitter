install.packages("rtweet")

library(rtweet)
appname<- "Extracción Minería de Datos"
key<- "tI08jy5RZMr9cQFwkM3BzAcwH"
secret<- "u3Drddn5eM0joFlOE3SaJHKQe197MZwRgzqBwzJQqwUseiyGHd"

twitter_token <- create_token(app = appname, consumer_key = key, consumer_secret = secret)

library(rvest)
library(tidyverse)


busqueda = "Prestamos, Ecuador"
news_pag = "https://news.google.com/"
html_dir = paste0(news_pag,"search?q=",gsub(" ","+",busqueda),"&hl=es-419&gl=US&ceid=US:es-419")
google_news = read_html(html_dir)
noticias =  html_nodes(google_news,".ipQwMb")
head(noticias)

html_text(noticias[2:6])

periodico <-  html_nodes(google_news,".wEwyrc") 
periodico <-  html_text(periodico )
periodico[2:6]
