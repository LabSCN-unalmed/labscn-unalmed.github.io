library(shiny)

# Define la interfaz con el usuario (UI) para la aplicación
# que muestra un histograma basado en el número de observaciones
# tomadas al azar.


shinyUI(pageWithSidebar(
  
  # Título de la aplicación
  headerPanel("¡Hola Shiny!"),
  
  # Barra lateral (sidebar) con un deslizador para seleccionar
  # el número de observaciones
  sidebarPanel(
    sliderInput("observaciones", 
                "Número de observaciones", 
                min = 1,
                max = 1000, 
                value = 500)
  ),
  # Muestra el histograma del número de observaciones seleccionado
  mainPanel(
    plotOutput("despliegueGraf")
  )
))