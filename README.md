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


