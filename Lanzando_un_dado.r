# Funcion lanzando un dado
# Simula n (por defecto n = 100) lanzamientos de un dado. 
# Devuelve la tabla de frecuencias y el gráfico correspondiente.

dado <- function(n = 100) {
    lanzamientos <- sample(1:6, n, replace = TRUE, prob = NULL) # sample(1:6, n, rep = T)
    frecuencias <- table(lanzamientos)/n
    barplot(frecuencias, main = "")
    abline(h = 1/6, col = "red", lwd = 2)
    return(frecuencias)
}

par(mfcol = c(1,3))
dado(100) # dado()
dado(500)
dado(1000
# A medida que aumentamos n estamos más cerca del valor teórico 1/6 = 0.1667.