#script con las variables en el mes de enero

rm( list=ls() )  #remove all objects
gc()             #garbage collection

require("data.table")
require("rlist")
require("yaml")

require("lightgbm")

#paquetes necesarios para la Bayesian Optimization
require("DiceKriging")
require("mlrMBO")


#para poder usarlo en la PC y en la nube sin tener que cambiar la ruta
#cambiar aqui las rutas en su maquina
switch ( Sys.info()[['sysname']],
         Windows = { directory.root  <-  "M:\\" },   #Windows
         Darwin  = { directory.root  <-  "~/dm/" },  #Apple MAC
         Linux   = { directory.root  <-  "~/buckets/b1/" } #Google Cloud
)
#defino la carpeta donde trabajo
setwd( directory.root )



#kexperimento  <- NA   #NA si se corre la primera vez, un valor concreto si es para continuar procesando

#kscript         <- "845_stacking_v005"

karch_dataset    <- "./datasets/dataset_epic_addingv007.csv.gz"

karch_dataset<-fread("datasets_dataset_variables_v007.csv")
#datase<-fread(karch_dataset)
dataset_ene  <-   karch_dataset[   karch_dataset$foto_mes=="202101",  ] 

columns<-c('numero_de_cliente','active_quarter','cliente_vip', 'internet', 'cliente_edad', 'cliente_antiguedad', 
           'mrentabilidad', 'mrentabilidad_annual','mp_consumo_tc_td', 'consumo_tc_ingreso', 'ctrx_quarter', 
           'consumo_ingreso','cp_cantidad_trans','mcuentas_saldo','prestamos_ingreso','inv_dolar_ingreso', 
           'mp_monto_cc_ca', 'mcaja_ahorro','saldo_ingreso','mdescubierto_preacordado',
           'cproductos_delta2', 'mp_consumo_tc', 'mp_prestamos', 'serv_ingreso', 'mdescubierto_preacordado_delta2', 
           'saldo_ingreso_lag1' )
subset<-dataset_ene[,columns, with=FALSE]

fwrite( subset,
        file=paste0( "./datasets/dataset_variables_v007.csv"),
        sep="," )