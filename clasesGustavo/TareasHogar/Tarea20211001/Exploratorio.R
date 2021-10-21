rm( list=ls() )  #remove all objects
gc()             #garbage collection

library( "data.table") 
dataset_cloud<- fread( "https://storage.googleapis.com/labo2021/datasetsOri/paquete_premium_202101.csv")



#cargo los datasets que voy a comparar
setwd("C:/Users/Luis Gomez/Documents/Albany Trainings/Maestría/Lab" )  #establezco la carpeta donde voy a trabajar


#datasetA  <- fread( "./datasetsOri/paquete_premium_202011.csv" )

dataset2021  <- fread( "./datasetsOri/paquete_premium_202101.csv" )

kaggle<-fread("kaggle_E1033_meseta_E1033_845_stacking_v003_018_10000.csv")


baja<-kaggle[ kaggle$Predicted=="1", ] 
columns<-c('numero_de_cliente','active_quarter','cliente_vip', 'internet', 'cliente_edad', 'cliente_antiguedad', 'mrentabilidad', 'mrentabilidad_annual')
subset<-dataset2021[,columns, with=FALSE]
union<-merge(baja,subset,by='numero_de_cliente')

#install.packages("treemap")

options(scipen = 999) ### turn off scientific notation
library(tidyverse)
library(readxl)
library(treemap)
library(questionr)
library(corrplot)
library(GGally)
library(plotly)
library(summarytools) # para el uso de estadisticas descriptivas


summary(union)
#Visualizaciones!!!

#https://www.data-to-viz.com/#explore

# https://plotly.com/r/


#setwd("C:/Users/valer/Documents/Maestria-Profesora/AID/2021/Clase II/Practica")


#Health_w <- read_excel("Health_systems02.xlsx", sheet = "Salud")


#View(Health_w)

# Convierto las variables cualitativas como factor
union <- mutate(union, active_quarter = as.factor(active_quarter))
union <- mutate(union, cliente_vip = as.factor(cliente_vip))
union <- mutate(union, internet = as.factor(internet))

summary(union)



# reportes descriptivos

view(freq(union$active_quarter, plain.ascii = FALSE, style = "rmarkdown"))
view(freq(union$cliente_vip, plain.ascii = FALSE, style = "rmarkdown"))

view(descr(union))

view(dfSummary(union))



