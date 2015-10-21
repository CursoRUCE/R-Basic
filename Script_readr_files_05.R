###-----------------------------------------------###
###----------- Curso R Nivel Básico --------------###
###-- Lectura y Escritura de datos en R ----------###
###-- Source Stat Lab Ec -------------------------###
###-- Octubre, 2015 ------------------------------###
###-----------------------------------------------###

##--------- 1. working directory wd
# Obtener directorio de trabajo
getwd()

# setear wd
wd0 <- "C:/Users/Toshiba/Desktop/readr_files_05"
setwd(wd0)
getwd()
list.files()

wd1 <- "C:/Users/Toshiba/Desktop/readr_files_05/read_data" 
setwd(wd1)
getwd()
list.files()

# archivos en wd
list.files()
list.files(pattern = ".txt")

files <- list.files()
files
grep(files, pattern = ".txt")
files[grep(files,pattern = ".txt")]

# crear nuevos directorios (carpetas)
setwd(wd0)
file.exists("ssl")
dir.create("ssl")

##--------- 2. read files
setwd(wd1)
list.files()
# read.table function
# archivo formato txt
data_txt1 <- read.table(file = "data_read_tab.txt",sep = "\t", dec = ",", header = TRUE)
str(data_txt1)
View(data_txt1)

# Variables categóricas como character
data_txt2 <- read.table(file = "data_read_tab.txt",sep = "\t", dec = ",",
                        header = TRUE, stringsAsFactors = FALSE)
str(data_txt2)


# archivo formato csv
data_csv <- read.table(file = "data_read.csv",sep = ",", dec = ".", header = TRUE)
str(data_csv)
View(data_csv)

# sep = ",", dec = ".", header=TRUE
data_csv1 <- read.csv(file = "data_read.csv")
str(data_csv1)

data_csv2 <- read.csv2(file = "data_read.csv",sep = ",", dec = ".", header = TRUE)
str(data_csv2)


# archivo formato xlsx
install.packages("readxl", dependencies = TRUE)
library(readxl)
ls("package:readxl")
# lista de las hojas del libro "data_read.xlsx"
# path de archivo
dir_arch <- file.path(wd1, "data_read.xlsx")
excel_sheets(path = dir_arch)

# leer archivo
data_xlsx <- read_excel("data_read.xlsx",sheet = "datos",col_names = TRUE, na=c(""))
str(data_xlsx)
View(data_xlsx)


# archivos spss formato .sav
install.packages("foreign", dependencies = TRUE)
library(foreign)
ls("package:foreign")
data_sav1 <- read.spss("data_read.sav", use.value.labels = TRUE, 
                      to.data.frame = TRUE)
str(data_sav1)


install.packages("haven", dependencies = TRUE)
# spss: read_spss(), sas: read_sas(), stata: read_dta()
library(haven)
ls("package:haven")
data_sav2 <- read_spss("data_read.sav")
str(data_sav2)

##--------- Comparación foreign y haven:
# foreign
system.time(data_sav1 <- read.spss("data_read.sav", use.value.labels = TRUE, 
                                   to.data.frame = TRUE))
# haven
system.time(data_sav2 <- read_spss("data_read.sav"))

##------ Accediendo a datos desde la web
## Descargar archivos desde Dropbox
install.packages("repmis", dependencies = TRUE)
library(repmis)
ls("package:repmis")
data_dbx1 <- source_DropboxData(file = "data_read_tab.txt", key="b2pnuajshfrr4as", sep="\t",
                               header = TRUE)
str(data_dbx1)
data_dbx2 <- source_DropboxData(file = "data_read.csv", key="vy36he6y740i73f", sep=",",
                               header = TRUE)
str(data_dbx2)

## Descargar archivos desde tablas html
library(RCurl)
library(XML)
install.packages("RCurl", dependencies = TRUE)
install.packages("XML", dependencies = TRUE)

base_url <- "http://www.sbs.gob.ec/practg/pk_cons_bdd.p_bal_entdd_finnc?vp_cod_tip_instt=3&vp_cod_instt=1004&vp_anio=2015&vp_mes=09&vp_cod_tip_catlg=18"
tabla_url <- readHTMLTable(base_url)
str(tabla_url)
data_sbs <- tabla_url[[3]]
str(data_sbs)
View(data_sbs)
    

##--------- 3. Manipulacion Informacion
# lea el archivo en formato txt data_ejer_tab.txt
# asigne el archivo de datos a la variable data_txt


# que estructura de datos es data_txt


# Muestre los nombres, clase, dimension, numero de col, numero de filas de data_txt 

# ejecute el codigo summary(data_txt)

# Ingresando a los elementos de la data
#-------------- Variable numerica -----------------
# seleccione la variable edad
# halle su longitud, tipo, clase


# es double? si no lo es coercione a doblue


# obtener los elementos 5, 8, 10 de edad y asignar a edad1


# obtener los 50 primeros elementos de edad y asignar a edad1


# omitir el primer elemento de edad y asignar a edad1


# omitir los elementos 1, 25, 51 de edad y asignar a edad1


# omitir los primeros 1000 elementos de edad y asignar a edad1


# omitir los elementos iguales a 24 de edad y asignar a edad1


# edad1 es constante?




# Seleccionar los valores inferiores a 65 años asignar a edad1



# recodificando valores
# si la edad es superior a 65 setear 65 por defecto

# si la edad es inferior a 18 setear 18 por defecto

# si la edad es inferior a 18 y mayor a 65 setear "fuera de rango" por defecto


# obtener la media?


#---------------- Variable categorica ---------------
# lea el archivo data_ejer.xlsx y asigne a data_excel

# seleccione la variable Vivienda y asigne a tipviv

# encuentre la longitud, el tipo

# es numerica? es caracter?

# es un factor? si no lo es coercione a factor

# Halle la frecuencia

# modificar levels
tipviv1 <- tipvivf
levels(tipviv1) <- c("Alquilada", "Familiar","Otros","Propia","No disponible")
table(tipviv)
table(tipviv1)

# recodificando valores
# si la tipviv es Alquilada setear Otros por defecto


## datos perdidos
perd <- is.na(tipvivf)
typeof(perd)
# todos los datos de tipviv son perdidos?
all(perd)
# existe al menos un dato perdido?
any(perd)
# cuente los datos perdidos
sum(perd)
# que porcentaje de datos perdidos se tiene
mean(perd)
# cuantos datos no vacios se tiene



# coercione a numerico y a character tipvivf




#-------------- Graficos estadisticos ------------------
setwd(wd1)
list.files()

data_txt <- read.table(file = "data_ejer_tab.txt",sep = "\t", dec = ",", header = TRUE)
# que estructura de datos es data_txt
str(data_txt)
names(data_txt)

edad <- as.numeric(data_txt[,"Edad"])
# histograma
hist(edad)
hist(edad,breaks = 100)
hist(edad,breaks = 50, xlab = "Edad", ylab="Frecuencia", main="Histograma de Edad")
hist(edad,breaks = 50, xlab = "Edad", ylab="Frecuencia", main="Histograma de Edad",
     col="steelblue", border="gray1")

# Diagrama de cajas
boxplot(edad)
boxplot(edad,horizontal = TRUE)
boxplot(edad, xlab = "", ylab="Edad", main="Diag cajas de Edad")
boxplot(edad, xlab = "", ylab="Edad", main="Diag cajas de Edad",
     col="steelblue", border="gray1")


# Diagrama de dispersion
edad <- as.numeric(data_txt[,"Edad"])
Score <- data_txt[,"Score"]
plot(edad, Score)
plot(edad, Score, xlab = "Edad", ylab="Score", main="Score vs Edad")
plot(edad, Score, xlab = "Edad", ylab="Score", main="Score vs Edad",
     pch=20)
plot(edad, Score, xlab = "Edad", ylab="Score", main="Score vs Edad",
     pch=18, col="steelblue")

# Diagrama de barras
tipviv <- data_txt[,"Vivienda"]
barplot(table(tipviv))
barplot(table(tipviv),horiz = TRUE)
barplot(table(tipviv), xlab = "Vivienda", ylab="Frecuencia", main="Diagrama de barras")
barplot(table(tipviv), xlab = "Vivienda", ylab="Frecuencia", main="Diagrama de barras",
        col="steelblue", border="gray1")


# multiples graficos
par(mfrow=c(2,2))
hist(edad,breaks = 50, xlab = "Edad", ylab="Frecuencia", main="Histograma de Edad",
     col="steelblue", border="gray60")
boxplot(edad, xlab = "", ylab="Edad", main="Diag cajas de Edad",
        col="steelblue", border="gray60")
plot(edad, Score, xlab = "Edad", ylab="Score", main="Score vs Edad",
     pch=18, col="steelblue")
barplot(table(tipviv), xlab = "Vivienda", ylab="Frecuencia", main="Diagrama de barras",
        col="steelblue", border="gray50")



# Ejercicio
# Realice los graficos anteriores para las variables
# Ingresos_mensuales, Estado_civil, eliga los colores y titulos a conveniencia



