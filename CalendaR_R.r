# Calendarios en R con GGPLOT2 https://r-coder.com/calendarios-r/
# 1 Calendario anual en R

library(calendR) # install.packages("calendR")

calendR() # Por defecto crea el calendario del año en curso
# Si no quieres los calendarios en el idioma de tu sistema operativo, 
# puedes modificarlo. Si quieres que los calendarios estén en 
# inglés, puedes escribir: Sys.setlocale("LC_ALL", "English") 
# antes de ejecutar la función calendR.

calendR(year = 2022) # Especifica el año deseado

# # 1.1 Comienzo de las semanas
calendR(year = 2022, start = 'M') # Comienzo las semanas en lunes

# # 1.2 Coloreando los días del calendario
calendR(year = 2025,
        start = "M",
        special.days = c(9, 19, 56, 79, 102,   # Días para colorear
                         126, 257, 300, 342),
        special.col = "lightblue",             # Color de los días especificados
#        special.days = c(194),
#        special.col = 589,
        low.col = "white")                     # Color de fondo del resto de días

calendR(year = 2025,
        start = "M",
        special.days = "weekend") # Colorear los fines de semana

# Vector de NA de la misma longitud que número de días del año
eventos <- rep(NA, 365)

# Establecemos los eventos en los días correspondientes
eventos[c(194,243,266,323)] <- "Cumpleaños"
eventos[c(1:5, 359:365)] <- "Vacaciones Navidad" 
eventos[213:228] <- "Vacaciones verano"

# Creamos el calendario con una leyenda
calendR(year = 2025,
        special.days = eventos,
        special.col = c("pink", "lightblue", "lightgreen"), # Colores
        legend.pos = "right",  # Leyenda a la derecha
        legend.title = "")     # Título de la leyenda

# # 1.3 Calendario anual vertical
calendR(orientation = "portrait",  # Equivalente a: orientation = "p"
        months.pos = 0)            # Nombres de los meses a la izquierda

# 2 Calendarios mensuales en R
calendR(year = 2021, month = 7, special.days = 13,
        special.col = "lightblue")

# # 2.1 Añadiendo colores a los días
calendR(year = 2021, month = 7,
        special.days = c(1, 9, 12, 23, 28), # Días con color
        special.col = "#bfe2f2", # Color de los eventos
        low.col = "white")       # Color del resto de días
# Vector de fechas
fechas <- seq(as.Date("2020-07-01"), as.Date("2020-07-31"), by = "1 day")

# Creamos un vector de NA y fines de semana
# (teniendo en cuenta que la semana empezará en lunes)
eventos <- ifelse(format(fechas, "%w") %in% c(5, 6), "Fin de semana", NA)

# Añadimos más eventos
eventos[c(3, 5, 10, 12, 17, 19, 24, 26)] <- "Academia"
eventos[c(13, 27)] <- "Natación"
eventos[30] <- "Examen"

# Creamos el calendario en R
calendR(year = 2021, month = 7,
        start = "M",
        special.days = eventos,
        special.col = c("lightgreen", "pink",  # Tantos colores
                        "#f7f7f7", "#bfe2f2"), # como número de eventos
        low.col = "white",
        legend.pos = "bottom", # Posición de la leyenda
        legend.title = "")     # Título de la leyenda

# # 2.2 Agregar texto a los días
calendR(year = 2021, month = 7,        # Año y mes
        start = "M",                   # Empezar la semana en lunes
        text = c("Deporte", 
                 "Cumpleaños",
                 "Cocina\nLimpieza",   # Añadir texto sepearado \n
                 "Clase"),             # (solo para los calendarios mensuales)
        text.pos = c(5, 13, 16, 25),       # Días en los que poner los textos
        text.size = 3.5,               # Tamaño de fuente de los textos
        text.col = 4)                  # Color de los textos

# # 2.3 Calendario lunar en ggplot2
calendR(month = 3,  
        lunar = TRUE,         # Añade lunas al calendario mensual
        lunar.col = "gray60", # Color del área no visible de las lunas
        lunar.size = 7)       # Tamaño de las lunas

# 3 Fechas de inicio y fin personalizadas
calendR(start_date = "1962-06-01", # Fecha de inicio personalizada
        end_date = "1962-07-31")   # Fecha de fin personalizada

# # 3.1 Calendario académico
calendR(start_date = "2020-09-01", # Fecha de inicio personalizada
        end_date = "2021-05-31",   # Fecha de fin personalizada
        start = "M",               # Comienzo de la semana en lunes
        mbg.col = 4,               # Color de fondo del nombre de los meses
        months.col = "white",      # Color del texto del nombre de los meses
        special.days = "weekend",  # Colorea los fines de semana
        special.col = "lightblue", # Color de los special.days
        lty = 0,                   # Tipo de linea
        bg.col = "#f4f4f4",        # Color de fondo
        title = "Calendario académico 2020-2021", # Título
        title.size = 30,                          # Tamaño del título
        orientation = "p")         # Orientación vertical   

# 4 Calendario como mapa de calor en R
calendR(year = 2021,
        special.days = 1:365, # Vector de la misma longitud que el número de días del año
        gradient = TRUE,      # Establece gradient = TRUE para crear el mapa de calor
        special.col = rgb(1, 0, 0, alpha = 0.6), # Color del degradado para los valores más altos
        low.col = "white")                       # Color del degradado para los valores más bajos

set.seed(2)

calendR(year = 2020,
        month = 5,
        special.days = rnorm(31),  # Vector de la misma longitud que el número de días del mes
        gradient = TRUE,           # Establece gradient = TRUE para crear un mapa de calor
        special.col = "lightblue", # Color del degradado para los valores más altos
        low.col = "white")         # Color del degradado para los valores más bajos

set.seed(2)

calendR(year = 2021,
        month = 6,
        special.days = rnorm(30), 
        gradient = TRUE,
        special.col = "lightblue",
        legend.pos = "right",     # Posición de la leyenda (también "none", "top", "bottom" o "left")
        legend.title = "Leyenda")  # Título de la leyenda

# 5 Personalización adicional de los calendarios
calendR(year = 2020,                      # Año
        month = 10,                       # Mes
        start = "S",                      # Comienzo de la semana ("S": domingo, "M": lunes)
        title = "Mi calendario",          # Cambiar el título
        title.size = 30,                  # Tamaño de fuente del título
        title.col = 2,                    # Color del título
        subtitle = "Ten un\nbuen día",    # Añadir subtítulo
        subtitle.col = 3,                 # Color del subtítulo
        weeknames = c("D", "L", "M", "X", # Cambiar el nombre de los días
                      "J", "V", "S"), 
        special.days = "weekend",         # Colorear los fines de semana (también se puede poner un vector de días)
        special.col = rgb(0, 0, 1, 0.15), # Color de los días especiales
        col = "#f2f2f2",                  # Color de las líneas del calendario
        lwd = 1,                          # Ancho de las líneas del calendario
        lty = 1,                          # Tipo de línea del calendario
        font.family = "mono",             # Fuente de todos los textos              
        font.style = "bold",              # Estilo de todos los textos, excepto del subtítulo
        weeknames.col = "gray30",         # Color de los nombres de los días de la semana
        months.col = "gray30",            # Si month = NULL, es el color del nombre de los meses
        days.col = 4,                     # Color del número de días
        day.size = 3.5,                   # Tamaño del número de días
        bg.img = "")                      # Imagen de fondo

calendR(month = 10,  # Mes
        start = "M", # La semana empieza en lunes
        orientation = "landscape", # Orientación horizontal
        
        # Tamaño y color del título
        title.size = 40,
        title.col = "white",
        
        # Subtítulo, color y tamaño del mismo
        subtitle = "Puedes quejarte o quejarte y arreglarlo",
        subtitle.col = "white",
        subtitle.size = 16,
        
        # Texto, color, tamaño y posición
        text = "Halloween",
        text.col = "red",
        text.size = 5,
        text.pos = 31,
        
        # Colorear los fines de semana de gris
        special.days = "weekend",
        special.col = "grey40",
        
        # Color de las líneas, del fondo y
        # de los días
        col = "white",
        bg.col = "grey20",
        low.col = "transparent", # El mismo color que el fondo
        
        # Color y tamaño de los números de los días
        days.col = "white",
        day.size = 4,
        
        # Fases de la luna y tamaño de las lunas
        lunar = TRUE,
        lunar.size = 8,
        
        # Color y tamaño del nombre de los días de la semana
        weeknames.col = "white",
        weeknames.size = 6,
        
        # Ancho y tipo de líneas
        lwd = 0.25,
        lty = 1,
        
        # Tipografía y estilo de fuente
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
        lty = 0,                   # Tipo de línea (sin línea)
        weeknames = c("Lu", "Ma",  # Nombres de los días de la semana
                      "Mi", "Ju",
                      "Vi", "Sa",
                      "Do"),
        title.size = 40,   # Tamaño del título
        orientation = "p", # Orientación vertical
        bg.img = img)      # Imagen de fondo

# 6 Guardando los calendarios en PDF
calendR(year = 2021,
        orientation = "landscape", # Establece orientation = "portrait" para un calendario de 3 columnas
        pdf = TRUE,
        doc_name = "mi_calendario")  # Nombre del PDF (sin escribir la extensión)

calendR(year = 2021,
        orientation = "landscape", 
        pdf = TRUE,
        papersize = "A6",
        doc_name = 'mi_calendarioA6') # Elige el tamaño del papel

calendR(year = 2021,
        month = 1,
        orientation = "portrait",
        pdf = TRUE,
        doc_name = 'mi_calendarioP')
