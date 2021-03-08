# LETRA DEL DNI ESPAÑOL
# Calcular la letra del DNI a partir de su correspondiente número. 
# El método utilizado para obtener la letra (L) del DNI consiste en dividir el número entre 23 
# y de acuerdo con el resto (R) obtenido otorgar la letra correspondiente de la siguiente tabla.

DNI <- function(numero) {
    letras <- c("T","R","W","A","G","M","Y","F","P","D","X","B",
                "N","J","Z","S","Q","V","H","L","C","K","E")
    letras <- letras[numero %% 23 + 1]
    return(letras)
}
DNI(10000000)