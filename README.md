# Canal_Codificacion_Decodificacion
Esta es la explicación de la practica de laboratorio 2

# Explicacion de todos los codigos 

```

```




## Informe de Resultados de Pruebas en Comunicación Digital
### Introducción
En este proyecto se han realizado pruebas de transmisión de datos utilizando tres tipos de información: texto, audio e imágenes. Estas pruebas se realizaron bajo un canal simulado con errores binarios, utilizando la codificación Hamming(7,4) para mejorar la fiabilidad de la transmisión (FEC). El objetivo es comparar la tasa de error de bits (BER) cuando se utiliza FEC frente a cuando no se usa.

### Metodología
Canal Simulado
Se simuló un canal binario simétrico con errores de bits no correlacionados. El canal introduce errores en la transmisión de datos según una probabilidad de error especificada (en este caso, 0.1).

#### Codificación y Decodificación
1. Codificación Hamming(7,4): Se utilizó un codificador de bloque Hamming(7,4) para mejorar la transmisión. Este codificador añade bits de paridad a la secuencia original para detectar y corregir errores.

2. Decodificación Hamming(7,4): Se implementó un proceso de decodificación para recuperar los datos transmitidos, utilizando la tabla de decodificación de Hamming.

Tipos de Información
Texto: Se utilizó un archivo de texto como fuente de datos.

Audio: Se utilizó un archivo de audio WAV, donde se convierte la señal de audio en una secuencia binaria.

Imagen: Se utilizó un archivo de imagen en formato JPEG o PNG, convirtiéndolo en una secuencia binaria.

### Simulación
Se realizó la simulación de transmisión con y sin codificación FEC y se compararon los resultados utilizando el parámetro BER. La simulación se repitió 5 veces para obtener un valor promedio.

#### Resultados
- Texto
1. Sin FEC: La tasa de error de bit (BER) para la transmisión de texto sin FEC fue significativamente mayor, lo que indica una alta probabilidad de error debido a la naturaleza del canal simulado.

2. Con FEC: Al utilizar FEC, la tasa de error de bit (BER) disminuyó considerablemente, mostrando la eficacia del codificador Hamming(7,4) para corregir errores y mejorar la fiabilidad de la transmisión.

- Audio
1. Sin FEC: En el caso del audio, sin FEC, los errores en la transmisión causaron una notable distorsión en el archivo de audio decodificado.

2. Con FEC: La codificación Hamming(7,4) mejoró la calidad del archivo de audio, reduciendo los errores y manteniendo la fidelidad del sonido original.

- Imagen
1. Sin FEC: Las imágenes transmitidas sin FEC mostraron una calidad degradada, con errores visibles en las áreas donde los bits fueron alterados debido al canal ruidoso.

2. Con FEC: Al utilizar FEC, la imagen recuperada mostró una calidad superior, con menos distorsiones y una representación más fiel de la imagen original.

### Conclusiones
Los resultados obtenidos muestran la importancia de la codificación FEC para mejorar la fiabilidad de la transmisión de datos en canales ruidosos. Sin FEC, la tasa de error de bit (BER) fue alta, lo que afectó negativamente a la calidad de la información transmitida, ya sea texto, audio o imagen. En cambio, con el uso de Hamming(7,4), se logró reducir significativamente el BER y mejorar la calidad de los archivos transmitidos.

##### Gráficas de Comparación
En las gráficas siguientes se comparan los valores de BER obtenidos con y sin FEC para los tres tipos de información. Como se puede observar, la línea que representa los resultados con FEC muestra una mejora sustancial respecto a los resultados sin FEC.

_NOTA:_ las graficas estan el documento word

