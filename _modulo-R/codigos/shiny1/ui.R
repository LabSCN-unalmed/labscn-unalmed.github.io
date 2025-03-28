library(shiny)

# Define la interfaz con el usuario (UI) para la aplicaci�n
# que muestra un histograma basado en el n�mero de observaciones
# tomadas al azar.


shinyUI(pageWithSidebar(
  
  # T�tulo de la aplicaci�n
  headerPanel("�Hola Shiny!"),
  
  # Barra lateral (sidebar) con un deslizador para seleccionar
  # el n�mero de observaciones
  sidebarPanel(
    sliderInput("observaciones", 
                "N�mero de observaciones", 
                min = 1,
                max = 1000, 
                value = 500)
  ),
  # Muestra el histograma del n�mero de observaciones seleccionado
  mainPanel(
    plotOutput("despliegueGraf")
  )
))