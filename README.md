# Canal_Codificacion_Decodificacion
Esta es la explicación de la practica de laboratorio 2

# Explicación de los Códigos y Funciones Utilizadas en el Proyecto

Este documento explica los scripts y funciones utilizados en el proyecto de simulación de comunicaciones digitales con y sin codificación Hamming(7,4).

1. SimulacionBER.m

Objetivo: Comparar la tasa de error de bit (BER) con y sin codificación FEC (Hamming(7,4)).

Flujo del código:




- El usuario elige el tipo de archivo a transmitir: texto, imagen o audio.
- El archivo es codificado usando las funciones de codificación fuente (`CFtexto`, `CFimagen`, `CFaudio`).
- Se simula la transmisión sin FEC usando `NCBECH`.
- Se simula la transmisión con FEC usando `hamming74labo` y `Hamming74dec_tabla`.
- Se calcula la BER para ambas transmisiones.
- Se promedian los resultados sobre N repeticiones.
- Se genera una gráfica comparativa en curva (lineal).

2. CFtexto.m

Objetivo: Leer un archivo de texto y convertirlo en una secuencia binaria.

Funcionamiento:

- Lee el contenido del archivo.
- Convierte cada carácter en su valor ASCII.
- Convierte el valor ASCII a binario.

3. CFimagen.m

Objetivo: Convertir una imagen en una secuencia binaria.

Funcionamiento:

- Lee la imagen y extrae sus dimensiones.
- Convierte cada componente RGB a su representación binaria.
- Salida: Secuencia binaria, alto y ancho de la imagen (para reconstruirla al decodificar).

4. CFaudio.m

Objetivo: Convertir un archivo de audio en secuencia binaria.

Funcionamiento:

- Lee un archivo WAV.
- Convierte las muestras de audio a enteros.
- Luego las convierte a binario.
- Salida: Secuencia binaria y frecuencia de muestreo.

5. hamming74labo.m

Objetivo: Codificar una secuencia binaria utilizando Hamming(7,4).

Funcionamiento:

- Divide la secuencia original en bloques de 4 bits.
- Aplica las reglas de codificación Hamming(7,4) a cada bloque.

6. Hamming74dec_tabla.m

Objetivo: Decodificar secuencias codificadas con Hamming(7,4).

Funcionamiento:

- Divide la secuencia recibida en bloques de 7 bits.
- Utiliza una tabla de síndromes para detectar y corregir errores.
- Devuelve los 4 bits originales por cada bloque.

7. NCBECH.m

Objetivo: Simular un canal binario simétrico con errores aleatorios.

Funcionamiento:

- Genera un vector de errores según la probabilidad `ProbErr`.
- Suma el vector de errores al vector original (mod 2).
- Devuelve la secuencia con errores.


8. MainTx.m:

- Realiza la codificación fuente y opcionalmente Hamming.
- Permite guardar la secuencia binaria como .txt.

9. MainRx.m:

- Recibe una secuencia binaria desde archivo.
- Aplica decodificación Hamming si se desea.
- Reconstruye el archivo original según el tipo (texto, imagen o audio).

_Notas:_ 


Todos los scripts y funciones fueron desarrollados en Octave. El flujo de transmisión con FEC mejora significativamente la calidad de la información recuperada bajo canales con errores, tal como fue comprobado en las simulaciones realizadas para texto, imagen y audio.

Se recomienda ejecutar los scripts desde el entorno de Octave y tener los archivos de prueba (texto, audio, imagen) ubicados en el mismo directorio para facilitar la ejecución.

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

