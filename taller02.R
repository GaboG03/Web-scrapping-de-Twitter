install.packages("rvest")

library(rvest)

url <- "https://www.produbanco.com.ec/banca-minorista/tarjetas/"

pagina_web <- read_html(url) #cargar la estructura de la página

#html_nodes para extraer información de la página segun el CSS selector 
#html_text para extraer texto de un html_nodes

# h3 captura la información

tarjeta_aux<- html_nodes(pagina_web,"h3")

tarjeta<- html_text(tarjeta_aux)

tarjeta<- tarjeta[6:11]


frase_aux<- html_nodes(pagina_web,"p")

frase<-html_text(frase_aux)

frase<-frase[ seq(6,16,by=2) ]


#Descripcion

descripcion_aux<-html_nodes(pagina_web,"li")

descripcion<- html_text(descripcion_aux)

descripcion<- descripcion[seq(48,58,by=2)]


enlace_aux<- html_nodes(pagina_web,".solicitada")

enlace <- html_attr(enlace_aux,"href")

enlace <- enlace[seq(0,12,by=2)]

# Los unimos en un dataframe: 

produbanco <- data.frame(Tarjeta = tarjeta, Beneficios = frase, 
                   Descripcion = descripcion, Enlace =enlace)
head(produbanco)


###### tabla: 

url1<- "https://www.superbancos.gob.ec/bancos/calificacion-de-riesgo-instituciones-financieras-2019/"

pagina_web1 <- read_html(url1)

tabla_aux <- html_nodes(pagina_web1,".tablepress")

tabla <- html_table(tabla_aux)

### haven para spss stata 
##read_dta 

#openxlsx 

# para importar write.xlsx