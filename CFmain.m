% TEXTO

seqtx=CFtexto('frase.txt');


seqrx=NCBECH(seqtx,0.001);

texto=DCFtexto(seqrx);

disp(texto);

