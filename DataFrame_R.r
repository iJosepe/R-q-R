# DATA FRAMES en R

Producto <- c("Zumo", "Queso", "Yogurt")
Seccion <- c("Bebidas", "Productos lácteos", "Productos lácteos")
Unidades <- c(2, 1, 10)

# Puedes almacenar esas variables como matriz utilizando la función cbind
x <- cbind(Producto, Seccion, Unidades)
# Todas las variables se han transformado a la clase caracter. 
# En cambio, si usas la función data.frame, mantendrás el tipo original de las variables

temp <- c(20.37, 18.56, 18.4, 21.96, 29.53, 28.16,
          36.38, 36.62, 40.03, 27.59, 22.15, 19.85)
humedad <- c(88, 86, 81, 79, 80, 78,
             71, 69, 78, 82, 85, 83)
precipitaciones <- c(72, 33.9, 37.5, 36.6, 31.0, 16.6,
                     1.2, 6.8, 36.8, 30.8, 38.5, 22.7)
mes <- c("enero", "febrero", "marzo", "abril", "mayo", "junio",
         "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre")

datos <- data.frame(mes = mes, temperatura = temp, humedad = humedad,
                    precipitaciones = precipitaciones )

names(datos) # Nombres de las variables (columnas)
head(datos)  # Primeras filas de nuestro conjunto de datos
View(datos)
summary(datos) # Resumen estadístico de las variables (columnas)

# Data frames de ejemplo de R
data() # Listar los Set de Datos que R proporciona
data(AirPassengers) # Seleccionar un data frame modelo de R
ls()
AirPassengers

# Crear un Data Frame vacio
# Variables vacías
dataset <- data.frame(mes = character(),
                      temperatura = numeric(),
                      precipitaciones = numeric(),
                      humedad = numeric())

# Copiando la estructura de otro conjunto de datos
dataset <- datos[FALSE, ] # Recuerda que creamos el objeto 'datos' antes

# Convirtiendo una matriz en data.frame y asignándole nombres a las columnas
dataset <- data.frame(matrix(ncol = 4, nrow = 0))
nombres_columnas <- c("mes", "temperatura", "precipitaciones", "humedad")
colnames(dataset) <- nombres_columnas

# Equivalente a la última opción
dataset <- data.frame(matrix(ncol = 4, nrow = 0,
                      dimnames = list(NULL, c("mes", "temperatura",
                                              "precipitaciones", "humedad"))))

# Acceso a los datos del dataframe
datos$mes
datos[,1] # Equivalente
# Seleccionando las columnas 1 a 3 con una secuencia
datos[, 1:3]
# Seleccionando columnas con la funcion c()
datos[, c('temperatura','precipitaciones')]
datos[, c(2, 4)] # equivalente

# Acceso a filas
datos[1,]
# Acceso al dato 
datos[1,2]
datos[1:2,2]

# Acceso directo usando la función attach()
# Para no escribir una y otra vez el nombre del dataframe lo pasamos a a attach()
# Par desvilcularlo usamos detach()
attach(datos)
temperatura
temperatura[6]
detach(datos)
temperatura # obtendremos error de objeto no encontrado

# Añadir Columnas y Filas a un Data Frame
data(cars)
head(cars)
# Crear una nueva variable para transformar la velocidad en kilómetros por hora (km/h) kilómetro = milla/0.62137
# y la distancia en metros. metro = pie/3.2808
# Agregamos dos columnas kph y meters
cars$kph <- cars$speed / 0.62137
cars$meters <- cars$dist / 3.2808
head(cars)
# Tambien se pueden añadir columnas con cbind() y filas con rbind()
kph <- cars$speed / 0.62137
meters <- cars$dist / 3.2808
cars <- cbind(cars[,c(1,2)], kph, meters)
head(cars)

# Eliminar columnas y filas del data frame
## 1. Usar menos (-) para las columnas a quitar. Borramos la 1ª y 2ª columna
cars2 <- cars[, -c(1,2)]
## 2. Crear un subconjunto de los datos a conservar. Seleccionamos las columnas que queremos conservar
cars2 <- cars[, c("kph", "meters")]

# Ordenar y Filtrar Data Frames
data(mtcars)
ii <- order(mtcars$hp) # Vector rsultado Indice de ordenacion en base a la variable 'hp' caballos
# El vector de índices de ordenación establece el orden en que tienen que ser elegidas las filas 
# del data frame para obtener la ordenación deseada.
head(mtcars[ii,])
head(mtcars[ii,1:4]) # Orden por el indice ii, solo para las 4 primeras cols
# También puedes ordenar de mayor a menor haciendo uso del signo menos.
ii <- order(-mtcars$hp)
head(mtcars[ii,])
# Ordenamos por 2 variables
ii <- order(mtcars$cyl, mtcars$hp)
head(mtcars[ii,1:4])

# Filtrar Data Frames
# Obtener un subconjunto con subset()
# El numero de cilindros cyl = 6 y potencia caballos hp > 115
subset(mtcars, cyl == 6 & hp > 115)
# Igual pero mostrar solo mpg, cyl y disp usando el argumento select()
subset(mtcars, cyl == 6 & hp > 115, select = c(mpg, cyl, disp))
# Seleccionaremos los coches donde la variable wt es menor que 2 o la variable hp es mayor a 115.
subset(mtcars, wt < 2 | hp > 115, select = c(mpg, wt, hp))
