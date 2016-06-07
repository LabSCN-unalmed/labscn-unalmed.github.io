# -*- coding: utf-8 -*-
"""
Created on Fri Feb 19 06:19:49 2016

@author: gustavo
"""

#Importamos librerias
import numpy as np
import matplotlib.pyplot as plt

#Definimos valores para las variables
k = 0.5
phi = 3 

#Definimos el vector U y Z2 (correspondiente a la funciòn)
u = np.arange(0,10, 0.5)
z2 = u/phi
z2 = z2**2

#Definimos funciones exponencial
y1 = np.e**-(u/phi)
#Funciòn Gaussiana
y2 = np.e**-(z2)

#Graficamos
plt.figure()
plt.plot(u, y1, 'g')
plt.plot(u, y2, 'b')
plt.grid()
plt.show()

#Exponencial

pho = 0.05


