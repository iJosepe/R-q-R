v <- c(4,2,-8)
print(v)
frutas <- c(15, 100, 2, 30)
names(frutas) <- c("naranja", "pera", "manzana", "durazno")
print(frutas)
frutas["manzana"] <- 8
print(frutas)

u <- 2:33
v <- c(4, 5, 6)
w <- c(u, v)
print(u,v,w)

# CONSTRUCCION DE MATRICES
(m <- 11:30) # Un vector con 20 números
# Para convertirla en matriz simplemente se especifica el atributo dim
dim(m) <- c(4,5)
m
rownames(m) <- c("uno", "dos", "tres", "cuatro" )
colnames(m) <- c('UNO','DOS','TRES','CUATRO','CINCO')
m 

m1 <- rbind(c(1.5, 3.2, -5.5), c(0, -1.1, 60))
m1

# install.packages('tidyverse')

library(tidyverse)

radio <- 0:10 # Vector de radios
area <- pi*radio^2 # Vector de áreas
tit <- "Áreas de círculos" # Título del gráfico
plot(radio, area, # x=radio y=area
type="b", # "both", puntos y líneas
main=tit,
xlab="Radio (r)",
ylab=expression(Area == pi*r^2), # Una expresión
col="orange", # color (naranja)
pch=20) # tipo de símbolo para punto

# Operaciones con matrices
(A <- matrix(1:6, 3, 2))
(B <- rbind(7:9, 10:12))
A %*% B
# Matriz traspuesta
t(A)

# FACTORES Y CADENAS DE CARACTERES
persona <- c("Hugo", "Paco", "Luis", "Petra", "Maria", "Fulano",
"Sutano", "Perengano", "Metano", "Etano", "Propano")
mes.nacimiento <- c("Dic", "Feb", "Oct", "Mar", "Feb", "Nov",
"Abr", "Dic", "Feb", "Oct", "Dic")
print(persona[7]); print(mes.nacimiento[7])
# Uso de paste()
paste(persona[7], "nacio en el mes de", mes.nacimiento[7])

# Funcion de conversion as.factor()
Fmes.nacimiento <- as.factor(mes.nacimiento)
Fmes.nacimiento
# y generamos ahora la impresión con el factor
paste(persona[7], "nació en el mes de", Fmes.nacimiento[7])
# La función table() toma típicamente como argumento un factor y regresa
# como resultado justamente la frecuencia de aparición de los 
# niveles en el vector de índices.
table(Fmes.nacimiento)
# Incluimos todos los meses en la tabla de frecuencias
meses <- c("Ene","Feb","Mar","Abr","May","Jun","Jul","Ago",
"Sep","Oct","Nov","Dic")
# Se incluyen meses que no están el el vector original
FFmes.nacimiento <- factor(mes.nacimiento, levels=meses)
FFmes.nacimiento
# Ahora la tabla de frecuencias es:
table(FFmes.nacimiento)

# Acceso a los elementos de un factor
# Un elemento individual del factor:
Fmes.nacimiento[10]
# Un elemento individual de los niveles:
levels(Fmes.nacimiento)[3]

# LISTAS Una lista, de la clase list, es una clase de datos que puede 
# contener cero o más elementos, cada uno de los cuales puede ser 
# de una clase distinta. 
familia <- list("Maria", "Juan", 10, c("Hugo", "Petra"), c(8,6))
familia
familia <- list(madre="Maria", padre="Juan", casados=10,
hijos=c("Hugo", "Petra"), edades=c(8, 6))
familia
# Acceso a los elementos individuales de una lista
familia$madre
familia[['madre']]
# Acceso de escritura
familia[['padre']] <- 'Juan Pedro'
familia$padre
familia$"madre" <- "Maria Candelaria"
mm <- "madre"
familia[[mm]]
familia[[ paste("ma", "dre", sep="") ]]

## DATA FRAMES
# Un data frame es una lista, cuyos componentes pueden ser vectores,
# matrices o factores. 
(m <- cbind(ord=1:3, edad=c(30L, 26L, 9L)) )
(v <- c(1.80, 1.72, 1.05) )
df <- data.frame(familia=c("Padre", "Madre", "Hijo"),m, estatura=v)
df 

# Usamos read.table()
mi.tabla <- read.table('Rtext.txt')
colnames(mi.tabla)
rownames(mi.tabla)
mi.tabla$Piso
mi.tabla[[2]]
mi.tabla[2]
mi.tabla[3, 2]
mi.tabla[3, 2] <- 106
mi.tabla
mi.tabla$Calentador
class(mi.tabla$Calentador)
mi.tabla$Total <- mi.tabla$Precio * mi.tabla$Area
mi.tabla
