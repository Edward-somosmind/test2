library("googledrive")
library(ggplot2)
library(dplyr)
### esportación de documentos desde drive 
documentos<- drive_find(n_max=30) # drive find te enlaza a la cuenta en drive
documentos
documentos$name

### Descarga de archivos desde drive

drive_download("test rgds_Página 1_Tabla", type="csv")

data=read.csv("test rgds_Página 1_Tabla.csv")

head(data)

continente= filter(data, Continent=="Americas")
a= continente$Unique.Users

plot1<- ggplot(data=continente, mapping= aes(x= "", y = a, fill= Country))+
  geom_bar(stat = "identity")+ coord_polar(theta = "y")+ ggtitle("Usuarios únicos en America");plot1
