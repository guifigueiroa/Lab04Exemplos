function bloco = substitui(bloco)

l = length(bloco);
potencias = (2.^[l-1:-1:0]);
decimal = bloco*potencias';
decimal = decimal + 1;
bloco = bitget(decimal,1:l);
