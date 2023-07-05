# LEITURA DOS DADOS DA POF 2008-2009 - R


# "....." indica a pasta/diret?rio de trabalho no HD local separados por "/"
# onde se encontram os arquivos .txt descompactados do arquivo Dados_20200917.zip
# Exemplo: setwd("c:/POF20082009/Dados/")
setwd("C:/Users/jota_/Dropbox/Pesquisa/sm_brasil/")

path <- "C:/Users/jota_/Dropbox/Pesquisa/sm_brasil/"

path_data_txt <- paste0(path,"data/download_ibge/pof_0809/")

path_data_rds <- paste0(path,"data/r/pof_0809")

# REGISTRO: DOMIC?LIO - POF1 / QUADRO 2 (TIPO_REG=01)

DOMICILIO <- 
  read.fwf(paste0(path_data_txt,"T_DOMICILIO_S.txt") 
           , widths = c(2,2,3,1,2,2,14,14,4,4,2,2,2,2,2,2,2,2,2,
                        2,2,2,2,2,2,2,1,1,1,16,16,16,1,1,1,1,1,1,
                        1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,6,1
           )
           , na.strings=c(" ")
           , col.names = c("TIPO_REG","COD_UF","NUM_SEQ","NUM_DV","NUM_DOM","ESTRATO_POF","PESO",
                           "PESO_FINAL","PERIODO_REAL","QTD_MORADOR_DOMC","QTD_UC",             
                           "QTD_FAMILIA","V0202","V0203","V0204","V0205","V0206","V0207",
                           "V0208","V0209","V0210","V0211","V0219","V0221","V0222",
                           "V0223","IMPUT_QTD_COMODOS","IMPUT_QTD_BANHEIROS","IMPUT_ESGOTO",
                           "RENDA_MONETARIA","RENDA_NAO_MONETARIA","RENDA_TOTAL","V0224",
                           "V02011","V02012","V02013","V02014","V02015","V02016","V02017",
                           "V02018","V02019","V0212","V0213","V0214","V02151","V02152",
                           "V02161","V02162","V02163","V02164","V02165","V02166","V02167",
                           "V02171","V02172","V02173","V02174","V02175","V02181","V02182",             
                           "V02183","V02184","V02185","COD_UPA","TIPO_SITUACAO_REG")
           , dec="."
  )   

# Armazena no HD local arquivo serializado para leituras futuras
saveRDS(DOMICILIO,paste0(path_data_rds,"DOMICILIO.rds"))