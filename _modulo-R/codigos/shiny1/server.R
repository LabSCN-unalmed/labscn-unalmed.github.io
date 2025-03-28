library(shiny)

# Archivo servidor
# Define la l�gica del servidor para reaccionar de acuerdo a la entrada.

shinyServer(function(input, output) {

  # Expresi�n que genera el histograma.
  # La expresi�n est� incluida en la funci�n renderPlot para indicar
  # que:
  # 1. Es "reactiva" y por lo tanto se ejecuta autom�ticamente
  #    cuando cambia la entrada.
  # 2. La salida es una gr�fica.
  output$despliegueGraf <- renderPlot({
    # Genera una distribuci�n normal con el n�mero de observaciones
    # indicada por la entrada.
    distribuci�n <- rnorm(input$observaciones)
    hist(distribuci�n)
  })
})