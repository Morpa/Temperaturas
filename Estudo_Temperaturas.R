# Instalando as bibliotecas necessárias
install.packages("data.table")
install.packages("dplyr")
install.packages("ggplot2")

#Carregando as bibliotecas
library(dplyr)
library(ggplot2)
library(scales)
library(data.table)

#Carregando os dados que serão utilizados
df <- fread("Temperaturas.csv")

#Criando um subset com os dados do Brasil
brasil <- subset(df, Country == 'Brazil')
head(brasil)
nrow(brasil)
dim(brasil)

#Preparação dos dados
brasil$day <- as.POSIXct(brasil$day, format='%Y-%m-%d')
brasil$Month <- month(brasil$day)
brasil$Year <- year(brasil$day)

#Criando os subsets das cidades
#São Paulo
sp <- subset(brasil, City == 'São Paulo')
sp <- subset(sp, Year %in% c(1955,1965,1975,1985,1995,2005))

#Campo Grande
cg <- subset(brasil, City == 'Campo Grande')
cg <- subset(cg, Year %in% c(1955,1965,1975,1985,1995,2005))

#Uberaba
ub <- subset(brasil, City == 'Uberaba')
ub <- subset(ub,Year %in% c(1955,1965,1975,1985,1995,2005))

#Criando os plots
p_sp <- ggplot(sp, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_classic(base_size = 20) +
  xlab("Mês") +
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média em São Paulo") +
  theme(plot.title = element_text(size = 18))
p_sp

p_cg <- ggplot(cg, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_classic(base_size = 20) +
  xlab("Mês") +
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média em Campo Grande") +
  theme(plot.title = element_text(size = 18))
p_cg

p_ub <- ggplot(ub, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_classic(base_size = 20) +
  xlab("Mês") +
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média em Uberaba") +
  theme(plot.title = element_text(size = 18))
p_ub
