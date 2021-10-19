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
