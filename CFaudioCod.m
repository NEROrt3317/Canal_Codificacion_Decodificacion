% TEXTO

##seqtx=CFtexto('frase.txt');
##
##
##seqrx=NCBECH(seqtx,0.05);
##
##texto=DCFtexto(seqrx);
##
##disp(texto);

% audio

[seqtx,fs]=CFaudio('hola.wav');
seqrx=NCBECH(seqtx,0.00001);
sonido=DCFaudio(seqrx);
sound(2*sonido,fs);

