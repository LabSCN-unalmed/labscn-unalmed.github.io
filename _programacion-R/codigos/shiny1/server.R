library(shiny)

# Archivo servidor
# Define la lógica del servidor para reaccionar de acuerdo a la entrada.

shinyServer(function(input, output) {

  # Expresión que genera el histograma.
  # La expresión está incluida en la función renderPlot para indicar
  # que:
  # 1. Es "reactiva" y por lo tanto se ejecuta automáticamente
  #    cuando cambia la entrada.
  # 2. La salida es una gráfica.
  output$despliegueGraf <- renderPlot({
    # Genera una distribución normal con el número de observaciones
    # indicada por la entrada.
    distribución <- rnorm(input$observaciones)
    hist(distribución)
  })
})