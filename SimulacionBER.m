% SimulacionBER.m
% Script que compara la tasa de error de bit (BER) usando y sin usar FEC (Hamming(7,4))
% para texto, imagen o audio

clc; clear;

% Número de repeticiones para promediar
N = 5;

% Probabilidad de error del canal
p = 0.1;

% Selección del tipo de información
fprintf("Seleccione el tipo de archivo a transmitir:\n1. Texto\n2. Imagen\n3. Audio\n");
opcion = input("Ingrese su opción (1/2/3): ");

% Entrada del archivo
archivo = input("Ingrese el nombre del archivo (incluya .txt, .jpg, .wav): ", 's');

% Codificación fuente
switch opcion
    case 1
        bitstr_original = CFtexto(archivo);
    case 2
        [bitstr_original, alto, ancho] = CFimagen(archivo);
    case 3
        [bitstr_original, fs] = CFaudio(archivo);
    otherwise
        error("Opción inválida.");
end

% Longitud de la secuencia original
L = length(bitstr_original);

% Prealocación de BER
BER_sinFEC = zeros(1, N);
BER_conFEC = zeros(1, N);

for i = 1:N
    %% SIN FEC
    salida = NCBECH(bitstr_original, p);
    errores = sum(bitstr_original ~= salida);
    BER_sinFEC(i) = errores / L;

    %% CON FEC
    bitstr_cod = hamming74labo(bitstr_original);
    salida_cod = NCBECH(bitstr_cod, p);
    bitstr_dec = Hamming74dec_tabla(salida_cod);

    % Ajustar longitud por si fue recortado
    minlen = min(length(bitstr_dec), length(bitstr_original));
    errores = sum(bitstr_original(1:minlen) ~= bitstr_dec(1:minlen));
    BER_conFEC(i) = errores / minlen;
end

% Promedios
BER1 = mean(BER_sinFEC);
BER2 = mean(BER_conFEC);

% Mostrar resultados
fprintf("BER sin FEC: %g\n", BER1);
fprintf("BER con FEC: %g\n", BER2);

% Graficar resultados con curvas
figure;
plot(1:N, BER_sinFEC, '-o', 'DisplayName', 'BER sin FEC', 'LineWidth', 2, 'MarkerSize', 6);
hold on;
plot(1:N, BER_conFEC, '-x', 'DisplayName', 'BER con FEC', 'LineWidth', 2, 'MarkerSize', 6);
xlabel('Número de simulación');
ylabel('BER (Tasa de Error de Bit)');
title('Comparación de BER con y sin Hamming(7,4)');
legend;
grid on;
