# 1 Funcion plot en R https://r-coder.com/plot-en-r/

set.seed(1)

# Generamos datos de ejemplo
x <- rnorm(500)
y <- x + rnorm(500)

# Dibujamos los datos
plot(x, y)

# Equivalente
M <- cbind(x, y)
plot(M)

# Ejemplos

par(mfrow = c(2, 3))

# Datos
mi_ts <- ts(matrix(rnorm(500), nrow = 500, ncol = 1),
              start = c(1950, 1), frequency = 12)

mis_fechas <- seq(as.Date("2005/1/1"), by = "month", length = 50)

mi_factor <- factor(mtcars$cyl)

fun <- function(x) x^2

# Diagrama de dispersión
plot(x, y, main = "Gráfico de dispersión")

# Gráfico de barras
plot(mi_factor, main = "Diagrama de barras")

# Diagrama de cajas
plot(mi_factor, rnorm(32), main = "Diagrama de cajas y bigotes")

# Gráfico de una serie temporal
plot(mi_ts, main = "Serie temporal")

# Time-based plot
plot(mis_fechas, rnorm(50), main = "Gráfico basado en fechas")

# Dibujar una función
plot(fun, 0, 10, main = "Trazar una función")

# Gráfico de correlación
plot(trees[, 1:3], main = "Matriz de correlación")

par(mfrow = c(1, 1))


if(.Platform$OS.type == "windows")
   win.metafile("Rplot%02d.wmf", pointsize = 10)

# 2 Ventanas gráficas
# En RStudio el gráfico se mostrará en el panel de gráficos, 
# pero si utilizas la función correspondiente, el gráfico se abrirá en 
# una nueva ventana, al igual que en R base.
windows() # Windows
# X11()     # Unix
# quartz()  # Mac
# Este gráfico se 
# abrirá en una ventana nueva
plot(x, y)
# Nueva ventana
windows()
# Otro gráfico en la nueva ventana
plot(x, x)
# Limpiar la ventana gráfica
# Borrar el plot actual
dev.off()
# Borrar todos los gráficos
graphics.off()
while (dev.cur() > 1) dev.off() # Equivalente

# 3 Tipos de plot en R
j <- 1:20
k <- j
par(mfrow = c(1, 3))
plot(j, k, type ="l", main = "type = 'l'")
plot(j, k, type ="s", main = "type = 's'")
plot(j, k, type ="p", main = "type = 'p'")
par(mfrow = c(1, 1))
par(mfrow = c(1, 3))
plot(j, k, type ="o", main = "type = 'o'")
plot(j, k, type ="b", main = "type = 'b'")
plot(j, k, type ="h", main = "type = 'h'")
par(mfrow = c(1, 1))

4 El argumento pch
r <- c(sapply(seq(5, 25, 5), function(i) rep(i, 5)))
t <- rep(seq(25, 5, -5), 5)
plot(r, t, pch = 1:25, cex = 3, yaxt = "n", xaxt = "n",
     ann = FALSE, xlim = c(3, 27), lwd = 1:3)
text(r - 1.5, t, 1:25)

5 Título del plot en R
5.1 Título en LaTeX
6 Subtítulo del gráfico
7 Ejes de los plots en R
7.1 Etiquetas de los ejes X e Y
7.2 La función axis
7.3 Cambiar los ticks
7.4 Eliminar etiquetas de las marcas de los ejes
7.5 Cambiar las etiquetas de los ticks
7.6 Rotar las etiquetas de los ejes
7.7 Límites de los ejes
7.8 Cambiar la escala de los ejes
8 Fuente de texto de un plot en R
8.1 Tamaño de la fuente
8.2 Estilo de las fuentes
8.3 Familia de las fuentes
9 Colorear plots en R
9.1 Colorear según grupo
9.2 Cambiar el color de fondo
10 Añadir líneas o curvas a un gráfico en R
10.1 Ancho de línea
10.2 Tipo de línea
11 Añadir texto a un plot en R
11.1 Etiquetar puntos en R
12 Cambiar el tipo de caja con el argumento bty
13 Añadir una leyenda a un plot en R