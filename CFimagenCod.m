% imagen

[seqtx,y,x]=CFimagen('abeja.jpg');
seqrx=NCBECH(seqtx,0.001);

photo= DCFimagen(seqrx,y,x);
imagesc(photo);

% CALCULAR BER

BER= sum(seqtx~=seqrx)/length(seqtx)

