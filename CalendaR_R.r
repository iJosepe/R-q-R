# Calendarios en R con GGPLOT2 https://r-coder.com/calendarios-r/
# 1 Calendario anual en R

library(calendR) # install.packages("calendR")

calendR() # Por defecto crea el calendario del a�o en curso
# Si no quieres los calendarios en el idioma de tu sistema operativo, 
# puedes modificarlo. Si quieres que los calendarios est�n en 
# ingl�s, puedes escribir: Sys.setlocale("LC_ALL", "English") 
# antes de ejecutar la funci�n calendR.

calendR(year = 2022) # Especifica el a�o deseado

# # 1.1 Comienzo de las semanas
calendR(year = 2022, start = 'M') # Comienzo las semanas en lunes

# # 1.2 Coloreando los d�as del calendario
calendR(year = 2025,
        start = "M",
        special.days = c(9, 19, 56, 79, 102,   # D�as para colorear
                         126, 257, 300, 342),
        special.col = "lightblue",             # Color de los d�as especificados
#        special.days = c(194),
#        special.col = 589,
        low.col = "white")                     # Color de fondo del resto de d�as

calendR(year = 2025,
        start = "M",
        special.days = "weekend") # Colorear los fines de semana

# Vector de NA de la misma longitud que n�mero de d�as del a�o
eventos <- rep(NA, 365)

# Establecemos los eventos en los d�as correspondientes
eventos[c(194,243,266,323)] <- "Cumplea�os"
eventos[c(1:5, 359:365)] <- "Vacaciones Navidad" 
eventos[213:228] <- "Vacaciones verano"

# Creamos el calendario con una leyenda
calendR(year = 2025,
        special.days = eventos,
        special.col = c("pink", "lightblue", "lightgreen"), # Colores
        legend.pos = "right",  # Leyenda a la derecha
        legend.title = "")     # T�tulo de la leyenda

# # 1.3 Calendario anual vertical
calendR(orientation = "portrait",  # Equivalente a: orientation = "p"
        months.pos = 0)            # Nombres de los meses a la izquierda

# 2 Calendarios mensuales en R
calendR(year = 2021, month = 7, special.days = 13,
        special.col = "lightblue")

# # 2.1 A�adiendo colores a los d�as
calendR(year = 2021, month = 7,
        special.days = c(1, 9, 12, 23, 28), # D�as con color
        special.col = "#bfe2f2", # Color de los eventos
        low.col = "white")       # Color del resto de d�as
# Vector de fechas
fechas <- seq(as.Date("2020-07-01"), as.Date("2020-07-31"), by = "1 day")

# Creamos un vector de NA y fines de semana
# (teniendo en cuenta que la semana empezar� en lunes)
eventos <- ifelse(format(fechas, "%w") %in% c(5, 6), "Fin de semana", NA)

# A�adimos m�s eventos
eventos[c(3, 5, 10, 12, 17, 19, 24, 26)] <- "Academia"
eventos[c(13, 27)] <- "Nataci�n"
eventos[30] <- "Examen"

# Creamos el calendario en R
calendR(year = 2021, month = 7,
        start = "M",
        special.days = eventos,
        special.col = c("lightgreen", "pink",  # Tantos colores
                        "#f7f7f7", "#bfe2f2"), # como n�mero de eventos
        low.col = "white",
        legend.pos = "bottom", # Posici�n de la leyenda
        legend.title = "")     # T�tulo de la leyenda

# # 2.2 Agregar texto a los d�as
calendR(year = 2021, month = 7,        # A�o y mes
        start = "M",                   # Empezar la semana en lunes
        text = c("Deporte", 
                 "Cumplea�os",
                 "Cocina\nLimpieza",   # A�adir texto sepearado \n
                 "Clase"),             # (solo para los calendarios mensuales)
        text.pos = c(5, 13, 16, 25),       # D�as en los que poner los textos
        text.size = 3.5,               # Tama�o de fuente de los textos
        text.col = 4)                  # Color de los textos

# # 2.3 Calendario lunar en ggplot2
calendR(month = 3,  
        lunar = TRUE,         # A�ade lunas al calendario mensual
        lunar.col = "gray60", # Color del �rea no visible de las lunas
        lunar.size = 7)       # Tama�o de las lunas

# 3 Fechas de inicio y fin personalizadas
calendR(start_date = "1962-06-01", # Fecha de inicio personalizada
        end_date = "1962-07-31")   # Fecha de fin personalizada

# # 3.1 Calendario acad�mico
calendR(start_date = "2020-09-01", # Fecha de inicio personalizada
        end_date = "2021-05-31",   # Fecha de fin personalizada
        start = "M",               # Comienzo de la semana en lunes
        mbg.col = 4,               # Color de fondo del nombre de los meses
        months.col = "white",      # Color del texto del nombre de los meses
        special.days = "weekend",  # Colorea los fines de semana
        special.col = "lightblue", # Color de los special.days
        lty = 0,                   # Tipo de linea
        bg.col = "#f4f4f4",        # Color de fondo
        title = "Calendario acad�mico 2020-2021", # T�tulo
        title.size = 30,                          # Tama�o del t�tulo
        orientation = "p")         # Orientaci�n vertical   

# 4 Calendario como mapa de calor en R
calendR(year = 2021,
        special.days = 1:365, # Vector de la misma longitud que el n�mero de d�as del a�o
        gradient = TRUE,      # Establece gradient = TRUE para crear el mapa de calor
        special.col = rgb(1, 0, 0, alpha = 0.6), # Color del degradado para los valores m�s altos
        low.col = "white")                       # Color del degradado para los valores m�s bajos

set.seed(2)

calendR(year = 2020,
        month = 5,
        special.days = rnorm(31),  # Vector de la misma longitud que el n�mero de d�as del mes
        gradient = TRUE,           # Establece gradient = TRUE para crear un mapa de calor
        special.col = "lightblue", # Color del degradado para los valores m�s altos
        low.col = "white")         # Color del degradado para los valores m�s bajos

set.seed(2)

calendR(year = 2021,
        month = 6,
        special.days = rnorm(30), 
        gradient = TRUE,
        special.col = "lightblue",
        legend.pos = "right",     # Posici�n de la leyenda (tambi�n "none", "top", "bottom" o "left")
        legend.title = "Leyenda")  # T�tulo de la leyenda

# 5 Personalizaci�n adicional de los calendarios
calendR(year = 2020,                      # A�o
        month = 10,                       # Mes
        start = "S",                      # Comienzo de la semana ("S": domingo, "M": lunes)
        title = "Mi calendario",          # Cambiar el t�tulo
        title.size = 30,                  # Tama�o de fuente del t�tulo
        title.col = 2,                    # Color del t�tulo
        subtitle = "Ten un\nbuen d�a",    # A�adir subt�tulo
        subtitle.col = 3,                 # Color del subt�tulo
        weeknames = c("D", "L", "M", "X", # Cambiar el nombre de los d�as
                      "J", "V", "S"), 
        special.days = "weekend",         # Colorear los fines de semana (tambi�n se puede poner un vector de d�as)
        special.col = rgb(0, 0, 1, 0.15), # Color de los d�as especiales
        col = "#f2f2f2",                  # Color de las l�neas del calendario
        lwd = 1,                          # Ancho de las l�neas del calendario
        lty = 1,                          # Tipo de l�nea del calendario
        font.family = "mono",             # Fuente de todos los textos              
        font.style = "bold",              # Estilo de todos los textos, excepto del subt�tulo
        weeknames.col = "gray30",         # Color de los nombres de los d�as de la semana
        months.col = "gray30",            # Si month = NULL, es el color del nombre de los meses
        days.col = 4,                     # Color del n�mero de d�as
        day.size = 3.5,                   # Tama�o del n�mero de d�as
        bg.img = "")                      # Imagen de fondo

calendR(month = 10,  # Mes
        start = "M", # La semana empieza en lunes
        orientation = "landscape", # Orientaci�n horizontal
        
        # Tama�o y color del t�tulo
        title.size = 40,
        title.col = "white",
        
        # Subt�tulo, color y tama�o del mismo
        subtitle = "Puedes quejarte o quejarte y arreglarlo",
        subtitle.col = "white",
        subtitle.size = 16,
        
        # Texto, color, tama�o y posici�n
        text = "Halloween",
        text.col = "red",
        text.size = 5,
        text.pos = 31,
        
        # Colorear los fines de semana de gris
        special.days = "weekend",
        special.col = "grey40",
        
        # Color de las l�neas, del fondo y
        # de los d�as
        col = "white",
        bg.col = "grey20",
        low.col = "transparent", # El mismo color que el fondo
        
        # Color y tama�o de los n�meros de los d�as
        days.col = "white",
        day.size = 4,
        
        # Fases de la luna y tama�o de las lunas
        lunar = TRUE,
        lunar.size = 8,
        
        # Color y tama�o del nombre de los d�as de la semana
        weeknames.col = "white",
        weeknames.size = 6,
        
        # Ancho y tipo de l�neas
        lwd = 0.25,
        lty = 1,
        
        # Tipograf�a y estilo de fuente
        font.family = "sans",
        font.style = "plain")
# Imagen de fondo (puede ser un enlace o una imagen local)
# Si es una imagen local debe estar en el directorio de trabajo
# o en otro caso se debe indicar la ruta completa de la imagen
img <- "https://i.pinimg.com/originals/10/1e/f6/101ef6a9e146b23de28fa2cd568ad17b.jpg"

calendR(start = "M",               # Las semanas empiezan en lunes
        mbg.col = 4,               # Color de fondo del nombre de los meses
        months.col = "white",      # Color del texto de los nombres de los meses
        special.days = "weekend",  # Colorea los fines de semana
        special.col = "lightblue", # Color de los special.days
        lty = 0,                   # Tipo de l�nea (sin l�nea)
        weeknames = c("Lu", "Ma",  # Nombres de los d�as de la semana
                      "Mi", "Ju",
                      "Vi", "Sa",
                      "Do"),
        title.size = 40,   # Tama�o del t�tulo
        orientation = "p", # Orientaci�n vertical
        bg.img = img)      # Imagen de fondo

# 6 Guardando los calendarios en PDF
calendR(year = 2021,
        orientation = "landscape", # Establece orientation = "portrait" para un calendario de 3 columnas
        pdf = TRUE,
        doc_name = "mi_calendario")  # Nombre del PDF (sin escribir la extensi�n)

calendR(year = 2021,
        orientation = "landscape", 
        pdf = TRUE,
        papersize = "A6",
        doc_name = 'mi_calendarioA6') # Elige el tama�o del papel

calendR(year = 2021,
        month = 1,
        orientation = "portrait",
        pdf = TRUE,
        doc_name = 'mi_calendarioP')
