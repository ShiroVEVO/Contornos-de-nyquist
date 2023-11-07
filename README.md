# Contornos-de-nyquist

Ingeniería de Sistemas - Universidad Distrital Francisco José de Caldas  

**Asignatura:** Cibernetica I

**Docente:** Jhon Fredy Bayona Navarro


**Introducción**
Un contorno de Nyquist es una representación gráfica utilizada en el análisis de sistemas de control y teoría de control. Este gráfico muestra cómo un sistema responde a diferentes frecuencias de entrada en un plano complejo, Una de sus aplicaciones mas importantes es determinar la estabilidad de un sistema de control pues basta con mirar el el contorno rodea o no el punto critico del plano complejo, Asi mismo el numero de vueltas alrededor de ese punto obedecerá a Z-P con Z el numero de ceros y P el numero de polos de la función de transferencia. 

**Programa**
El programa diferencia dos situaciones: 
1. La función de transferencia no tiene polos ni zeros netamente imaginarios, en cuyo caso hace uso hace uso de un contorno C1 especial que corresponde a media circunferencia, considerando unicamente la parte real positiva del plano complejo en agregación con la linea recta que une ambos extremos de la circunferencia y se encuentra sobre el eje imaginario. En esta situación el contorno de nyquist funciona sin ningun problema y genera el contorno correspondiente

2. La función de transferencia tiene polos o ceros imaginarios, por tal razón los contornos de nyquis ordinarios no sirven dado que en lugar de generar un contorno finito que rodea el punto critico tiende a crear
funciones conicas infinitas que no rodean el punto critico de ninguna manera, Asi pues se plantea un contorno C2 a partir del contorno C1 en la medida que tambien será media circunferencia sin embargo usará circunferencias con un "RadioExclusion" seteado de 0.1 alrededor de cada polo o cero que se encuentre sobre el eje imaginario, Posteriormente tomará los puntos de el contorno C2 y los mapeará en el contorno de nyquist, es decir, reemplazará cada polo en la función de transferencia y al numero complejo resultante lo graficará en el mismo plano.
---