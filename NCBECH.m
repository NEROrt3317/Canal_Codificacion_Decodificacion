function SeqOut=NCBECH(SeqIn,ProbErr)
%  NCBECH simula un canal simétrico binario con errores de bit no correlacionados.
%     SecOut=NCBECH(SeqIn,ProbErr)...
%        "SeqIn" es la secuencia binaria de entrada.
%        "ProbError" es la probabilidad de error de bit.
%        "SeqOut" es la secuencia binaria de salida con errores.
%
%     Nota: Las secuencias binarias de entrada y salida están en formato string (cadenas de caracteres)

  VectorError=double(rand(1,length(SeqIn))<=ProbErr);
  SeqOut=str2num(SeqIn')';
  SeqOut=char(mod(SeqOut+VectorError,2)+48);
