##--------- 3. Manipulacion Informacion
# lea el archivo en formato txt data.txt
# asigne el archivo de datos a la variable data_txt
setwd(wd1)
list.files()

data_txt <- read.table(file = "data_ejer_tab.txt",sep = "\t", dec = ",", header = TRUE)
# que estructura de datos es data_txt
str(data_txt)
View(data_txt)

# Muestre los nombres, clase, dimension, numero de col, numero de filas de data_txt 
names(data_txt)
class(data_txt)
dim(data_txt)
dim(data_txt)[1]
dim(data_txt)[2]
ncol(data_txt)
nrow(data_txt)

summary(data_txt1)
# Ingresando a los elementos de la data

#---------------------------- Variable numerica ---------------------
edad <- data_txt[,2]
edad <- data_txt[,"Edad"]
str(edad)
View(edad)
typeof(edad)
length(edad)
attributes(edad)
class(edad)

is.atomic(edad)
is.integer(edad)
is.double(edad)
is.numeric(edad)
is.list(edad)

# obtener los elementos 5, 8, 10 de edad y asignar a edad1
edad1 <- edad[c(5,8,10)]
length(edad1)

# obtener los 50 primeros elementos de edad y asignar a edad1
edad1 <- edad[1:50]
length(edad1)
# eliminar el primer elemento de edad y asignar a edad1
edad1 <- edad-1]
length(edad)
length(edad1)
# eliminar los elementos 1, 25, 51 de edad y asignar a edad1
edad1 <- edad[-c(1,25,51)]
length(edad)
length(edad1)
# eliminar los primeros 1000 elementos de edad y asignar a edad1
edad1 <- edad[-(1:1000)]
length(edad)
length(edad1)

# eliminar los elementos iguales a 24 de edad y asignar a edad1
edad==24
edad1 <- edad[edad==24]
# edad1 es constante?
min(edad1)==max(edad1)
length(edad1)

edad!=24
!edad==24
edad1 <- edad[edad!=24]
length(edad1)
mean(edad1)
min(edad1)
max(edad1)
summary(edad1)

# Seleccionar los valores inferiores a 65 años asignar a edad1
edad<=65
edad1 <- edad[edad<=65]
length(edad1)
mean(edad1)
min(edad1)
max(edad1)
summary(edad1)

# recodificando valores
# si la edad es superior a 65 setear 65 por defecto
edad>65
edad1 <- edad
edad1[edad1>65] <- 65
max(edad1)
max(edad)
View(edad1)

# si la edad es inferior a 18 setear 18 por defecto
edad1 <- edad
edad1[edad1<18] <- 18
min(edad1)
min(edad)
View(edad1)

# si la edad es inferior a 18 y mayor a 65 setear "fuera de rango" por defecto
edad1 <- edad
edad1<18 | edad > 65
edad1[edad1<18 | edad > 65] <- "fuera de rango"
str(edad1)
min(edad1)
max(edad1)
# obtener la media?
mean(edad1)
edad2 <- as.numeric(edad1)
#edad2 <- as.double(edad1)
#edad2 <- as.integer(edad1)
mean(edad2)
mean(edad2, na.rm=TRUE)


## datos perdidos
perd <- is.na(edad)
typeof(perd)
str(perd)
# todos los datos de edad son perdidos?
all(perd)
# existe al menos un dato perdido?
any(perd)
# cuente los datos perdidos
sum(perd)
# que porcentaje de datos perdidos se tiene
mean(perd)
# cuantos datos no vacios se tiene
nrow(data_txt)-sum(perd)
dim(data_txt)[1] - sum(perd)


#---------------- Variable categorica ---------------
# lea el archivo data_ejer.xlsx y asigne a data_excel
setwd(wd1)
list.files()
data_excel <- read_excel("data_ejer.xlsx", sheet = 1,col_names = TRUE,na = "")
str(data_excel)
names(data_excel)

# seleccione la variable Vivienda y asigne a tipviv
tipviv <- data_excel[,"Vivienda"]

# encuentre la longitud, el tipo
str(tipviv)
View(tipviv)
typeof(tipviv)
length(tipviv)
attributes(tipviv)
class(tipviv)
levels(tipviv)

# es numerica? es caracter?
is.atomic(tipviv)
is.numeric(tipviv)
is.logical(tipviv)
is.character(tipviv)
is.list(tipviv)

# es un factor? si no lo es coercione a factor
is.factor(tipviv)
tipvivf <- factor(tipviv)
levels(tipvivf)
class(tipvivf)
levels(tipvivf)

# Halle la frecuencia
table(tipvivf)
prop.table(table(tipvivf))

# modificar levels
tipviv1 <- tipvivf
levels(tipviv1) <- c("Alquilada", "Familiar","Otros","Propia","No disponible")
table(tipviv)
table(tipviv1)

# recodificando valores
# si la tipviv es Alquilada setear Otros por defecto
tipviv1 <- tipvivf
tipviv1[tipviv1=="Alquilada"] <- "Otros"
table(tipviv1)
prop.table(table(tipviv1))


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
nrow(data_txt)-sum(perd)
dim(data_txt)[1] - sum(perd)


# coercione a numerico y a character tipvivf
str(tipvivf)
tipvivnum <- as.numeric(tipvivf)
str(tipvivnum)
tipvivchr <- as.character(tipvivf)
str(tipvivchr)
