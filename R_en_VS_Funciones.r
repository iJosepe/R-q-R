### FUNCIONES
hipotenusa <- function(x, y) {sqrt(x^2 + y^2)}
class(hipotenusa)
hipotenusa(3,4)
hipotenusa(y=4,x=3)
hipotenusa <- function(x=3, y=4) { # valores por ausencia
return( sqrt( x^2 + y^2 ) )
}
# Llamamos a la función con argumentos "ausentes"
hipotenusa()

ff <- function(r) {
return(PI * r^2)
}
ff(3)
PI <- 3.1416
ff(3)

## Coercion, conversion de tipos
x <- 1.03
x
y <- as.integer(x) # conversión a entero
y
z <- as.complex(y) # conversión a complejo
z
a <- c("1000", "2013.1", "0")
class(a)
b <- as.numeric(a) # conversión de character a otro tipo
b
class(b)
c <- as.logical(b) # conversión a lógico
c

(m <- matrix(1:20, nrow = 5, ncol = 4))
ff <- as.data.frame(m)
ff
ff$V2

# FUNCION PROGRESION GEOMETRICA
an <- function(a1, r, n) {
    a1 * r ** (n-1)
}
an(a1 = 1, r = 2, n = 5) # Pasamos argumentos con nombre
an(1,2,5) # Si los argumentos se pasan por orden no cesitan nombre  
an(n = 5, r = 2, a1 = 1) # Si pasamos argumentos con nombre podemos alterar el orden
an(4, -2, 6)
# con la funcion args() podemos conocer los argumentos que pasamos a una funcion
args(an)
an # Si escribimos el nombre de la función, la consola devolverá el código de la función.

v <- 1:5 # Creamos un vector
an(1, 2, v) # Podemos pasar un vector como argumento
an(a1 = 1, r = 2, n = 10:15)

# Con la siguiente funcion sn() podemos calcular los primeros n elementos de la progresion
sn <- function(a1, r, n) {
    a1 * (r ** n-1) / (r - 1)
}
sn(1,2,5) #31
# El equivalente con an() seria
values <- an(1,2,1:5)
values # 1 2 4 8 16
sum(values) #31

# Podemos tener argumentos predeterminados (por defecto) en la función. 
# Siempre se utilizarán los valores predeterminados a menos que se incluyan otros.
coseno <- function(w = 1, min = -2 * pi, max = 2 * pi) {
    x <- seq(-2 * pi, 2 * pi, length = 200)
    plot(x, cos(w*x), type ='l')
}
# Si ejecutamos coseno(), la gráfica de cos(x) se trazará por defecto en el intervalo [-2 π , 2 π ].
coseno()
# Sin embargo, si queremos graficar la función cos(2x) en el mismo intervalo, necesitamos ejecutar coseno(w = 2)
coseno(w = 2)
# Mas ejemplos para una fila, tres columnas
par(mfcol = c(1, 3))
coseno()
coseno(w = 2)
coseno(w = 3, min = -3 * pi)

# ARGUMENTOS ADICIONALES EN R
# El argumento ... (punto punto punto) permite pasar argumentos libremente que se usarán en una subfunción dentro de la función principal.
coseno <- function(w = 1, min = -2 * pi, max = 2 * pi, ...) {
    x <- seq(-2 * pi, 2 * pi, length = 200)
    plot(x, cos(w*x), type ='l', ...)
}
# Los argumentos que se pasen dentro de ... se usarán por la función plot.
par(mfcol = c(1,2))
coseno(w = 2, col = "red", lwd = 2)
coseno(w = 2, ylab = "")

# La funcion Return
# Devolucion de objetos en lista
asn <- function(a1 = 1, r = 2, n = 5) {
    A <- an(a1, r, n)
    S <- sn(a1, r, n)
    ii <- 1:n
    AA <- an(a1, r, ii)
    SS <- sn(a1, r, ii)
    return(list(an = A, sn = S,
                salida = data.frame(valores = AA,
                                    sum = SS)))
}
asn()

# La misma funcion pero comprobando que los argumentos de entrada son numeros
# Usamos return para salir de la funcion en caso de no numerico
asn <- function(a1 = 1, r = 2, n = 5) {
    if(!is.numeric(c(a1, r, n))) return("Todos los parámetros deben ser números")
    A  <- an(a1, r, n)
    S  <- sn(a1, r, n)
    ii <- 1:n
    AA <- an(a1, r, ii)
    SS <- sn(a1, r, ii)
    return(list(an = A, sn = S,
                salida = data.frame(valores = AA,
                                    sum = SS)))
}
asn("3")
asn(3)

# Variables locales y globales
fun <- function() {
    print(x)
}
x <- 1
fun() # 1

x <- 1
fun2 <- function() {
    x <- 2
    print(x)
}

fun2() # 2
x #1

# Para cambiar el valor global de una variable dentro de una función, 
# usamos el operador de doble asignación (<<-).
x <- 1
y <- 3
fun3 <- function() {
    x <- 2
    y <<- 5
}

fun3() # 2 5
x # 1 el valor no cambia
y # 5 el valor cambia forzado por <<-
