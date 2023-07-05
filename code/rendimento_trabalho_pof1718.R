# ANÁLISE DESCRITIVA BASE DE RENDIMENTOS

## libraries ---
library(tidyverse)

## setup -----

setwd("C:/Users/jota_/Dropbox/Pesquisa/sm_brasil/")

path <- "C:/Users/jota_/Dropbox/Pesquisa/sm_brasil/"

path_data_17 <- paste0(path,"dados/POF_20172018/dados_rds/")

## import and clean data ----

  # 2017/2018
  rendimento_17 <- readRDS(paste0(path_data_17,"RENDIMENTO_TRABALHO.rds"))

  # minimum wage was R$937,00 in 2017
  #minimum wage was R$954,00 in 2018
  # setting lb to be 0.95 of MW and UB to be 1.05 of MW
  mw_lb_17 <- 0.95*937
  mw_ub_17 <- 1.05*937
  mw_lb_18 <- 0.95*954
  mw_ub_18 <- 1.05*954
  
  # create person-level wage
  df_rendimento_pessoa <- rendimento_17 %>% 
    group_by(COD_UPA, NUM_DOM, NUM_UC, COD_INFORMANTE) %>%
    slice_max(V8500_DEFLA) %>% 
    ungroup()  %>%
    # select the desired variables
    select(c(1,2,3,4,5,6,7,"V9001","V5302","V5304","V8500","V9011",
             "V8500_DEFLA","COD_IMPUT_VALOR","PESO","PESO_FINAL","RENDA_TOTAL","V53011","V53061")) %>%
    # identify MW in 2017
    mutate(mw_17 = ifelse(V8500_DEFLA >= mw_lb_17 & V8500_DEFLA <= mw_ub_17, 1, 0)) %>%
    # identify MW in 2018
    mutate(mw_17 = ifelse(V8500_DEFLA >= mw_lb_18 & V8500_DEFLA <= mw_ub_18, 1, 0))
  
  df_rendimento_uc <- rendimento_17 %>%
    group_by(COD_UPA, NUM_DOM, NUM_UC) %>% 
    slice_max(V8500_DEFLA) %>% 
    ungroup() %>% 
    # select the desired variables
    select(c(1,2,3,4,5,6,7,"V9001","V5302","V5304","V8500","V9011",
             "V8500_DEFLA","COD_IMPUT_VALOR","PESO","PESO_FINAL","RENDA_TOTAL","V53011","V53061")) %>%
    # identify MW in 2017
    mutate(mw_17 = ifelse(V8500_DEFLA >= mw_lb_17 & V8500_DEFLA <= mw_ub_17, 1, 0)) %>%
    # identify MW in 2018
    mutate(mw_17 = ifelse(V8500_DEFLA >= mw_lb_18 & V8500_DEFLA <= mw_ub_18, 1, 0))
    
    
  
  # 2008/2009
  
  # 2002/2003
  
